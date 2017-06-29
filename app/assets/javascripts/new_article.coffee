$(document).ready ->
  $('#article-image').focusout (event) ->
    imageUrl = $('#article-image').val()
    if imageUrl
      $('#background-image').css 'background-image', 'url(' + imageUrl + ')'
    else
      $('#background-image').css 'background-image', 'none'
    return
  return
