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
    el: '#monstersPage'

    collection: null

    initialize: ->
      @$el.hide()
      @collection = new MonsterCollection
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
