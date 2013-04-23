define([
  'backbone'
  'jquery'
  'views/app'
  'views/monster'
  'views/item'
  'views/quest'
], (
  Backbone
  $
  AppView
  MonsterView
  ItemView
  QuestView
) ->
  class Router extends Backbone.Router
    # All views
    views: {}

    # All routers
    routes:
      '': 'index'
      'items': 'showItems'
      'monsters': 'showMonsters'
      'quests': 'showQuests'

    # All router functions
    index: () ->
      @monsterView.show()
      @itemView.show()
      @questView.show()

    showItems: () ->
      @itemView.show()
      @monsterView.hide()
      @questView.hide()

    showMonsters: () ->
      @itemView.hide()
      @monsterView.show()
      @questView.hide()

    showQuests: () ->
      @itemView.hide()
      @monsterView.hide()
      @questView.show()

    # Coustructor
    initialize: (options) ->

      @appView = new AppView({dataStore: options.dataStore})
      @monsterView = new MonsterView({dataStore: options.dataStore})
      @itemView = new ItemView({dataStore: options.dataStore})
      @questView = new QuestView({dataStore: options.dataStore})

  return Router
)
