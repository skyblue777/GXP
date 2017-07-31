# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:load ready', ->

  $('#countdown').countdown $('#countdown').data('time'), (event) ->
    $(this).text event.strftime('%Dd %Hh %Mm %Ss remaining')

  $('#project_contest_id').selectize()

  $('.contest-filter').selectize
    onChange: (value) ->
      window.location.href = value

  $('.category-filter').selectize
    onChange: (value) ->
      idToReload = '#projects'
      href = "#{window.location.pathname}?category_id=#{value}"
      $(idToReload).load "#{href} #{idToReload} > *"

  hitEnter = (e) ->
    e.which == 13

  searchProjects = (e) ->
    idToReload = '#projects'
    query = $('#query').val()
    href = "#{window.location.pathname}?query=#{query}"
    $(idToReload).load "#{href} #{idToReload} > *"
    false

  $('#search-icon').on 'click', (e) ->
    searchProjects e

  $('#query').on 'keydown', (e) ->
    return unless hitEnter(e)
    searchProjects e

  $('.just-me').on 'click', ->
    $('.chooser').addClass 'hide'
    $('#just-me').removeClass 'hide'

  $('.group-or-organization').on 'click', ->
    $('.chooser').addClass 'hide'
    $('#group-or-organization').removeClass 'hide'

  $('.load-more-btn').on 'click', (e) ->
    e.preventDefault()
    $('#projects').infinitescroll('retrieve')

  $('#projects').infinitescroll
    navSelector: '.pagination'
    nextSelector: '.pagination .next a'
    itemSelector: '.project-block'
    loading:
      start: (options) ->
        $('.load-more-btn').prop('disabled', 'disabled')
        $('.load-more-btn').html 'Loading...'
        $(this).data('infinitescroll').beginAjax(options)
      finished: ->
        $('.load-more-btn').removeProp 'disabled'
        $('.load-more-btn').html 'Load More'
      finishedMsg: ''
      msgText: ''
    errorCallback: ->
      $('.load-more-btn').prop('disabled', 'disabled')
      $('.load-more-btn').html 'N/A'

  # Disable infinite scrolling so that it is only triggered manually
  $(window).unbind('.infscr');

  # Refile direct uploads
  $uploadForm = $('.simple_form')
  $submitBtn = $uploadForm.find('input[type=submit]')
  $fileInput = $uploadForm.find('input[type=file]')
  $preview = $('.img-preview img')

  try
    $('label[for=project_video]').html $.parseJSON($("input[name='project[video]']").eq(0).val()).filename
    $progressBar = $('.progress-bar', $('.video-container'))
    $progressBar.css 'width', '100%'
    $progressBar.addClass 'progress-bar-success'
  catch

  try
    $('label[for=project_image]').html $.parseJSON($("input[name='project[image]']").eq(0).val()).filename
    $progressBar = $('.progress-bar', $('.image-container'))
    $progressBar.css 'width', '100%'
    $progressBar.addClass 'progress-bar-success'
  catch

  jcropAPI = undefined
  scalingFactor = 1

  updateCoords = (coords) ->
    $('#image_crop_x').val(coords.x * scalingFactor)
    $('#image_crop_y').val(coords.y * scalingFactor)
    $('#image_crop_w').val(coords.w * scalingFactor)
    $('#image_crop_h').val(coords.h * scalingFactor)

  $fileInput.on 'upload:start', (e) ->
    $progressBar = $(this).parent().siblings('.progress').find('.progress-bar')
    $progressBar.removeClass 'active'
    $progressBar.removeClass 'progress-bar-success'
    $submitBtn.prop 'disabled', true
    $progressBar.css 'width', '0%'

  $fileInput.on 'upload:progress', (e) ->
    $progressBar = $(this).parent().siblings('.progress').find('.progress-bar')
    $progressBar.addClass 'active'
    detail = e.originalEvent.detail
    percentageComplete = (detail.progress.loaded / detail.progress.total) * 100
    $progressBar.css 'width', "#{percentageComplete}%"

  $fileInput.on 'upload:complete', (e) ->
    $progressBar = $(this).parent().siblings('.progress').find('.progress-bar')
    $fileLabel = $(this).parent().siblings('.choose-file')
    $fileLabel.html $(this)[0].files[0].name
    $progressBar.addClass 'progress-bar-success'
    $progressBar.removeClass 'active'
    $submitBtn.prop 'disabled', false
    $('.img-preview').removeClass('hide')

    if $(this).prop('id') is 'project_image'
      reader = new FileReader()
      reader.readAsDataURL $(this)[0].files[0]

      if jcropAPI
        jcropAPI.destroy()
        $('#project-img-preview').removeAttr 'style'

      reader.onload = (e) =>
        img = $preview[0]
        img.src = e.target.result
        img.onload = =>
          scalingFactor = img.naturalWidth / img.width
          return unless img.width >= 260 and img.height >= 260

          $preview.Jcrop
            minSize: [(260 / scalingFactor), (260 / scalingFactor)]
            aspectRatio: 1
            onChange: updateCoords
            onSelect: updateCoords
          , ->
            jcropAPI = this
