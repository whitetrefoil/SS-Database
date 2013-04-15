'use strict'

define([
  'backbone'
], (
  Backbone
)->
  # 道具范围 / 武器射程
  class ItemRange extends Backbone.Model

    dataStore: {}

    setDataStore: (@dataStore) ->

  # Return (exports)
  ItemRange
)
