'use strict'

define([
  'backbone'
  'models/itemSeries'
  'backbone-relational'
], (
  Backbone
  ItemSeries
) ->
  # 供物 （同一供物不同★数不单独算，但大中小等级单独算）
  class Item extends Backbone.RelationalModel
    relations: [{
    # 每个供物有（属于）一个系列
      type: Backbone.HasOne
      key: 'itemSeriesId'
      relatedModel: ItemSeries
      includeInJSON: ['id']
      reverseRelation: {
        key: 'items'
      }
    }]

    quests: []

    getQuests: (questCollection) ->
      @quests = questCollection.filter (questModel) =>
        questModel.get('rewards').findWhere({id: @get('id')}) isnt undefined

)
