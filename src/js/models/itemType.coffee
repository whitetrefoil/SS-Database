'use strict'

define([
  'backbone'
], (
  Backbone
) ->
  # 道具类型 / 武器类型
  class ItemType extends Backbone.Model

    dataStore: {}

    setDataStore: (@dataStore) ->

  # Return (exports)
  ItemType
)
