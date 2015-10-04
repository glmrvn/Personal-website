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
