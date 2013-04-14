'use strict'

define([
  'views/monster'
  'views/item'
  'views/quest'
], (
  MonsterView
  ItemView
  QuestView
) ->
  # ### Initializing / Loading Data ###
  #
  # **These are for development only!!!***
  exports = {}
  exports.monsterView = new MonsterView
  exports.itemView = new ItemView
  exports.questView = new QuestView({itemCollection : exports.itemView.collection})

  exports
)
