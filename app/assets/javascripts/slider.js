var slider = {
    slides:['assets/1.jpg','assets/2.jpg','assets/3.jpg','assets/4.jpg','assets/5.jpg','assets/6.jpg'],
    frame:0, // текущий кадр для отбражения - индекс картинки из массива
    set: function(image) { // установка нужного фона слайдеру
        document.getElementById("secn_pic").style.backgroundImage = "url("+image+")";
    },
    init: function() { // запуск слайдера с картинкой с нулевым индексом
        this.set(this.slides[this.frame]);
    },
    right: function() { // крутим на один кадр вправо
    this.frame++;
    if(this.frame == this.slides.length) this.frame = 0;
    this.set(this.slides[this.frame]);
}
};
window.onload = function() { // запуск слайдера после загрузки документа
    slider.init();
    setInterval(function() { // ставим пятисекундный интервал для перелистывания картинок
        slider.right();
    },7000);
};
