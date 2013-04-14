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
    el: '#quests'

    collection: null

    initialize: (options) ->
      _this = this
      @collection = new QuestCollection
      @collection.on 'sync', ->
        options.itemCollection.invoke 'getQuests', this
        _this.render()

    render: ->
      data = @collection.toJSON()
      @$el.append(Mustache.render(template, data))

      # Return (exports)
  QuestView
)
