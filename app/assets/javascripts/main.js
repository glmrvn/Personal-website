//заглушка при загрузке страницы
$(window).on('load', function () {
    var $preloader = $('#page-preloader'),
        $spinner   = $preloader.find('.spinner');
    $spinner.fadeOut();
    $preloader.delay(350).fadeOut('slow');
});

//плавное появление элементов при загрузке страницы
$(document).ready(function(){
    $('.alert').addClass('alert_js');
});

//сужение меню при скроле вниз
$(window).scroll(function() {
    var scroll = $(window).scrollTop();
        if (scroll >= 20) { $('.menu').addClass("menu_in"); }
        if (scroll < 300) { $('.menu').removeClass("menu_in"); }
});

//плавное появление при скроле
$(window).scroll(function() {
    var scroll = $(window).scrollTop();
        if (scroll >= 200) { $('#second_screen').addClass("fade_in"); }
        if (scroll >= 2100) { $('#fourth_screen').addClass("fade_in"); }
        if (scroll >= 4300) { $('#six_screen').addClass("fade_in"); }
        if (scroll >= 4650) { $('#message').addClass("fade_in"); }
});

//плавная езда по странице
$(document).ready(function(){
    $('a[href^="#"], a[href^="."]').click( function(){ // если в href начинается с # или ., то ловим клик
        var scroll_el = $(this).attr('href'); // возьмем содержимое атрибута href
        if ($(scroll_el).length != 0) { // проверим существование элемента чтобы избежать ошибки
        $('html, body').animate({ scrollTop: $(scroll_el).offset().top }, 900); // анимируем скроолинг к элементу scroll_el
        }
        return false; // выключаем стандартное действие
    });
});

//появление макетов при ajax перезугрузке
$(function() {
  $(document)
    .ajaxComplete(function() {
      $('.article').delay(350).fadeIn('slow');
    })
  //   .ajaxStop(function() {
  //     $('.article').addClass('article_in'); // hide it when it is done.
  // });
});
