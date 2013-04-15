'use strict'

define([
  'backbone'
  'mustache'
  'data'
  'text!tmpl/item.html!strip'
], (
  Backbone
  Mustache
  DataStore
  template
) ->
  class ItemView extends Backbone.View
    el: '#itemsPage'

    collection: DataStore.itemSerieses

    questCollection: DataStore.quests

    renderTemplate: Mustache.compile(template)

    initialize: ->
      _this = this
      @$el.hide()
#
#      @collection.on 'sync', ->
#        _this.getQuests()
#        _this.trigger 'ready'
#        _this.render()
#
#      @questCollection.on 'sync', =>
#        @getQuests()
#
#    getQuests: ->
#      unless @collection.length > 0 and @questCollection.length > 0
#        for model in @collection.models
#          model.get('items').invoke 'getQuests', @questCollection
#

    render: ->
      data = @collection.toJSON()
      @$el.html(@renderTemplate(data))

    show: (ms) ->
      @$el.show(ms)

    hide: (ms) ->
      @$el.hide(ms)

  # Return (exports)
  ItemView
)
