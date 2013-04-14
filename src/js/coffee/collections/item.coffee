'use strict'

define([
  'models/item'
], (
  Item
) ->
  class ItemCollection extends Backbone.Collection
    model: Item
    url: 'data/item.json'

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  ItemCollection
)
