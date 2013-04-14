'use strict'

define([
  'models/item'
], (
  Item
) ->
  class ItemCollection extends Backbone.Collection
    model: Item
    url: 'data/item.json'

    initialize: ->
      @fetch()

  # Return (exports)
  ItemCollection
)
