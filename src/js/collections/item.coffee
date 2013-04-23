'use strict'

define([
  'models/item'
], (
  Item
) ->
  class ItemCollection extends Backbone.Collection
    model: Item
    url: 'data/item.json'

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
  ItemCollection
)
