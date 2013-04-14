'use strict'

define([
  'mustache'
  'collections/monster'
  'text!tmpl/monster.html'
], (
  Mustache
  MonsterCollection
  template
) ->
  class MonsterView extends Backbone.View
    parent: '#monsters'

    collection: new MonsterCollection

    initialize: ->
      list = $('<dl></dl>')
      list.appendTo @parent
      @parent = list
      @render()

    render: ->
      data = @collection.toJSON()
      @parent.append(Mustache.render(template, data))

  # Return (exports)
  MonsterView
)
