# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $input = $('#contest_slug')
  $hintBlock = $('.contest_slug .help-block')
  slugFormat = $('.contest_slug .help-block').html()
  pathFormat = $input.data('path')

  updateSlug = (slug) ->
    path = pathFormat.replace ':slug', slug
    hint = slugFormat.replace ':path', path
    $hintBlock.html(hint)

  if $input.length > 0
    updateSlug $input.val()

  $input.on 'keyup', ->
    updateSlug $(this).val()
