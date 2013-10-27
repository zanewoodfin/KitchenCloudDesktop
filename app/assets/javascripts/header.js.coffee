$ ->
  hide_sign_form = ->
    $('.sign-form').hide()
    $('.menu-sign-in').removeClass 'active'
  hide_sign_form()

  $('.welcome-msg').addClass 'hidden'
  
  $('.menu-sign-in').click (e)->
    $('.menu-sign-in').addClass 'active'
    $('.menu-home, .menu-get-the-app, .menu-community').removeClass 'active'
    $('.sign-form').show()
    false
  $(document).click (e)->
    hide_sign_form()
  
  if screen.width <= 400
    $(document).on 'click', '.menu-sign-in', (e)->
      e.preventDefault
      $('.sign-form').hide()
      window.location = "http://localhost/kitchencloud/create-an-account"
