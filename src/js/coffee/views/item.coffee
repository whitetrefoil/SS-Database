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
    el: '#itemsPage'

    collection: null

    initialize: ->
      @$el.hide()
      @collection = new ItemCollection
      @collection.on 'sync', =>
        @trigger 'ready'
        @render()

    render: ->
      data = @collection.toJSON()
      @$el.append(Mustache.render(template, data))

    show: (ms) ->
      @$el.show(ms)

    hide: (ms) ->
      @$el.hide(ms)

  # Return (exports)
  ItemView
)
