'use strict'

define([
  'collections/item'
  'collections/itemElem'
  'collections/itemRange'
  'collections/itemSeries'
  'collections/itemType'
  'collections/monster'
  'collections/quest'
], (
  ItemCollection
  ItemElemCollection
  ItemRangeCollection
  ItemSeriesCollection
  ItemTypeCollection
  MonsterCollection
  QuestCollection
) ->
  DataStore = {}

  DataStore.items = new ItemCollection
  DataStore.itemElems = new ItemElemCollection
  DataStore.itemRanges = new ItemRangeCollection
  DataStore.itemSerieses = new ItemSeriesCollection
  DataStore.itemTypes = new ItemTypeCollection
  DataStore.monsters = new MonsterCollection
  DataStore.quests = new QuestCollection

  # Return (exports)
  DataStore
)
