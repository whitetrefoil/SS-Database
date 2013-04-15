'use strict'

define([
  'mustache'
  'collections/itemSeries'
  'collections/quest'
  'collections/itemType'
  'collections/itemElem'
  'collections/itemRange'
  'collections/item'
  'text!tmpl/item.html!strip'
], (
  Mustache
  ItemSeriesCollection
  QuestCollection
  ItemTypeCollection
  ItemElemCollection
  ItemRangeCollection
  ItemCollection
  template
) ->
  # Load Item Properties
  new ItemTypeCollection
  new ItemElemCollection
  new ItemRangeCollection
  new ItemCollection

  class ItemView extends Backbone.View
    el: '#itemsPage'

    collection: null

    questCollection: null

    initialize: ->
      _this = this
      @$el.hide()
      @collection = new ItemSeriesCollection
      @questCollection = new QuestCollection

      @collection.on 'sync', ->
        _this.getQuests()
        _this.trigger 'ready'
        _this.render()

      @questCollection.on 'sync', =>
        @getQuests()

    getQuests: ->
      unless @collection.length > 0 and @questCollection.length > 0
        for model in @collection.models
          model.get('items').invoke 'getQuests', @questCollection


    render: ->
      data = @collection.toJSON()
      @$el.append(Mustache.render(template, data))

    show: (ms) ->
      @$el.show(ms)

    hide: (ms) ->
      @$el.hide(ms)

  # Return (exports)
  ItemView
)
