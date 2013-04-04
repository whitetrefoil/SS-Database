# Models, Collections, Views or any other scripts relative to data
# which will be removed from static version.

'use strict'

# ### Pre-defined Veriable ###

# If property is _NOT_ set, use this instead
NULL_REPLACE = '-'

# Items
# ----------

# ### Models ###
#
# 数据结构直接从JSON里读，就不用声明了

# 武器元素属性
class ItemElem extends Backbone.RelationalModel

# 道具类型 / 武器类型
class ItemType extends Backbone.RelationalModel

# 道具范围 / 武器射程
class ItemRange extends Backbone.RelationalModel

# 供物系列（比如同一供物的大中小三级，算3个不同的Item，组成一个ItemSeries）
class ItemSeries extends Backbone.RelationalModel
  relations: [{
    # 每个系列有一种类型
    type: Backbone.HasOne
    key: 'type'
    relatedModel: ItemType
    reverseRelation: {
      relatedCollection: ItemSeriesCollection
      key: 'itemSerieses'
      includeInJSON: ['id', 'name']
    }
  }, {
    # 每个系列有一种元素属性
    type: Backbone.HasOne
    key: 'elem'
    relatedModel: ItemElem
    reverseRelation: {
      relatedCollection: ItemSeriesCollection
      key: 'itemSerieses'
      includeInJSON: ['id', 'name']
    }
  }, {
    # 每个系列有一个射程 / 范围
    type: Backbone.HasOne
    key: 'range'
    relatedModel: ItemRange
    reverseRelation: {
      relatedCollection: ItemSeriesCollection
      key: 'itemSerieses'
      includeInJSON: ['id', 'name']
    }
  }]

# 供物 （同一供物不同★数不单独算，但大中小等级单独算）
class Item extends Backbone.RelationalModel
  relations: [{
    # 每个供物有（属于）一个系列
    type: Backbone.HasOne
    key: 'itemSeriesId'
    relatedModel: ItemSeries
    includeInJSON: ['id']
    reverseRelation: {
      relatedCollection: ItemCollection
      key: 'items'
    }
  }]

  quests: []

  getQuests: (questCollection) ->
    @quests = questCollection.filter (questModel) =>
      questModel.get('rewards').findWhere({id: @get('id')}) isnt undefined



# ### Collections ###

# 把各个Model的集合声明出来
class ItemElemCollection extends Backbone.Collection
  model: ItemElem
  # JSON文件的路径
  url: 'data/item_elem.json'

  # 实例化的时候直接就从JSON读数据
  initialize: ->
    @fetch()

# 下面的基本相同

class ItemTypeCollection extends Backbone.Collection
  model: ItemType
  url: 'data/item_type.json'

  initialize: ->
    @fetch()


class ItemRangeCollection extends Backbone.Collection
  model: ItemRange
  url: 'data/item_range.json'

  initialize: ->
    @fetch()


class ItemCollection extends Backbone.Collection
  model: Item
  url: 'data/item.json'

  initialize: ->
    @fetch()


class ItemSeriesCollection extends Backbone.Collection
  model: ItemSeries
  url: 'data/item_series.json'

  initialize: ->
    @fetch()




# Quests
# ----------

# ### Models ###

# 任务
class Quest extends Backbone.RelationalModel
  relations: [{
    type: Backbone.HasMany
    key: 'rewards'
    relatedModel: Item
    includeInJSON: true
  }]

# ### Collections ###

# 只声明 Quest 的
class QuestCollection extends Backbone.Collection
  model: Quest
  url: 'data/quest.json'
  initialize: ->
    @fetch()



# Monsters
# ----------

# ### Models ###

# 怪物
class Monster extends Backbone.RelationalModel



# ### Collections ###

# 怪物的集合
class MonsterCollection extends Backbone.Collection
  model: Monster
  url: 'data/monster.json'
  initialize: ->
    @fetch()

# Exporting
# ----------

# ### Initializing / Loading Data ###
_export_fn_ = () ->
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


# Define AMD module
define _export_fn_
