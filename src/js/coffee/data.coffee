'use strict'

define([
  'backbone'
  'router'
], (
  Backbone
  Router
) ->
  router = new Router
  Backbone.history.start()

  router
)
