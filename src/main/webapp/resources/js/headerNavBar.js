$(document).ready(function (){
	$('.nav_link').addClass('nav_color_b');
	$('#title_img').attr('src','${pageContext.request.contextPath}/resources/images/title_blue.png')
	$(window).on('scroll', function(){
		if(this.scrollY >= 0) {
			$('.nav_link').addClass('nav_color_b');
			$('#title_img').attr('src','${pageContext.request.contextPath}/resources/images/title_blue.png')
		}
	});
});