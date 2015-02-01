$(window).load(function(){

    $('#window').addClass('pic_anim');
    $('#titl').addClass('titl_fade_in');
    $('.article').addClass('article_in');
    $('.menu').addClass('menu_js');
});


$(window).scroll(function() {
    $('#iphones').each(function(){
    var imagePos = $(this).offset().top;

    var topOfWindow = $(window).scrollTop();
        if (imagePos < topOfWindow+700) {
            $(this).addClass("iphones_in");
        }
    });
});

$(window).scroll(function() {
    $('#columns').each(function(){
    var imagePos = $(this).offset().top;

    var topOfWindow = $(window).scrollTop();
        if (imagePos < topOfWindow+600) {
            $(this).addClass("column_in");
        }
    });
});

$(window).scroll(function() {
    $('#ios_apps').each(function(){
    var imagePos = $(this).offset().top;

    var topOfWindow = $(window).scrollTop();
        if (imagePos < topOfWindow+700) {
            $(this).addClass("ios_apps_in");
        }
    });
});

$(window).scroll(function() {
    $('#web_apps').each(function(){
    var imagePos = $(this).offset().top;

    var topOfWindow = $(window).scrollTop();
        if (imagePos < topOfWindow+700) {
            $(this).addClass("web_apps_in");
        }
    });
});

$(window).scroll(function() {
    $('#makets').each(function(){
    var imagePos = $(this).offset().top;

    var topOfWindow = $(window).scrollTop();
        if (imagePos < topOfWindow+700) {
            $(this).addClass("makets_in");
        }
    });
});

$(document).ready(function(){
    $('a[href^="#"], a[href^="."]').click( function(){ // если в href начинается с # или ., то ловим клик
        var scroll_el = $(this).attr('href'); // возьмем содержимое атрибута href
        if ($(scroll_el).length != 0) { // проверим существование элемента чтобы избежать ошибки
        $('html, body').animate({ scrollTop: $(scroll_el).offset().top }, 900); // анимируем скроолинг к элементу scroll_el
        }
        return false; // выключаем стандартное действие
    });
});
