$(document).ready ->
  $('#article-image').focusout (event) ->
    imageUrl = $('#article-image').val()
    if imageUrl
      $('main').css 'background-image', 'url(' + imageUrl + ')'
    else
      $('main').css 'background-image', 'none'
    return
  return
