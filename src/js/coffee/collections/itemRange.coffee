'use strict'

define([
  'models/itemRange'
], (
  ItemRange
) ->
  class ItemRangeCollection extends Backbone.Collection
    model: ItemRange
    url: 'data/item_range.json'

    dataStore: {}

    setDataStore: (@dataStore) ->
      @once 'sync', =>
        @invoke 'setDataStore', @dataStore

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  ItemRangeCollection
)
