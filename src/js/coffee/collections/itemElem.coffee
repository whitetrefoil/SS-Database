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

    setDataStore: (@dataStore) ->
      @invoke 'setDataStore', @dataStore

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  ItemElemCollection
)
