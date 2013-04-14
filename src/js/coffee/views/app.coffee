'use strict'

define([
  'backbone'
], (
  Backbone
) ->
  # App View, use as a events container
  class AppView extends Backbone.View
    el: '#app'

  # Return (exports)
  AppView
)
