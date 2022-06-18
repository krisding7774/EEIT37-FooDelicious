<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<head>
<link rel="stylesheet" href="../../../css/backendOrder.css">
<link rel="stylesheet" href="../../css/backend.css">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../fontawesome/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap" rel="stylesheet">
<script src="../../js/jquery-3.6.0.min.js"></script>
</head>

<body>
	<h1 class="tableName titleName2">會員訂單列表 <br> <span class="littleName">Order List</span>
	</h1>
	<ul id="selectPage" class="nav nav-tabs">
		<li class="nav-item" style="background: #f0f8ff"><a id="all" class="nav-link active" aria-current="page" href="#">全部訂單</a></li>
		<li class="nav-item" style="background: #f0f8ff"><a id="success" class="nav-link" href="#">完成</a></li>
		<li class="nav-item" style="background: #f0f8ff"><a id="handling" class="nav-link" href="#">處理中</a></li>
		<li class="nav-item" style="background: #f0f8ff"><a id="failed" class="nav-link" href="#">失敗</a></li>
	</ul>

	<section class="content">
		<div class="col-xs-12">
			<table id="" class='table table-striped table-hover' style="background: white">
				<thead>
					<tr>
						<th class="col table-warning smalW">訂單編號</th>
						<th class="col table-warning midW">收件人姓名</th>
						<th class="col table-warning midW">收件人電話</th>
						<th class="col table-warning large">收件人地址</th>
						<th class="col table-warning smalW">訂單狀態</th>
						<th class="col table-warning smalW">訂單金額</th>
						<th class="col table-warning midW">成立時間</th>
						<th class="col table-warning smalW">訂單明細</th>
					</tr>
				</thead>
				<tbody id="orders"></tbody>
			</table>

			<!-- Modal -->
			<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align: center">
				<div class="modal-dialog modal-dialog-centered modal-dialog modal-lg row justify-content-start">
					<div class="modal-content">
						<div class="modal-header">
							<h3>訂單明細</h3>
						</div>
						<div class="modal-body">
							<table class="table align-middle table-striped table-hover">
								<thead>
									<tr>
										<th scope="col">產品圖片</th>
										<th scope="col">產品名稱</th>
										<th scope="col">產品價格</th>
										<th scope="col">產品數量</th>
									</tr>
								</thead>
								<tbody class="ordersDetail">
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
						</div>
					</div>
				</div>
			</div>
			<nav aria-label="Page navigation example ">
				<ul id="page" class="pagination justify-content-center"></ul>
			</nav>
		</div>
	</section>

	<script src="../../js/viewOrders.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
</body>
