'use strict'

fs = require 'fs'
path = require 'path'
spawn = require('child_process').spawn
glob = require 'glob'
whichSync = require('which').sync
rimraf = require 'rimraf'
prefix = 'src/js/coffee'
output = '../../docs'

process.chdir prefix

glob.Glob '**/*.coffee', {nocase: true, nosort: true},
  (error, curFiles) -> filterFiles curFiles,
    (fileList) -> documentFiles fileList

filterFiles = (filesAndDirs, callback) ->
  files = []
  for aFile in filesAndDirs
    if fs.statSync(aFile).isFile() and path.extname(aFile) is '.coffee'
      files.push aFile

  callback?(files)

documentFiles = (fileList) ->
  successed = 0
  failed = 0
  args = ['-o', output].concat(fileList)
  console.log fileList
  exeFile = whichSync('docco')
  rimraf output, () ->
    fs.mkdirSync(output)
    docco = spawn exeFile, args
    docco.stdout.on 'data', (data) ->
      successed += 1
    docco.stderr.on 'data', (data) ->
      failed += 1
    docco.on 'close', (code) ->
      console.log "#{successed} file(s) successed."
      console.log "#{failed} file(s) failed!"
