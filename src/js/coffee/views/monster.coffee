'use strict'

define([
  'backbone'
  'mustache'
  'data'
  'text!tmpl/monster.html'
], (
  Backbone
  Mustache
  DataStore
  template
) ->
  class MonsterView extends Backbone.View
    el: '#monstersPage'

    collection: DataStore.monsters

    initialize: ->
      @$el.hide()
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
  MonsterView
)
