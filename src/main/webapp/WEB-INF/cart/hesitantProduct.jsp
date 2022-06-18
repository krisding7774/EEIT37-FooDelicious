<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<head>
<link rel="stylesheet" href="../../../css/backendAge.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
</head>

<body>
	<h1 class="tableName titleName2">猶豫商品 <br> <span class="littleName">Hesitant Products</span></h1>
	
	<div class="reportArea">
		<div id="report1" class="col-sm-5">
			<canvas id="myChart"></canvas>
		</div>
		<div id="report2" class="col-sm-5">
			<canvas id="myChart2"></canvas>
		</div>
	</div>

	<div id="textArea" class="col-sm-11" style="text-align: center">
		<h2>猶豫商品</h2>
		<table class="table align-middle table-striped table-hover">
			<thead>
				<tr>
					<th scope="col" class="table-danger">商品品牌</th>
					<th scope="col" class="table-danger">商品名稱</th>
					<th scope="col" class="table-danger">商品銷售數</th>
					<th scope="col" class="table-danger">購物車數量</th>
				</tr>
			</thead>
			<tbody id="cartList">
			</tbody>
		</table>
	</div>

	<script src="../../js/hesitantProduct.js"></script>
</body>
</html>
