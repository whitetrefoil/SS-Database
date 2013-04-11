'use strict'

define([
  'models/quest'
], (
  Quest
) ->
  class QuestCollection extends Backbone.Collection
    model: Quest
    url: 'data/quest.json'
    initialize: ->
      @fetch()
)
