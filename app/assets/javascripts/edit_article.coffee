$(document).ready ->
 imageUrl = $('#article-image').val()
 if imageUrl
  $('#background-image').css 'background-image', 'url(' + imageUrl + ')'
 return