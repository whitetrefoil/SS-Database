'use strict'

define([
  'models/itemElem'
], (
  ItemElem
) ->
  class ItemElemCollection extends Backbone.Collection
    model: ItemElem
    url: 'data/item_elem.json'

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
  ItemElemCollection
)
