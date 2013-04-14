'use strict'

define([
  'mustache'
  'collections/item'
  'text!tmpl/item.html!strip'
], (
  Mustache
  ItemCollection
  template
) ->
  class ItemView extends Backbone.View
    el: '#items'

    collection: null

    initialize: ->
      @collection = new ItemCollection
      @collection.on 'sync', =>
        @render()

    render: ->
      data = @collection.toJSON()
      @$el.append(Mustache.render(template, data))

  # Return (exports)
  ItemView
)
