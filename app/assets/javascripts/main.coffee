#заглушка при загрузке страницы
$(window).on 'load', ->
  $preloader = $('#page-preloader')
  $spinner = $preloader.find('.spinner')
  $spinner.fadeOut()
  $preloader.delay(350).fadeOut 'slow'
  return

#плавное появление элементов при загрузке страницы
$(document).ready ->
  $('.alert').addClass 'alert_js'
  return

#сужение меню при скроле вниз
$(window).scroll ->
  scroll = $(window).scrollTop()
  if scroll >= 20
    $('.menu').addClass 'menu_in'
  if scroll < 300
    $('.menu').removeClass 'menu_in'
  return

#плавное появление при скроле
$(window).scroll ->
  scroll = $(window).scrollTop()
  if scroll >= 200
    $('#second_screen').addClass 'fade_in'
  if scroll >= 2100
    $('#fourth_screen').addClass 'fade_in'
  if scroll >= 4300
    $('#six_screen').addClass 'fade_in'
  if scroll >= 4650
    $('#message').addClass 'fade_in'
  return

#плавная езда по странице
$(document).ready ->
  $('a[href^="#"], a[href^="."]').click ->
    # если в href начинается с # или ., то ловим клик
    scroll_el = $(this).attr('href')
    # возьмем содержимое атрибута href
    if $(scroll_el).length != 0
      # проверим существование элемента чтобы избежать ошибки
      $('html, body').animate { scrollTop: $(scroll_el).offset().top }, 900
      # анимируем скроолинг к элементу scroll_el
    false
    # выключаем стандартное действие
  return
