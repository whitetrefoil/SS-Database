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

    # Overwrite `toJSON()` function.
    toJSON: (keys) ->
      # Deep clone the @attributes object
      json = $.extend true, {}, @attributes

      # Filter keys
      if keys?
        json = _.pick json, keys

      json


  # Return (exports)
  ItemElem
)
