'use strict'

define([
  'backbone'
  'mustache'
  'data'
  'text!tmpl/quest.html!strip'
], (
  Backbone
  Mustache
  DataStore
  template
) ->
  class QuestView extends Backbone.View
    el: '#questsPage'

    collection: DataStore.quests

    renderTemplate: Mustache.compile(template)

    initialize: () ->
      _this = this
      @$el.hide()

      # Call `itemCollection.getQuests()` to emulate many-to-many
      # relationship betweet quests and items
      @collection.on 'sync', ->
        _this.trigger 'ready'
        _this.render()

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
