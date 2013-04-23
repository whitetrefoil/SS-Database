'use strict'

define([
  'backbone'
  'mustache'
  'text!tmpl/item.html!strip'
], (
  Backbone
  Mustache
  template
) ->
  class ItemView extends Backbone.View
    el: '#itemsPage'

    renderTemplate: Mustache.compile(template)

    initialize: (options) ->
      @$el.hide()
      @dataStore = options.dataStore
      @collection = @dataStore.itemSerieses
      @questCollection = @dataStore.quests
#      @getQuests()
#      @trigger 'ready'
      @render()
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
