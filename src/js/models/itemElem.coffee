'use strict'

define([
  'backbone'
], (
  Backbone
) ->
  # 武器元素属性
  class ItemElem extends Backbone.Model

    dataStore: {}

    setDataStore: (@dataStore) ->

  # Return (exports)
  ItemElem
)
