'use strict'

define([
  'models/itemType',
  'models/itemElem',
  'models/itemRange'
], (
  ItemType,
  ItemElem,
  ItemRange
) ->
  # 供物系列（比如同一供物的大中小三级，算3个不同的Item，组成一个ItemSeries）
  class ItemSeries extends Backbone.RelationalModel
    relations: [{
    # 每个系列有一种类型
      type: Backbone.HasOne
      key: 'type'
      relatedModel: ItemType
      reverseRelation: {
        key: 'itemSerieses'
        includeInJSON: ['id', 'name']
      }
    }, {
    # 每个系列有一种元素属性
      type: Backbone.HasOne
      key: 'elem'
      relatedModel: ItemElem
      reverseRelation: {
        key: 'itemSerieses'
        includeInJSON: ['id', 'name']
      }
    }, {
    # 每个系列有一个射程 / 范围
      type: Backbone.HasOne
      key: 'range'
      relatedModel: ItemRange
      reverseRelation: {
        key: 'itemSerieses'
        includeInJSON: ['id', 'name']
      }
    }]
)