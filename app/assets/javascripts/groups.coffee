# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  $invitedEmails = []

  addLI = (email) ->
    $invitedEmailsUL = $('.invited-users ul')
    li = document.createElement('li')
    li.className = 'not-sent-yet'
    li.innerHTML = email 
    $invitedEmailsUL.get(0).appendChild li

    $.ajax
      method: 'GET'
      url: '/users'
      dataType: 'json'
      data:
        email: email, group_id: $("#hidden_group_id").val()
      success: (data) ->
        if (data == true)
          alert "User already invited!"
          $('#group_invited_user_email').val("")
          $invitedEmailsUL.get(0).appendChild li.remove()
        else
          if name = data[0]?.name
            li.innerHTML = "#{name} (#{li.innerHTML})"

  updateInputEmailArray = (email) ->
    $invitedEmailsInput = $('#group_invited_user_emails')
    $invitedEmails.push email
    $invitedEmailsInput.val JSON.stringify($invitedEmails)

  hitEnter = (e) ->
    e.which == 13

  $('#group_invited_user_email').on 'keyup keydown', (e) ->
    return unless hitEnter(e)

    if e.type is 'keydown'
      email = $(this).val()
      emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
      if !emailReg.test(email) && email != ""
        alert "Invalid Email Id."
        $('#group_invited_user_email').val("")
        return false
      if email not in $invitedEmails
        addLI email
        updateInputEmailArray email
        $('#group_invited_user_email').val("")
        return false
      else
        alert "Duplicate email doesn't allow"
        $('#group_invited_user_email').val("")
        return false
    else
      e.preventDefault()
      return false

$(document).on 'ready page:load ajaxComplete', ->

  $('.delete-invite').on 'ajax:success', ->
    reloader = new Reloader($('#invited-users'))
    reloader.reload()
