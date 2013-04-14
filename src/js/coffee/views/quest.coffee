'use strict'

define([
  'mustache'
  'collections/quest'
  'text!tmpl/quest.html!strip'
], (
  Mustache
  QuestCollection
  template
) ->
  class QuestView extends Backbone.View
    el: '#questsPage'

    collection: null

    initialize: (options) ->
      _this = this
      @$el.hide()
      @collection = new QuestCollection

      # Call `itemCollection.getQuests()` to emulate many-to-many
      # relationship betweet quests and items
      @collection.on 'sync', ->
        options.itemCollection.invoke 'getQuests', this
        _this.trigger 'ready'
        _this.render()

    render: ->
      data = @collection.toJSON()
      @$el.append(Mustache.render(template, data))

    show: (ms) ->
      @$el.show(ms)

    hide: (ms) ->
      @$el.hide(ms)

  # Return (exports)
  QuestView
)
