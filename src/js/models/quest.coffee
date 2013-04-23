'use strict'

define([
  'backbone'
  'models/item'
], (
  Backbone
  Item
) ->
  # 任务
  class Quest extends Backbone.Model

    dataStore: {}

    setDataStore: (@dataStore) ->

  # Return (exports)
  Quest
)
