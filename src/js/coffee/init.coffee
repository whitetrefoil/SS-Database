# Requirements, drive by require.js

'use strict'

# Configure
requirejs.config
  baseUrl: 'js'
  paths:
    lib: '../lib'
    tmpl: '../tmpl'

# Require
requirejs([
  'lib/jquery/jquery',
  'lib/underscore/underscore',
  'lib/backbone/backbone',
  'lib/backbone/backbone-relational',
  'data'
])
