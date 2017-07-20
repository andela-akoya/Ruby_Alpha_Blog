$(document).ready ->
  $('.dropdown-button').dropdown hover: true
  $('.modal').modal()
  $(".button-collapse").sideNav()

  $('.delete-article').each (index, value) ->
    $(value).click (event) ->
      $('#delete-form').attr('action', '/articles/' + $(event.target).attr('id'))
      $('#delete-form h6').text('(' +$(event.target).attr('data') + ')')
      return
    return

  $('#delete-modal #close-button').click (event) ->
    event.preventDefault()
    return
  return