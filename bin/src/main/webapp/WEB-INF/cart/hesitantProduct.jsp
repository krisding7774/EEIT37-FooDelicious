<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<head>

<link rel="stylesheet" href="../../../css/backendReportProduct.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

</head>
<body>
	<h1 class="tableName titleName2">
		猶豫商品 <br> <span class="littleName">Hesitant Products</span>
	</h1>

	<div class="foodArea">

		<p class="textName ">
			<i class="fas fa-shopping-cart"></i> 購物車
		</p>

		<div class="col-sm-5 report1">
			<canvas id="myChart"></canvas>
		</div>

		<div id="report2" class="col-sm-5">
			<canvas id="myChart2"></canvas>
		</div>

	</div>

	<div class="col-sm-5 report2" style="text-align: center">
		<h2>猶豫商品 Top 5</h2>
		<table class="table align-middle table-striped table-hover">
			<thead>
				<tr>
					<th scope="col" class="table-danger">會員編號</th>
					<th scope="col" class="table-danger">商品品牌</th>
					<th scope="col" class="table-danger">商品名稱</th>
					<th scope="col" class="table-danger">商品價格</th>
					<th scope="col" class="table-danger">購物車數量</th>
					<th scope="col" class="table-danger">銷售數量</th>

				</tr>
			</thead>
			<tbody id="cartList">
			</tbody>
		</table>
	</div>


	<script>
		//=========食材區=========
		$.ajax({
			url : "/report/cart",
			type : "GET",
			success : function(carts) {
				let cartList = carts;
				let data1 = cartList[0].product.productSalesFigures;
				let data2 = cartList[1].product.productSalesFigures;
				let data3 = cartList[2].product.productSalesFigures;
				let data4 = cartList[3].product.productSalesFigures;
				let data5 = cartList[4].product.productSalesFigures;

				let name1 = "商品編號：" + cartList[0].productId;
				let name2 = cartList[1].productId;
				let name3 = cartList[2].productId;
				let name4 = cartList[3].productId;
				let name5 = cartList[4].productId;

				//=========統計數據=========
				let cartHtml = "";
				for (let i = 0; i < carts.length; i++) {
					cartHtml += '<tr><th scope="row">' + cartList[i].memberId
							+ '</th>';
					cartHtml += '<td>' + cartList[i].product.productCompany
							+ '</td>';
					cartHtml += '<td>' + cartList[i].product.productName
							+ '</td>';
					cartHtml += '<td>' + cartList[i].product.productPrice
							+ '</td>';
					cartHtml += '<td>' + cartList[i].quantity + '</td>';
					cartHtml += '<td>'
							+ cartList[i].product.productSalesFigures
							+ '</td></tr>';
				}
				$("#cartList").html(cartHtml);
				//=========圖表區=========
				let ctx = $('#myChart');
				let myChart = new Chart(ctx, {
					type : 'bar', //圖表類型
					data : {
						//標題
						labels : [ name1, name2, name3, name4, name5 ],
						datasets : [ {
							label : '猶豫商品TOP 5', //標籤
							data : [ data1, data2, data3, data4, data5 ], //資料
							//圖表背景色
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)' ],
							//圖表外框線色
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)' ],
							//外框線寬度
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true,
								}
							} ]
						}
					}
				});
				
	            let ctx2 = $('#myChart2');
	            let myChart2 = new Chart(ctx2, {
	                type: 'doughnut', //圖表類型
	                data: {
	                    //標題
	                    labels: ['19歲以下', '20~29歲', '30~39歲', '40~49歲', '50~59歲', '60歲以上'],
	                    datasets: [{
	                        label: '會員年齡層分析', //標籤
	                        data: [data1, data2, data3, data4, data5], //資料
	                        //圖表背景色
	                        backgroundColor: [
	                            'rgba(255, 99, 132, 0.2)',
	                            'rgba(54, 162, 235, 0.2)',
	                            'rgba(255, 206, 86, 0.2)',
	                            'rgba(75, 192, 192, 0.2)',
	                            'rgba(153, 102, 255, 0.2)',
	                            'rgba(255, 159, 64, 0.2)'
	                        ],
	                        //圖表外框線色
	                        borderColor: [
	                            'rgba(255, 99, 132, 1)',
	                            'rgba(54, 162, 235, 1)',
	                            'rgba(255, 206, 86, 1)',
	                            'rgba(75, 192, 192, 1)',
	                            'rgba(153, 102, 255, 1)',
	                            'rgba(255, 159, 64, 1)'
		],
									//外框線寬度
									borderWidth : 1
								} ]
							},

						});

			}
		})
	</script>

</body>
</html>
