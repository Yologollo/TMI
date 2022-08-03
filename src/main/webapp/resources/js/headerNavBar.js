const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2))
console.log(ctx);
$(document).ready(function (){
 	
	$('.nav_link').addClass('nav_color_b');
	$('#title_img').attr('src',ctx + '/resources/images/title_blue.png')
	$(window).on('scroll', function(){
		if(this.scrollY >= 0) {
			$('.nav_link').addClass('nav_color_b');
			$('#title_img').attr('src','${pageContext.request.contextPath}/resources/images/title_blue.png')
		}
	});
});