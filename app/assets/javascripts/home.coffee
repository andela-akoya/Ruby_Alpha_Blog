$(document).ready ->
  $('.slider').slider()
  $('.modal').modal()

  $('#new_user').on 'submit', (e) ->
    e.preventDefault()
    console.log $('meta[name="csrf-token"]').attr('content')
    $.ajax
      type: 'POST'
      url: '/users'
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-TOKEN', $('meta[name="csrf-token"]').attr('content')
        return
      contentType: 'application/json;charset=utf-8'
      data: JSON.stringify({
        "user": buildSignupData()
      })
      success: (data) ->
        console.log data
        return
      error: (error) ->
        console.log error
        return
    return

  buildSignupData = ->
    data = {
      "username": $('#user_username').val(),
      "email": $('#user_email').val(),
      "password": $('#user_password').val(),
      "confirm_password": $('#user_confirm_password').val()
    }
    return data



  return
