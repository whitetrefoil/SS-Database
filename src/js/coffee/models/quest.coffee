'use strict'

define([
  'backbone',
  'models/item',
  'backbone-relational'
], (
  Backbone,
  Item
) ->
  # 任务
  class Quest extends Backbone.RelationalModel
    relations: [{
      type: Backbone.HasMany
      key: 'rewards'
      relatedModel: Item
      includeInJSON: true
    }]
)
