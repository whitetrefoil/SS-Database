'use strict'

define([
  'models/itemType'
], (
  ItemType
) ->
  class ItemTypeCollection extends Backbone.Collection
    model: ItemType
    url: 'data/item_type.json'

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  ItemTypeCollection
)
