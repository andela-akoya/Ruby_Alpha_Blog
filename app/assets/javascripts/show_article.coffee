$(document).ready ->
  description = $('#article-description p').html() || ""
  $('#article-description p').html(description.replace(/\n/g, '<br>'))
  return