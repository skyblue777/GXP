$(document).on 'ready page:load', ->

  $('#update_password').on 'click', (e) ->
      e.preventDefault()
      $('.update_password').show()
      $('#update_password').hide()

