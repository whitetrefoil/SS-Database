'use strict'

define([
  'backbone'
  'models/itemSeries'
], (
  Backbone
  ItemSeries
) ->
  # 供物 （同一供物不同★数不单独算，但大中小等级单独算）
  class Item extends Backbone.Model

    dataStore: {}

    setDataStore: (@dataStore) ->

    quests: []

    # Manually call once ItemCollection and QuestCollection are both finished loading
    getQuests: (questCollection) ->
      @quests = questCollection.filter (questModel) =>
        questModel.get('rewards').findWhere({id: @get('id')}) isnt undefined

    # Overwrite `toJSON()` function.
    toJSON: (keys) ->
      # Deep clone the @attributes object
      json = $.extend true, {}, @attributes

      # Filter keys
      if keys?
        json = _.pick json, keys

      # If there's a function has same name of this key in this instance,
      # use the return value instead the value in @attibutes
      for key of json
        if typeof this[key] is 'function'
          json[key] = this[key]()
          if json[key].toJSON and typeof json[key].toJSON is 'function'
            json[key] = json[key].toJSON()

      if json['count']?
        json['count1'] = json['count'] + 1
        json['count2'] = json['count'] + 2
        json['count3'] = json['count'] + 3

      json = _.defaults json, {
        count: '-'
        count1: '-'
        count2: '-'
        count3: '-'
        time: '-'
        effect: '-'
      }

      json

  # Return (exports)
  Item
)
