axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
contentful   = require 'roots-contentful'
config       = require './contentful'
marked       = require 'marked'
browserify = require 'roots-browserify'
netlify = require 'roots-netlify'

module.exports =
  ignores: [
    'readme.md', '**/layout.*', '**/_*', '.gitignore', 'contentful.coffee',
    'Makefile', 'ship*'
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]

  locals:
    marked: marked

  extensions: [
    contentful(config),
    browserify(
      files: "assets/js/main.coffee",
      out: 'js/build.js', minify: false),
    netlify(
      headers:'/*':'X-Frame-Options': 'DENY','X-XSS-Protection': '1; mode=block')
  ]
