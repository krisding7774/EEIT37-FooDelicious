$(".checkout").on("click", function() {
	if ($("#flexRadioDefault1").is(":checked")) {

		//	判斷是否有填寫收件人資訊
		if ($("#name").val().length == 0) {
			$(".validate1").removeClass("d-none");
		} else if ($("#phone").val().length == 0) {
			$(".validate2").removeClass("d-none");
		} else if ($("#address").val().length == 0) {
			$(".validate3").removeClass("d-none");
		}

		//	判斷是否有填寫收件人資訊
		if ($("#name").val().length == 0 && $("#phone").val().length == 0 && $("#address").val().length == 0) {
			$(".validate1").removeClass("d-none");
			$(".validate2").removeClass("d-none");
			$(".validate3").removeClass("d-none");
		}

		//	判斷有填寫收件人資訊才可以進行結單動作
		if ($("#name").val().length != 0 && $("#phone").val().length != 0 && $("#address").val().length != 0) {

			var orders = { // 用JSON格式做成JavaScript物件
				ordersName: $("#name").val(),
				ordersPhone: $("#phone").val(),
				ordersAddress: $("#address").val(),
			}

			// 	SweetAlert2模板
			let timerInterval
			Swal.fire({
				title: '請稍後!!',
				html: '',
				timer: 10000,
				timerProgressBar: true,
				didOpen: () => {
					Swal.showLoading()
					const b = Swal.getHtmlContainer().querySelector('b')
					timerInterval = setInterval(() => {
						b.textContent = Swal.getTimerLeft()
					}, 100)
				},
				willClose: () => {
					clearInterval(timerInterval)
				}
			}).then((result) => {
				/* Read more about handling dismissals below */
				if (result.dismiss === Swal.DismissReason.timer) {
					console.log('I was closed by the timer')
				}
			})

			$.ajax({
				url: "/orders/insert",
				type: "POST",
				contentType: "application/json;charset=utf-8;",
				data: JSON.stringify(orders), // 轉成純文字送到後端
				success: function() {
					window.location.href = "/ordersEnd"
				}
			})
		}
	} else {
		window.location.href = "/CashflowList";
	}
})

// 前往訂單明細頁
function goDetail(ordersId) {
	$.ajax({
		url: "/toOrderDetailPage/" + ordersId,
		type: "GET",
		success: function() {
			window.location.href = "/toOrderDetailPage/" + ordersId;
		}
	})
}

// 一鍵輸入
function oneClick() {
	$("#name").val("Ace哥");
	$("#phone").val("0960072527");
	$("#address").val("桃園市龍潭區經華路444號(透天厝)");
}
