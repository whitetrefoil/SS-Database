'use strict'

define([
  'models/itemElem'
], (
  ItemElem
) ->
  class ItemElemCollection extends Backbone.Collection
    model: ItemElem
    url: 'data/item_elem.json'

    initialize: ->
      @fetch()
)
