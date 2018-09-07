/*添加宝贝的校验*/
function checkBaby() {
	document.getElementById("nameDiv").innerHTML = "";
	document.getElementById("typeDiv").innerHTML = "";
	document.getElementById("priceDiv").innerHTML = "";
	document.getElementById("numDiv").innerHTML = "";
	document.getElementById("photoDiv").innerHTML = "";
	var name = document.getElementsByName("product.name")[0].value.trim();
	var type = document.getElementsByName("product.type")[0].value.trim();
	var price = document.getElementsByName("product.price")[0].value.trim();
	var num = document.getElementsByName("product.num")[0].value.trim();
	var photo = document.getElementsByName("photo")[0].value.trim();
	var flag = true;
	// 宝贝名称判断
	if (name == "") {
		document.getElementById("nameDiv").innerHTML = "宝贝名称不能为空";
		flag = false;
	}
	if (name.length > 50) {
		document.getElementById("nameDiv").innerHTML = "宝贝名称不能超过12个字符";
		flag = false;
	}
	// 宝贝类别
	if (type == "") {
		document.getElementById("typeDiv").innerHTML = "宝贝类别不能为空";
		flag = false;
	}
	// 宝贝价格
	if (price == "") {
		document.getElementById("priceDiv").innerHTML = "宝贝价格不能为空";
		flag = false;
	} else if (isNaN(price)) {
		document.getElementById("priceDiv").innerHTML = "宝贝价格必须是数值型";
		flag = false;
	}
	// 宝贝数量
	if (num == "") {
		document.getElementById("numDiv").innerHTML = "宝贝数量不能为空";
		flag = false;
	} else if (isNaN(num)) {
		document.getElementById("numDiv").innerHTML = "宝贝数量必须是数值型";
		flag = false;
	}
	if (photo == "") {
		document.getElementById("photoDiv").innerHTML = "请选择宝贝图片";
		flag = false;
	}
	return flag;
}
