#всплывающие уведомления
$(document).ready ->
  $('.alert').addClass 'alert_js'
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

#выбор активной вкладки
$(document).ready ->
  $tabs = $('a.tab')
  $tabs.click ->
    $tabs.removeClass 'active'
    $(this).addClass 'active'
    return

#Исчезновение и появление футера при скроле
# $(window).scroll ->
#   $footer = $('footer')
#   scroll = $(window).scrollTop()
#   $footer.hide()
#
#   if scroll > 300
#     $footer.show()
#     return

#Футер всегда оторбражается
$(window).ready ->
  $footer = $('footer')
  $footer.show()
  return

#скрипт для работы вкладок
$(document).ready ->
  $('.art_img_app').hide()

  $web = $('#web')
  $app = $('#app')

  $web.click ->
    $('.art_img_app').hide()
    $('.art_img_web').show()
    return

  $app.click ->
    $('.art_img_web').hide()
    $('.art_img_app').show()
    return
