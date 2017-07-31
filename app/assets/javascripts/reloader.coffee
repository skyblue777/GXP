class @Reloader

  constructor: ($element) ->
    @id = $element.prop('id')
    console.log 'Element passed to Reload does not have an id!' if !@id?

  reload: (callback = $.noop) ->
    $('#' + @id).load "#{window.location.pathname} ##{@id} > *", callback
