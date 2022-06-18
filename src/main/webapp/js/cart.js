// 秀出購物車產品
function showItem() {
	$.ajax({
		url: "/shoppingCart/show",
		type: "GET",
		contentType: "application/json; charset=utf-8",
		success: function(carts) {
			if (carts != null) {
				$("#cartList").empty();
				var str = "";
				for (let cart of carts) {
					str += '<tr>';
					str += '<th scope="row"><img src="/img/' + cart.product.productPics + '"style="width:100px ;height:100px"></th>';
					str += '<td>' + cart.product.productName + '</td>';
					str += '<td>' + cart.product.productPrice + '</td>';
					str += '<td><button type="button" class="btn btn-secondary btn-sm" onclick="changeNum(' + cart.productId + ',' + -1 + ')" id="minus" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus"><line x1="5" y1="12" x2="19" y2="12"></line></svg></button>'
						+ ' <input class="num" [type="number"]  readonly="readonly" value=' + cart.quantity + ' />'
						+ ' <button type="button" class="btn btn-primary btn-sm" onclick="changeNum(' + cart.productId + ',' + 1 + ')" id="add" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg></button></td>';
					str += '<td>' + (cart.product.productPrice * cart.quantity) + '</td>';
					str += '<td><button onclick="deleteItem(' + cart.product.productId + ')"class="btn btn-dark btn-sm"</td><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></button>';
					str += '</tr>';
				}
				discountTotal();
				$("#cartList").html(str);
			}
		}
	})
}

// 將產品加入購物車
function addToCart(productId) {
	var quantity = $("#pdQty").val();
	var postData = { "pid": productId, "qty": quantity }; // 用JSON格式做成JavaScript物件
	$.ajax({
		url: "/shoppingCart/insert",
		type: "POST",
		data: JSON.stringify(postData), // 轉成純文字送到後端
		contentType: "application/json; charset=utf-8",
		success: function() {
			showItem();
		}
	})
}

// 更新購物車數量
function changeNum(productId, quantity) {
	$.ajax({
		url: "/shoppingCart/" + productId + "/" + quantity,
		type: "GET",
		success: function() {
			showItem();
		}
	})
}

// 刪除購物車產品
function deleteItem(productId) {
	$.ajax({
		url: "/shoppingCart/" + productId,
		type: "DELETE",
		success: function() {
//			SweetAlert2的模板
			const Toast = Swal.mixin({
				toast: true,
				position: 'top-end',
				showConfirmButton: false,
				timer: 3000,
				timerProgressBar: true,
				didOpen: (toast) => {
					toast.addEventListener('mouseenter', Swal.stopTimer)
					toast.addEventListener('mouseleave', Swal.resumeTimer)
				}
			})
			Toast.fire({
				icon: 'success',
				title: '刪除成功！！！'
			})
			showItem();
		}
	})
}

// 減少折扣金幣
function minusNum() {
	var coin = $("#goldCoin").val();
	coin--;
	if (coin < 0) {
		coin = 0;
	}
	$("#goldCoin").attr("value", coin);
	discountTotal();
}

// 增加折扣金幣
function addNum() {
	var coin = $("#goldCoin").val();
	var limit = $("#hiddenCoin").val();
	coin++;
	if (coin > limit) {
		coin = limit;
	}
	$("#goldCoin").attr("value", coin);
	discountTotal();
}

$("#button-addon1").click(function() {
	discountTotal();
})

// 折扣後金額
function discountTotal() {
	var discounts = $("#discount").val();
	var coin = $("#goldCoin").val();
	if (discounts != "") {
		disocunts = discounts;
	} else {
		discounts = "No Discount";
	}
	$.ajax({
		url: "/shoppingCart/discountTotal/" + discounts + "/" + coin,
		type: "GET",
		success: function(priceTotal) {
			var str = "";
			if (priceTotal < 1100) {
				$("#freight").empty();
				str += ' 運費：<span>100 元</span>';
				$("#freight").append(str);
				$("#pay").attr("value", "NT$: " + priceTotal + " 元");
			} else {
				$("#freight").empty();
				str += '運費：<del style="color: red;">100 元</del>&nbsp;&nbsp;<span>0 元</span>';
				$("#freight").append(str);
				$("#pay").attr("value", "NT$: " + priceTotal + " 元");
			}
			discountMoney(discounts, coin);
		}
	})
}

// 折扣金額
function discountMoney(discounts, coin) {
	$.ajax({
		url: "/getContent/" + discounts + "/" + coin,
		type: "GET",
		success: function(discountContent) {
			$("#discountPrice").attr("value", discountContent);
		}
	})
}

// 領取折價券
function insertDis() {
	$.ajax({
		url: "/shoppingCart/insertDis",
		type: "GET",
		success: function(dis) {
			Swal.fire(
				'已領取二百元折價券!!',
				'請點選使用進行折價!',
				'success'
			)
			$("#discount").attr("value", dis);
		}
	})
}

// 右上角模糊查詢
function searchProduct() {
	var name = $("#appleNoSale").val();
	if (name != null) {
		$.ajax({
			url: "/searchProduct/" + name,
			type: "GET",
			contentType: "application/json; charset=utf-8",
			success: function(productPolymers) {
				var product = "";
				if (productPolymers != null) {
					$(".productInformation").empty();
					for (let productPolymer of productPolymers) {
						product += '<tr>';
						product += '<td><img src=/img/' + productPolymer.productPics + ' style="width:100px ;height:100px"></td>';
						product += '<td>' + productPolymer.productName + '</td>';
						product += '<td>NT$:' + productPolymer.productPrice + '元</td>';
						product += '<td><input id="pdQty" type="number" value = 1 min=1 max=' + productPolymer.productStock + '></td>';
						product += '<td><button type="button" class="btn btn-danger btn-sm" onclick="addToCart(' + productPolymer.productId + ')">加入購物車</button></td>';
						product += '</tr>';
					}
				}
				$(".productInformation").html(product);
			}
		})
	}
}
