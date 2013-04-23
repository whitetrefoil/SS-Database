'use strict'

define([
  'backbone'
], (
  Backbone
) ->
  # 魔物
  class Monster extends Backbone.Model

    dataStore: {}

    setDataStore: (@dataStore) ->

    elems: ->
      @dataStore.itemElems.toJSON()

    mainWeakness: ->
      @dataStore.itemElems.get(@attributes['mainWeakness']).toJSON()

    @getDefenceMark: (defenceArray) ->
      output = []
      for d in defenceArray
        output.push switch d
          when 0 then '×'
          when 1 then '△'
          when 2 then '○'
          when 3 then '◎'
          when 4 then '★'
          else '-'
      output

    resist: ->
      @constructor.getDefenceMark @attributes['resist']

    defences: ->
      output = []
      for singlePart in @attributes['defences']
        output.push
          name : singlePart['name']
          defence : @constructor.getDefenceMark singlePart['defence']
      output


    # Overwrite `toJSON()` function.
    toJSON: (keys) ->
      # Deep clone the @attributes object
      json = $.extend true, {}, @attributes

      # Filter keys
      if keys?
        json = _.pick json, keys

      # If there's a function has same name of this key in this instance,
      # use the return value instead the value in @attibutes
      for key of json
        if typeof this[key] is 'function'
          json[key] = this[key]()

      # Append elements data for table style generate
      json['elems'] = @elems()

      # Elemens without "none" for resist data
      json['resistElems'] = _.rest json['elems']

      json = _.defaults json,
        mainWeakness:
          name: '-'

      json

  # Return (exports)
  Monster
)
