//плавное появление элементов при загрузке страницы
    $('.menu').addClass('menu_js');
    $('.alert').addClass('alert_js');
    $('.icons').addClass('icons_in');
    $('.submit').addClass('submit_in');
});

//сужение меню при скроле вниз
$(window).scroll(function() {

    var scroll = $(window).scrollTop();

        if (scroll >= 20) { $('.menu').addClass("menu_in"); }

        if (scroll < 300) { $('.menu').removeClass("menu_in"); }
});

//плавное появление макетов при скроле
$(window).scroll(function() {
    var scroll = $(window).scrollTop();

        if (scroll >= 500) { $('.article').addClass("article_in"); }
});

//плавное появление формы при скроле
$(window).scroll(function() {
    $('.message').each(function(){
    var imagePos = $(this).offset().top;

    var topOfWindow = $(window).scrollTop();
        if (imagePos < topOfWindow+700) {
            $(this).addClass("message_in");
        }
    });
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
      $('.article').addClass('article_in');
    })
  //   .ajaxStop(function() {
  //     $('.article').addClass('article_in'); // hide it when it is done.
  // });
});