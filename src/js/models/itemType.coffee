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

    # Overwrite `toJSON()` function.
    toJSON: (keys) ->
      # Deep clone the @attributes object
      json = $.extend true, {}, @attributes

      # Filter keys
      if keys?
        json = _.pick json, keys

      json


  # Return (exports)
  ItemType
)
