'use strict'

define([
  'backbone'
  'data'
], (
  Backbone
  DataStore
) ->
  # App View, use as a events container
  class AppView extends Backbone.View
    el: '#app'

    initialize: () ->
      @trigger 'ready'

  # Return (exports)
  AppView
)
