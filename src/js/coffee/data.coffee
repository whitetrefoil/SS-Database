'use strict'

define([
  'collections/item',
  'collections/itemElem',
  'collections/itemRange',
  'collections/itemSeries',
  'collections/itemType',
  'collections/monster',
  'collections/quest',
], (
  ItemCollection,
  ItemElemCollection,
  ItemRangeCollection
  ItemSeriesCollection,
  ItemTypeCollection,
  MonsterCollection,
  QuestCollection,
) ->
  # ### Initializing / Loading Data ###
  exports = {}
  exports.itemElems = new ItemElemCollection
  exports.itemTypes = new ItemTypeCollection
  exports.itemRanges = new ItemRangeCollection
  exports.itemSerieses = new ItemSeriesCollection
  exports.items = new ItemCollection
  exports.quests = new QuestCollection
  exports.quests.on 'sync', () ->
    # Initialize Quest Data in Items
    exports.items.invoke('getQuests', this)
  exports.monsters = new MonsterCollection

  exports
)
