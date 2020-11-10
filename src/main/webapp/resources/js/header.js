/**
 * 
 */
 
 $(function(){
		$('#sub_nav').hide();
		$('#nav_more').click(function(){
			$('#sub_nav').slideToggle();
		});
	});
 
 
$(function() {
				var lnb = $(".lnb").offset().top;
				$(window).scroll(function() {
					var window = $(this).scrollTop();

					if(lnb <= window) {
						$(".lnb").addClass("fixed");
					} else {
						$(".lnb").removeClass("fixed");
					}
				})
			});

