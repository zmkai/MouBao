function login() {
	var name = document.getElementsByName("user.username")[0].value.trim();
	var pwd = document.getElementsByName("user.password")[0].value.trim();
	var type = document.getElementsByName("user.type")[0].value.trim();
	if (name == "") {
		document.getElementById("login_hint_box").style.display = "block";
		document.getElementById("login_hint_box").innerHTML = "用户名不能为空 ";
	} else if (pwd == "") {
		document.getElementById("login_hint_box").style.display = "block";
		document.getElementById("login_hint_box").innerHTML = "密码不能为空";
	} else {
		if (type == "0") {
			document.getElementById("loginForm").action = "buyerLoginAction!login.action";
			document.getElementById("loginForm").submit();
		} else if (type == "1") {
			document.getElementById("loginForm").action = "buyerLoginAction!login.action";
			document.getElementById("loginForm").submit();
		}
	}
}
