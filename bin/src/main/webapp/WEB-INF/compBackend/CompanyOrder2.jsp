<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<body>
	<h1 class="tableName">
		訂單列表<span class="smallFont">Order List</span>
	</h1>

	<section class="content">
		<div class="col-xs-12">
			<table id="" class='table table-striped table-hover '>
				<thead>
					<tr>

						<th class="col table-warning smalW">訂單編號</th>
						<th class="col table-warning midW">會員帳號</th>
						<th class="col table-warning midW">收件人姓名</th>
						<th class="col table-warning midW">收件人電話</th>
						<th class="col table-warning large">收件人地址</th>
						<th class="col table-warning smalW">訂單狀態</th>
						<th class="col table-warning smalW">訂單金額</th>
						<th class="col table-warning midW">新增日期</th>
						<th class="col table-warning smalW">更新</th>
					</tr>
				</thead>
				<tbody id="orders"></tbody>
			</table>
			<nav aria-label="Page navigation example ">
				<ul id="page" class="pagination justify-content-center"></ul>
			</nav>
			<input type="text" hidden id="companyId" value='${userID}'>

		</div>
	</section>



	<script>
		//=============所有商品資料=============

		let companyId = $("#companyId").val();
		let companyIdsGlobal;

		$.ajax({
			url : "/companyProducts",
			type : "GET",
			success : function(allCompanyProducts) {

				let num = allCompanyProducts.length;

				const productIdsLocal = new Array();

				for (let z = 0; z < num; z++) {
					if (allCompanyProducts[i].productCompanyId == companyId) {
						productIdsLocal.unshift(allCompanyProducts[z].productId);
						//alert(productIdsLocal);	
					}

				}
				
				companyIdsGlobal = productIdsLocal;
				//alert(companyIdsGlobal);
				//alert(companyIdsGlobal.length);
			}
		});

		let productId;
		let productIdArray;
		let productQuantity;
		let quantity;
		let companyOrder;
		let allCompanyOrders;

		$.ajax({
					url : "/companyOrders",
					type : "GET",
					success : function(allOrderDetails) {
						let len = allOrderDetails.length;

						//alert(len);

						for (let i = 0; i < len; i++) {

							
							let productDetailJson = JSON.parse(allOrderDetails[i].productDetail);
							
							//alert(allOrderDetails[i].productDetail.length);

							//alert(productDetailJson);

							let jsonLen = Object.keys(productDetailJson).length;
							
							alert(jsonLen);
							
							
							//nope
							alert(productDetailJson.keys(productDetailJson)[0]);

							

							for (let j = 0; j < jsonLen; j++) {
								
								//這裡會抓到 more than one productId, 因為key都是 id
								productId = productDetailJson[j].id;
								
								//alert(productId);
								//how to access a specific value when the keys are the same?
								//alert(productId[0]); //this doesn't work
								
								
								//alert(productDetailJson[j].quantity);
								//productIdArray.unshift(productId);
								//alert(productIdArray);
								//alert(productIdArray[1]);
								//productQuantity = orderDetailJson[j].quantity;
								//alert(productQuantity);

								for (let k = 0; k < companyIdsGlobal.length; k++) {

									if (productId == companyIdsGlobal[k]) {
										//alert(productId[0])
										//alert(productId[1]);
										productQuantity = productDetailJson[j].quantity;

										//alert(productQuantity);

										//alert(allOrderDetails[i].ordersBean.ordersState);

										companyOrder = {
											"ordersId" : allOrderDetails[i].ordersId,
											"memberId" : allOrderDetails[i].ordersBean.memberId,
											"orderDate" : allOrderDetails[i].ordersBean.orderDate,
											"ordersName" : allOrderDetails[i].ordersBean.ordersName,
											"ordersPhone" : allOrderDetails[i].ordersBean.ordersPhone,
											"ordersAddress" : allOrderDetails[i].ordersBean.ordersAddress,
											"ordersState" : allOrderDetails[i].ordersBean.ordersState,
											"quantity" : productQuantity,
											"productId" : productId,

										};

										//alert("orderid: " +companyOrder.ordersId+ "productid: " +companyOrder.productId + "quantity" + companyOrder.quantity);

										//allCompanyOrders.unshift(companyOrder);
										//alert(companyOrder);
										break;
									}
								}

							}

						}

						//alert(allCompanyOrders);

					},
				});
	</script>
	
	

</body>