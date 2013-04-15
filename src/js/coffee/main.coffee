# Requirements, drive by require.js

'use strict'

# Configure
requirejs.config
  # Set the default JS location
  baseUrl: 'js'

  # Set special JS locations
  paths:
    lib: '../lib'
    tmpl: '../tmpl'
    jquery: '../lib/jquery/jquery'
    underscore: '../lib/underscore/underscore'
    backbone: '../lib/backbone/backbone'
    mustache: '../lib/mustache/mustache'

  # Set libraries that are not compatible with AMD API
  shim:
    # jQuery
    jquery:
      exports: '$'

    # Underscore
    underscore:
      exports: '_'

    # Backbone
    backbone:
      deps: ['jquery', 'underscore']
      exports: 'Backbone'

# Require private scripts
requirejs([
  'backbone'
  'router'
], (
  Backbone
  Router
) ->
  router = new Router
  Backbone.history.start()

  # Export App to global for development
  window.App = router
)
