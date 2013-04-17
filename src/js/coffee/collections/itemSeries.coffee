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

    isReady: false

    setDataStore: (@dataStore) ->
      @once 'sync', =>
        @invoke 'setDataStore', @dataStore
        @isReady = true

    # Load data once constructed
    initialize: ->
      @fetch()

  # Return (exports)
  ItemSeriesCollection
)
