'use strict'

define([
  'views/app'
  'views/monster'
  'views/item'
  'views/quest'
], (
  AppView
  MonsterView
  ItemView
  QuestView
) ->
  # ### Initializing / Loading Data ###
  #
  # **These are for development only!!!***
  exports = {}
  exports.appView = new AppView
  exports.monsterView = new MonsterView
  exports.itemView = new ItemView
  exports.questView = new QuestView({itemCollection : exports.itemView.collection})

  exports
)
