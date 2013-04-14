'use strict'

define([
  'models/quest'
], (
  Quest
) ->
  class QuestCollection extends Backbone.Collection
    model: Quest
    url: 'data/quest.json'

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  QuestCollection
)
