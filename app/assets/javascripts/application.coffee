#= require jquery
#= require jquery_ujs
#= require moment
#= require rails-timeago
#= require redactor
#= require groups
#= require projects
#= require refile
#= require selectize
#= require social-share-button
#= require bootstrap.min
#= require froala_editor.min.js
#= require datatables
#= require_tree .
#= stub square



$(document).on 'ready page:load', ->
  $('select[multiple=multiple]').selectize
    plugins: ['remove_button']
  $('[data-toggle="tooltip"]').tooltip()
