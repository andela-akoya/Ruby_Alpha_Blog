$(document).ready ->
  $('.slider').slider()
  $('.modal').modal()

  $('#new_user').on 'submit', (e) ->
    e.preventDefault()
    $.ajax
      type: 'POST'
      url: '/users'
      beforeSend: window.getCsrfToken
      contentType: 'application/json;charset=utf-8'
      data: JSON.stringify({
        "user": buildSignupData()
      })
      success: (data) ->
        return
      error: (error) ->
        message = error.responseJSON
        if message.username
        then $('#username_error').html("Username " + message.username[0])
        else $('#username_error').html ''
        if message.email
        then $('#email_error').html("Email " + message.email[0])
        else $('#email_error').html ''
        if message.password
        then $('#password_error').html(message.password)
        else $('#password_error').html ''
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
