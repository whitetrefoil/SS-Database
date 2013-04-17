'use strict'

define([
  'models/quest'
], (
  Quest
) ->
  class QuestCollection extends Backbone.Collection
    model: Quest
    url: 'data/quest.json'

    dataStore: {}

    isReady: false

    setDataStore: (@dataStore) ->
      @once 'sync', =>
        @invoke 'setDataStore', @dataStore
        @isReady = true

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  QuestCollection
)
