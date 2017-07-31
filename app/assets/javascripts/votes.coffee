# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load ajaxComplete', ->

  $('.vote-btn').on 'ajax:success', ->
    $containerToReload = $('#projects')
    reloader = new Reloader($containerToReload)
    reloader.reload()

  $('.vote-btn').on 'ajax:error', (e, response) ->
    json = JSON.parse response.responseText
    errors = json.errors

    $(this).data('title', errors[0])
    $(this).tooltip('show')
    setTimeout =>
      $(this).tooltip('hide')
    , 3000

  doErrorsIncludeTooManyVotesError = (errors) ->
    for error in errors
      return true if error.match(/already voted/g)
