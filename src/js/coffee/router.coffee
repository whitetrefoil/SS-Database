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
    initialize: () ->

      @appView = new AppView
      @monsterView = new MonsterView
      @itemView = new ItemView
      @questView = new QuestView({itemCollection : @itemView.collection})

  return Router
)
