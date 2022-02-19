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
	<h1 class="tableName" style="margin-left: 10px">
		暢銷商品 <span class="smallFont">Top selling products</span>
	</h1>
	<div id="textArea" class="col-sm-11"
		style="text-align: center; margin: auto; margin-left: 10px">
		<h3 style="padding: 3px; font-weight: bold">當月暢銷商品 Top 10</h3>
		<table class="table align-middle table-striped table-hover"
			style="text-align: center">
			<thead>
				<tr>
					<th scope="col" class="table-success">名次</th>
					<th scope="col" class="table-success">編號</th>
					<th scope="col" class="table-success">商品名稱</th>
					<th scope="col" class="table-success">庫存</th>
					<th scope="col" class="table-success">銷售數量</th>
					<th scope="col" class="table-success">總銷售額</th>
				</tr>
			</thead>
			<tbody id="topTenList" style="text-align: center">
			</tbody>
		</table>
	</div>





	<script>
		//==================
		window.onload = function() {

			$.ajax({
				url : "/companyBestSeller/topten",
				type : "GET",
				success : function(topTenProducts) {

					let topTenProductsList = topTenProducts;
					//alert(topTenProducts.length);

			
					

					//alert(topTenProductsList[0].productSalesFigures)

					//=========統計數據=========
					let topTenListHtml = "";
					for (let i = 0; i < topTenProductsList.length; i++) {
						//alert(topTenProductsList[i].productId)
						topTenListHtml += '<tr><th scope="row">' + (i + 1)
								+ '</th>';
						topTenListHtml += '<td>'
								+ topTenProductsList[i].productId + '</td>';

						let nameObj = new String(
								topTenProductsList[i].productName);
						let nameString = nameObj.substring(0, 15);

						topTenListHtml += '<td>' + nameString + '</td>';
						//alert(nameString)

						topTenListHtml += '<td>'
								+ topTenProductsList[i].productStock + '</td>';
						topTenListHtml += '<td style="font-weight:bold">'
								+ topTenProductsList[i].productSalesFigures
								+ '</td>';
						let num = topTenProductsList[i].productSalesFigures;
						let price = topTenProductsList[i].productPrice
						let totalPrice = price * num;
						let total = totalPrice.toLocaleString('en-US');
						topTenListHtml += '<td class="total">NTD: ' + total
								+ '</td></tr>';
						//alert(total)
					}
					$("#topTenList").html(topTenListHtml);

			

					
					
				
						
				}
			})

		}
	</script>

</body>
</html>
