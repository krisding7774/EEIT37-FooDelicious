//=============顯示所有商品資料=============
window.onload = function() {
	$.ajax({
		url: "/viewOrders",
		type: "GET",
		success: function(productData) {
			let num = productData.length;
			if (num >= 10) {
				pages(10, productData);
			} else {
				pages(num, productData);
			}
		}
	});
}

//=============顯示分頁設定=============
//=============全部訂單=============
let urlString = "";
$("#all").on("click", function() {
	$("#selectPage a").prop("class", "nav-link");
	$("#all").prop("class", "nav-link active");
	urlString = "/viewOrders";
	$.ajax({
		url: urlString,
		type: "GET",
		success: function(productAll) {
			let num = productAll.length;
			if (num >= 10) {
				pages(10, productAll);
			} else {
				pages(num, productAll);
			}
		}
	});
})

//=============完成=============
$("#success").on("click", function() {
	$("#selectPage a").prop("class", "nav-link");
	$("#success").prop("class", "nav-link active");
	urlString = "/viewOrders/pages/完成";
	$.ajax({
		url: urlString,
		type: "GET",
		success: function(success) {
			$("#products").html("");
			$("#page").html(" ");
			let num = success.length;
			if (num >= 10) {
				pages(10, success);
			} else {
				pages(num, success);
			}
		}
	});
})

//=============處理中=============
$("#handling").on("click", function() {
	$("#selectPage a").prop("class", "nav-link");
	$("#handling").prop("class", "nav-link active");
	urlString = "/viewOrders/pages/訂單處理中";
	$.ajax({
		url: urlString,
		type: "GET",
		success: function(handling) {
			$("#products").html("");
			$("#page").html("");
			let num = handling.length;
			if (num >= 10) {
				pages(10, handling);
			} else {
				pages(num, handling);
			}
		}
	});
})

//=============失敗=============
$("#failed").on("click", function() {
	$("#selectPage a").prop("class", "nav-link");
	$("#failed").prop("class", "nav-link active");
	urlString = "/viewOrders/pages/失敗";
	$.ajax({
		url: urlString,
		type: "GET",
		success: function(failed) {
			$("#products").html("");
			$("#page").html("");
			let num = failed.length;
			if (num >= 10) {
				pages(10, failed);
			} else {
				pages(num, failed);
			}
		}
	});
})

//=============分頁程式=============
function pages(maxNum, dataSource) { //輸入單頁最大筆數和資料來源
	//=================分頁功能================
	//最大頁數
	let maxPage;
	//目前顯示頁數
	let nowPage = 0;
	//每頁最大筆數
	let maxItems = maxNum;
	//設定起始編號
	let startItem = 0;
	//設定結束編號
	let endItem = maxItems;

	//讀回資料時就先顯示
	showData(startItem, endItem, dataSource);

	//計算出最大頁數。
	if (dataSource.length % maxItems == 0) {
		maxPage = Math.floor(dataSource.length / maxItems);
	} else {
		maxPage = (Math.floor(dataSource.length / maxItems)) + 1;
	}
	//生成前先清空
	$("#page").html(" ");
	//動態生成頁數
	let pageHtml = `<li class="page-item previous disabled pageMove"><a class="page-link">上一頁</a></li>`;
	for (let i = 0; i < maxPage; i++) {
		let pageNum = i + 1;
		pageHtml += `<li id=` + i + ` class="page-item page pageNum pageMove"><a class="page-link">`
			+ pageNum + `</a></li>`;
	}
	;
	pageHtml += `<li class="page-item next pageMove"><a class="page-link" >下一頁</a></li>`;
	$("#page").html(pageHtml);

	//綁定前先清除綁定事件
	$("#page").unbind("click");
	//綁定click事件
	$("#page").on("click", ".page", function() {
		nowPage = ($(this).prop("id")) * 1;//強制轉成數字型態
		$(".pageNum").prop("class", "page-item page pageNum")
		$(this).prop("class", "page-item page pageNum active")
		//恢復上、下頁的功能
		$(".previous").prop("class", "page-item previous");
		$(".next").prop("class", "page-item next");
		//計算是否是最後一頁
		if ((nowPage) + 1 >= maxPage) {
			startItem = nowPage * maxItems;
			if (dataSource.length % maxItems == 0) {
				endItem = startItem + maxItems
			} else {
				endItem = startItem + dataSource.length % maxItems;
			}

		} else {
			startItem = nowPage * maxItems;
			endItem = startItem + maxItems;
		}
		showData(startItem, endItem, dataSource);
	});

	//=======上一頁設定========
	$("#page").on(
		"click",
		".previous",
		function() {

			//恢復下一頁的功能
			$(".next").prop("class", "page-item next");

			let page = nowPage - 1;

			$(".pageNum").prop("class", "page-item page pageNum")
			$("#" + page).prop("class",
				"page-item page pageNum active")

			//判斷是否已經是第一頁了，取消上一頁功能
			if (page <= 0) {
				$(".previous").prop("class",
					"page-item previous disabled");
				startItem = 0 * maxItems;
				endItem = startItem + maxItems;
			} else {
				startItem = page * maxItems;
				endItem = startItem + maxItems;
			}
			showData(startItem, endItem, dataSource);
			nowPage = page;
		});

	//=============下一頁設定=============
	$("#page").on("click", ".next", function() {

		//恢復上一頁的功能
		$(".previous").prop("class", "page-item previous");

		let page = nowPage + 1;

		$(".pageNum").prop("class", "page-item page pageNum")
		$("#" + page).prop("class", "page-item page pageNum active")

		//計算是否是最後一頁，並取消下一頁功能
		if (page >= (maxPage - 1)) {
			$(".next").prop("class", "page-item next disabled")
			startItem = page * maxItems;
			if (dataSource.length % maxItems == 0) {
				endItem = startItem + maxItems
			} else {
				endItem = startItem + dataSource.length % maxItems;
			}
		} else {
			startItem = page * maxItems;
			endItem = startItem + maxItems;
		}
		showData(startItem, endItem, dataSource);
		nowPage = page;
	});
}

//=============顯示功能=============
function showData(startItem, endItem, dataSource) {
	let txt = "<tr>";
	for (let i = startItem; i < endItem; i++) {
		txt += "<td class='align-middle'>" + dataSource[i].ordersId
			+ "</td>"
		txt += "<td class='align-middle'>" + dataSource[i].ordersName
			+ "</td>"
		txt += "<td class='align-middle'>" + dataSource[i].ordersPhone
			+ "</td>"
		txt += "<td class='align-middle'>"
			+ dataSource[i].ordersAddress + "</td>"
		txt += "<td class='align-middle'>" + dataSource[i].ordersState
			+ "</td>"
		txt += "<td class='align-middle'>" + dataSource[i].ordersTotal
			+ "</td>"
		let newDate = new Date(dataSource[i].ordersDate);
		let register = newDate.toLocaleString();
		txt += "<td class='align-middle'>" + register + "</td>"
		txt += '<td class="align-middle"><button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="showDetail(' + dataSource[i].ordersId + ')"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></button></td></tr>'
	}
	$("#orders").html(txt);
}

function showDetail(ordersId) {
	$.ajax({
		url: "/toOrderDetailPage/" + ordersId,
		type: "GET",
		contentType: "application/json; charset=utf-8",
		success: function(details) {
			var orders = "";
			var total = 0;
			if (details != null) {
				$(".ordersDetail").empty();
				for (let detail of details) {
					orders += '<tr>';
					orders += '<td><img src=/img/' + detail.product.productPics + ' style="width:100px ;height:100px"></td>';
					orders += '<td>' + detail.product.productName + '</td>';
					orders += '<td>' + detail.product.productPrice + '</td>';
					orders += '<td>' + detail.quantity + '</td>';
					orders += '</tr>';
					total += detail.product.productPrice * detail.quantity;
				}
				if (orders != "") {
					if (total < 1000) {
						total -= 110;
					} else {
						total -= 210;
					}
					orders += '<tr><td colspan="4">訂單已折扣 NT$:210元</td></tr>';
					orders += '<tr><td colspan="4">訂單總金額 NT$:' + total + '元</td></tr>';
				}
			}
			$(".ordersDetail").html(orders);
		}
	})
}