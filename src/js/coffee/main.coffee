# Requirements, drive by require.js

'use strict'

# Configure
requirejs.config
  baseUrl: 'js'
  paths:
    lib: '../lib'
    tmpl: '../tmpl'

# Require global libraries
requirejs([
  'lib/jquery/jquery',
  'lib/underscore/underscore',
  'lib/backbone/backbone',
  'lib/backbone/backbone-relational',
])

# Require private scripts
requirejs([
  'data'
], (app) ->
  # Export App to global for development
  window.App = app
)
