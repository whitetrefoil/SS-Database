'use strict'

define([
  'models/itemType'
], (
  ItemType
) ->
  class ItemTypeCollection extends Backbone.Collection
    model: ItemType
    url: 'data/item_type.json'

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
  ItemTypeCollection
)
