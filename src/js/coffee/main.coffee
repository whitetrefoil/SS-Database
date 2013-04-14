# Requirements, drive by require.js

'use strict'

# Configure
requirejs.config
  baseUrl: 'js'
  paths:
    lib: '../lib'
    tmpl: '../tmpl'
    jquery: '../lib/jquery/jquery'
    underscore: '../lib/underscore/underscore'
    backbone: '../lib/backbone/backbone'
    'backbone-relational': '../lib/backbone/backbone-relational'

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

    # Backbone-relational
    'backbone-relational': ['backbone']

# Require private scripts
requirejs([
  'data'
], (app) ->
  # Export App to global for development
  window.App = app
)
