'use strict'

define([
  'models/itemSeries'
], (
  ItemSeries
) ->
  class ItemSeriesCollection extends Backbone.Collection
    model: ItemSeries
    url: 'data/item_series.json'

    dataStore: {}

    setDataStore: (@dataStore) ->
      @invoke 'setDataStore', @dataStore

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  ItemSeriesCollection
)
