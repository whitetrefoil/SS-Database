'use strict'

define([
  'models/monster'
], (
  Monster
) ->
  class MonsterCollection extends Backbone.Collection
    model: Monster
    url: 'data/monster.json'

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
  MonsterCollection
)
