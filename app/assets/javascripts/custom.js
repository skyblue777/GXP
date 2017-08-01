
$(document).ready(function() {
	if ($(window).width > 768) {
		$(window).on('scroll', function() {
			if ($(window).scrollTop() > 80) {
				$('#header').addClass('add-sticky');
			} else {
				$('#header').removeClass('add-sticky');
			}
		});	
	} else {
		
	}
	


	$('.mobile-nav').on('click', function() {
		if ($('.mobile-navigation').hasClass('add-mobile-menu')) {
			$('.mobile-navigation').removeClass('add-mobile-menu');
		} else {
			$('.mobile-navigation').addClass('add-mobile-menu');
		}
	});
});
