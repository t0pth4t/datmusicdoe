$ = require 'jquery'
howl = require 'howler'

$(".play").on "click", ->
  $audio = $($(this).siblings()[0])
  new Howl(urls: [ $audio.attr("src") ])