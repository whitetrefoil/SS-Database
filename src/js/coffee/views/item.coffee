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
    parent: '#items'

    collection: new ItemCollection

    initialize: ->
      list = $('<dl></dl>')
      list.appendTo @parent
      @parent = list
      @render()

    render: ->
      data = @collection.toJSON()
      @parent.append(Mustache.render(template, data))

  # Return (exports)
  ItemView
)
