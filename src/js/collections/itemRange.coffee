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

    isReady: false

    setDataStore: (@dataStore) ->
      @once 'sync', =>
        @invoke 'setDataStore', @dataStore
        @isReady = true

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  ItemRangeCollection
)
