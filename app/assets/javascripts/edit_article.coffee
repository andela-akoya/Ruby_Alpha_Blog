$(document).ready ->
  # loading the background image for the edit form page
  imageUrl = $('#article-image-field').attr 'image_remote_url'
  if imageUrl
    $('main').css 'background-image', 'url(' + imageUrl + ')'

  # expanding the text area on page load for full view of article description
  $('#description-textarea').trigger 'autoresize'
  return