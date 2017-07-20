$(document).ready ->
  $('#article-image-field').focusout (event) ->
    imageUrl = $('#article-image-field').val()
    if imageUrl
      $('main').css 'background-image', 'url(' + imageUrl + ')'
    else
      $('main').css 'background-image', 'none'
    return
  return
