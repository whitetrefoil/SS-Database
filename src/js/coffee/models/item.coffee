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

  # Return (exports)
  Item
)
