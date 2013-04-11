'use strict'

define([
  'models/item'
], (
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
