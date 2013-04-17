'use strict'

define([
  'backbone'
  'mustache'
  'text!tmpl/monster.html'
], (
  Backbone
  Mustache
  template
) ->
  class MonsterView extends Backbone.View
    el: '#monstersPage'

    renderTemplate: Mustache.compile(template)

    initialize: (options) ->
      @$el.hide()
      @dataStore = options.dataStore
      @collection = @dataStore.monsters
      @trigger 'ready'
      @render()

    render: ->
      data = @collection.toJSON()
      @$el.html(@renderTemplate(data))

    show: (ms) ->
      @$el.show(ms)

    hide: (ms) ->
      @$el.hide(ms)

  # Return (exports)
  MonsterView
)
