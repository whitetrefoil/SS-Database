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
    el: '#monsters'

    collection: null

    initialize: ->
      @collection = new MonsterCollection
      @collection.on 'sync', =>
        @render()

    render: ->
      data = @collection.toJSON()
      @$el.append(Mustache.render(template, data))

  # Return (exports)
  MonsterView
)
