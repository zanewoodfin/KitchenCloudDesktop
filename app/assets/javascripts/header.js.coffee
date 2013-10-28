$ ->
  hide_sign_form = ->
    $('.sign-form').hide()
    $('.menu-sign-in').removeClass 'active'
  hide_sign_form()

  $(document).on 'click', '.menu-sign-in', (e)->
    $('.menu-sign-in').addClass 'active'
    $('.menu-home, .menu-get-the-app, .menu-community').removeClass 'active'
    $('.sign-form').show()
    false
  $(document).click (e)->
    unless $(e.target).closest('div.sign-form').length > 0
      hide_sign_form()
  
  if screen.width <= 400
    $(document).on 'click', '.menu-sign-in', (e)->
      e.preventDefault
      $('.sign-form').hide()
      window.location = "http://localhost/kitchencloud/create-an-account"

