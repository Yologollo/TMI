//side menu
console.clear();
$(window).scroll(function() {
    let scrollTop = $(this).scrollTop();
    console.log(scrollTop)
    
    if ( scrollTop < 1000 ) {
        scrollTop = 1000;
    }
    else if ( scrollTop > 9600 ) {
        scrollTop = 9600;
    }
    
    let duration = 1000;
    $('.menu').stop().animate({top:scrollTop}, duration);
    
    //console.log(scrollTop);
});