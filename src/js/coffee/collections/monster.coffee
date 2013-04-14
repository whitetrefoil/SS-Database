'use strict'

define([
  'models/monster'
], (
  Monster
) ->
  class MonsterCollection extends Backbone.Collection
    model: Monster
    url: 'data/monster.json'
    initialize: ->
      @fetch()

  # Return (exports)
  MonsterCollection
)
