'use strict'

define([
  'backbone'
  'models/itemType'
  'models/itemElem'
  'models/itemRange'
], (
  Backbone
  ItemType
  ItemElem
  ItemRange
) ->
  # 供物系列（比如同一供物的大中小三级，算3个不同的Item，组成一个ItemSeries）
  class ItemSeries extends Backbone.Model

    name: () ->
      if @get('items') and @get('items').models.length > 0
        @get('items').models[0].get('name').replace(/（.*）/, '')
      else
        null

  # Return (exports)
  ItemSeries
)
