'use strict'

define([
  'backbone'
  'mustache'
  'text!tmpl/quest.html!strip'
], (
  Backbone
  Mustache
  template
) ->
  class QuestView extends Backbone.View
    el: '#questsPage'

    renderTemplate: Mustache.compile(template)

    initialize: (options) ->
      @$el.hide()
      @dataStore = options.dataStore
      @collection = @dataStore.quests
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
  QuestView
)
