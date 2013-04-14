'use strict'

define([
  'backbone'
  'router'
], (
  Backbone
  Router
) ->
  window.App = new Router
  Backbone.history.start()
)
