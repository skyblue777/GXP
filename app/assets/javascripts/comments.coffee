# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('.add-comment-btn').on 'click', ->
    newComment = $(this).closest('.comment-display').find('+ .row form#new_comment')
    newComment.toggleClass('hide')
    newComment.find('#comment_body').focus()
