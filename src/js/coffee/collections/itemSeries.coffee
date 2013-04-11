'use strict'

define([
  'models/itemSeries'
], (
  ItemSeries
) ->
  class ItemSeriesCollection extends Backbone.Collection
    model: ItemSeries
    url: 'data/item_series.json'

    initialize: ->
      @fetch()
)
