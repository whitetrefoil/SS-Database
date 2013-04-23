'use strict'

define([
  'backbone'
], (
  Backbone
) ->
  # 魔物
  class Monster extends Backbone.Model

    dataStore: {}

    setDataStore: (@dataStore) ->

  # Return (exports)
  Monster
)
