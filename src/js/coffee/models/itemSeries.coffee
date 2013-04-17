'use strict'

define([
  'underscore'
  'backbone'
], (
  _
  Backbone
) ->
  # 供物系列（比如同一供物的大中小三级，算3个不同的Item，组成一个ItemSeries）
  class ItemSeries extends Backbone.Model

    dataStore: {}

    setDataStore: (@dataStore) ->

    name: () ->
      if @get('items') and @get('items').models.length > 0
        @get('items').models[0].get('name').replace(/（.*）/, '')
      else
        null

    items: () ->
      _this = this
      if @dataStore.items?
        @dataStore.items.filter (item) ->
          item.get('itemSeriesId') is _this.attributes['id']

    type: () ->
      if @dataStore.itemTypes?
        @dataStore.itemTypes.findWhere(
          id: @attributes['type']
        )

    elem: () ->
      if @dataStore.itemElems?
        @dataStore.itemElems.findWhere(
          id: @attributes['elem']
        )

    range: () ->
      if @dataStore.itemRanges
        @dataStore.itemRanges.findWhere(
          id: @attributes['range']
        )

    # Overwrite `toJSON()` function.
    toJSON: (keys) ->
      json = @attributes

      # Filter keys
      if keys?
        json = _.pick json, keys

      for key of json
        if typeof this[key] is 'function'
          json[key] = this[key]()
          if json[key].toJSON and typeof json[key].toJSON is 'function'
            json[key] = json[key].toJSON()

      json


  # Return (exports)
  ItemSeries
)
