$(function(){
	$(".login_name").hover(
		function(){
			$(".loginNameMenu").addClass("loginNameMenuOn");
			$(this).addClass("login_name_on");
		},
		function(){
			$(".loginNameMenu").removeClass("loginNameMenuOn");
			$(this).removeClass("login_name_on");
		}
	);
	
	$(".loginNameMenu").hover(
		function(){
			$(".login_name").addClass("login_name_on");
			$(this).addClass("loginNameMenuOn");
		},
		function(){
			$(".login_name").removeClass("login_name_on");
			$(this).removeClass("loginNameMenuOn");
		}
	);
	
});