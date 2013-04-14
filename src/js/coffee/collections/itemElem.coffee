'use strict'

define([
  'models/itemElem'
], (
  ItemElem
) ->
  class ItemElemCollection extends Backbone.Collection
    model: ItemElem
    url: 'data/item_elem.json'

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  ItemElemCollection
)
