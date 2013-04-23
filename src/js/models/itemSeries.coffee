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

    name: (firstItem) ->
      firstItem['name'].replace(/（.*）/, '')

    items: () ->
      _this = this
      itemModels = @dataStore.items.filter (item) ->
        item.get('itemSeriesId') is _this.attributes['id']
      for item, i in itemModels
        itemModels[i] = item.toJSON()
      itemModels

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
      # Deep clone the @attributes object
      json = $.extend true, {}, @attributes

      # Filter keys
      if keys?
        json = _.pick json, keys

      # If there's a function has same name of this key in this instance,
      # use the return value instead the value in @attibutes
      for key of json
        if typeof this[key] is 'function'
          json[key] = this[key]()
          if json[key].toJSON and typeof json[key].toJSON is 'function'
            json[key] = json[key].toJSON()

      json['items'] = @items()
      # Dynamically generate item series name.
      json['name'] = @name(json['items'][0])

      json


  # Return (exports)
  ItemSeries
)
