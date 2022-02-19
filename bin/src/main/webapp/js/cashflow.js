function showList() {
	$.ajax({
		url: "/shoppingCart/CashflowList2",
		type: "GET",
		contentType: "application/json; charset=utf-8",
		success: function(carts) {
			alert(carts);
			if (carts != null) {
				$("#cartList").empty();
				var str = "";
				for (let cart of carts) {
					str += '<tr>';
					str += '<td>' + cart.memberId + '</td>';
					str += '<td>' + cart.productId + '</td>';
					str += '<td>' + cart.product.productName + '</td>';
					str += '<td>' + cart.quantity + '</td>';
					str += '<td>' + cart.product.productPrice + '</td>';
					str += '<td>' + (cart.product.productPrice * cart.quantity) + '</td>';
					str += '<td>' + cart.member.memberName + '</td>';
					str += '<td>' + cart.member.memberPhone + '</td>';
					str += '<td>' + cart.member.memberMail + '</td>';
					str += '<td>' + cart.member.memberAddress + '</td>';
					str += '<td>' + cart.member.memberId + '</td>';
					str += '<td>' + cart.order.ordersId + '</td>'
				}
				$("#cartList").html(str);
			}

		}
	})
	$.ajax({
		url: "/shoppingCart/discountTotal/" + discounts + "/" + coin,
		type: "GET",
		success: function(priceTotal) {
			var str = "";
			if (priceTotal < 1000) {
				$("#freight").empty();
				str += ' 運費：<span>100 元</span>';
				$("#freight").append(str);
				priceTotal += 100;
				$("#pay").attr("value", "NT$: " + priceTotal + " 元");
			} else {
				$("#freight").empty();
				str += '運費：<del style="color: red;"> 100 元</del>&nbsp;&nbsp;<span>0 元</span>';
				$("#freight").append(str);
				$("#pay").attr("value", "NT$: " + priceTotal + " 元");
			}
			discountMoney(discounts, coin);
		}
	})
}


function listComfirm() {
		
	var postAddress = {		
		commonaddress: $("#commonaddress").val()
	};
	console.log(postAddress)
	$.ajax({
		url: "/address.insert",
		data: JSON.stringify(postAddress),
		type: "POST",
		contentType: "application/json;charset=utf-8",
		success:function(){
			alert("成功了")
		}
	});
	$.ajax({
		url: "/shoppingCart/CashflowList2",
		type: "GET",
		success: function() {
			const Toast = Swal.mixin({
				toast: true,
				timer: 2500,
				timerProgressBar: true,
				didOpen: (toast) => {
					toast.addEventListener('mouseenter', Swal.stopTimer)
					toast.addEventListener('mouseleave', Swal.resumeTimer)
				}
			})
			Toast.fire({
				icon: 'success',
				title: 'sucess！！！',
				text: '訂單資訊以寄至信箱！！！',
			})
			showItem();
		}
	})
//	$.ajax({
//		url: "/shoppingCart/CashflowList2",
//		type: "GET",
//		success: function countDown() {
//			setTimeout("location.href ='http://localhost:8080'", 2500)			
//		}
//
//	})
}







//window.onload = function() {
//	$.ajax({
//		url: "/shoppingCart/CashflowList2",
//		type: "GET",
//		contentType: "application/json; charset=utf-8",
//		success: function(list) {
//			let str = "";
//			$("memberId").val(list.memberId);
//			$("orderId").val(list.ordersId);
//			$("orderTotal").val(list.priceTotal);
//			$("productName").val(list.productName);
//			$("quantity").val(list.quantity);
//			$("productPrice").val(list.productPrice);
//			$("memberName").val(list.memberName);
//			$("memberPhone").val(list.memberPhone);
//			$("memberMail").val(list.memberMail);
//			$("memberAddress").val(list.memberAddress);
//		}
//	})
//}