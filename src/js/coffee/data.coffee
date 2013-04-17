'use strict'

define([
  'backbone'
  'collections/item'
  'collections/itemElem'
  'collections/itemRange'
  'collections/itemSeries'
  'collections/itemType'
  'collections/monster'
  'collections/quest'
], (
  Backbone
  ItemCollection
  ItemElemCollection
  ItemRangeCollection
  ItemSeriesCollection
  ItemTypeCollection
  MonsterCollection
  QuestCollection
) ->
  checkReadyDataStores = (dataStore) ->
    isAllReady = true

    for key of dataStore
      unless dataStore[key].isReady
        isAllReady = false
        break

    isAllReady

  waitForDataStore = (callback) ->
    dataStore = {}

    dataStore.items = new ItemCollection
    dataStore.itemElems = new ItemElemCollection
    dataStore.itemRanges = new ItemRangeCollection
    dataStore.itemSerieses = new ItemSeriesCollection
    dataStore.itemTypes = new ItemTypeCollection
    dataStore.monsters = new MonsterCollection
    dataStore.quests = new QuestCollection

    for key of dataStore
      dataStore[key].setDataStore dataStore
      dataStore[key].once 'sync', ->
        if checkReadyDataStores(dataStore)
          callback(dataStore)
        else
          # Do nothing

  # Return (exports)
  waitForDataStore

)
