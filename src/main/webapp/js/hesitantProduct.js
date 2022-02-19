$.ajax({
	url: "/report/cart",
	type: "GET",
	success: function(carts) {
		let cartList = carts;
		let data1 = cartList[0].quantity;
		let data2 = cartList[1].quantity;
		let data3 = cartList[2].quantity;
		let data4 = cartList[3].quantity;
		let data5 = cartList[4].quantity;
		let data6 = cartList[5].quantity;
		let data7 = cartList[0].product.productSalesFigures;
		let data8 = cartList[1].product.productSalesFigures;
		let data9 = cartList[2].product.productSalesFigures;
		let data10 = cartList[3].product.productSalesFigures;
		let data11 = cartList[4].product.productSalesFigures;

		let name1 = cartList[0].product.productCompany;
		let name2 = cartList[1].product.productCompany;
		let name3 = cartList[2].product.productCompany;
		let name4 = cartList[3].product.productCompany;
		let name5 = cartList[4].product.productCompany;
		let name6 = cartList[5].product.productCompany

		let cartHtml = "";
		for (let i = 0; i < carts.length; i++) {
			cartHtml += '<tr><th scope="row">'
				+ cartList[i].product.productCompany
				+ '</th>';
			cartHtml += '<td>'
				+ cartList[i].product.productName + '</td>';
			cartHtml += '<td>'
				+ cartList[i].product.productSalesFigures
				+ '</td>';
			cartHtml += '<td>' + cartList[i].quantity
				+ '</td></tr>';
		}
		$("#cartList").html(cartHtml);
		//=========圖表區=========
		let ctx = $('#myChart');
		let myChart = new Chart(
			ctx,
			{
				// The type of chart we want to create
				type: 'line',

				// The data for our dataset
				data: {
					labels: [name1, name2, name3, name4,
						name5, name6],
					datasets: [{
						label: '購物車數量',
						backgroundColor: 'rgb(255, 99, 132)',
						borderColor: 'rgb(255, 99, 132)',
						data: [data1, data2, data3,
							data4, data5, data6]

					}]
				},

				// Configuration options go here
				options: {
					title: {
						display: true,
						text: '猶豫商品(全)'
					},
					legend: {
						labels: {
							fontColor: 'rgb(0, 0, 0)',
							usePointStyle: true
						}
					},
					scales: {
						// 各軸標題設定
						// https://www.chartjs.org/docs/latest/axes/labelling.html
						// 各軸格線設定
						// https://www.chartjs.org/docs/latest/axes/styling.html
						// x 軸設置
						xAxes: [{
							// x 軸標題
							scaleLabel: {
								display: true,
								fontSize: 16
							},
							// x 軸格線
							gridLines: {
								display: true
							}
						}],
						// y 軸設置
						yAxes: [{
							// y 軸標題
							scaleLabel: {
								display: true,
								fontSize: 16
							},
							// y 軸格線
							gridLines: {
								display: false
							},
							// y 軸間距
							ticks: {
								min: 0,
								max: 120,
								stepSize: 30
							}
						}]
					}
				}
			});

		let ctx2 = $("#myChart2")
		new Chart(
			ctx2,
			{
				type: 'radar',
				data: {
					labels: [name1, name2, name3, name4,
						name5],
					datasets: [
						{
							label: "商品銷售數",
							fill: true,
							backgroundColor: "rgba(179,181,198,0.2)",
							borderColor: "rgba(179,181,198,1)",
							pointBorderColor: "#fff",
							pointBackgroundColor: "rgba(179,181,198,1)",
							data: [data7, data8,
								data9, data10,
								data11]
						},
						{
							label: "購物車數量",
							fill: true,
							backgroundColor: "rgba(255,99,132,0.2)",
							borderColor: "rgba(255,99,132,1)",
							pointBorderColor: "#fff",
							pointBackgroundColor: "rgba(255,99,132,1)",
							pointBorderColor: "#fff",
							data: [data1, data2,
								data3, data4, data5]
						}]
				},
				options: {
					title: {
						display: true,
						text: '猶豫商品Top 5'
					}
				}
			});
	}
})
