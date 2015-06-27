$ ->
  $('#art').on 'click', '.pagination a', ->
    $.get @href, null, null, 'script'
    false
  return
