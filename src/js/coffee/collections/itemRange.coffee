'use strict'

define([
  'models/itemRange'
], (
  ItemRange
) ->
  class ItemRangeCollection extends Backbone.Collection
    model: ItemRange
    url: 'data/item_range.json'

    initialize: ->
      @fetch()
)
