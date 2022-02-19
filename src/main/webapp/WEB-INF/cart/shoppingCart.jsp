<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>

<html>

<head>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="css/cart.css" rel="stylesheet">
<link href="../../css/default4.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kosugi+Maru&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<meta charset="UTF-8">
<title>FooDelicious</title>

</head>

<body>

	<header class="navArea">
		<nav class="container-fluid navbar fixed-top navbar-expand-lg navbar-light bg-lightd-grid gap-3 align-items-center navArea" style="grid-template-columns: 1fr 2fr;">
			<a class="navbar-brand textCon itembox" href="${contextRoot}/">好煮意</a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item itembox"><a class="nav-link textCon" aria-current="page" href="/" style="color: black">首頁</a></li>
					<li class="nav-item itembox"><a class="nav-link textCon" href="/Product" style="color: black">前往商城</a></li>
					<li class="nav-item itembox"><a class="nav-link textCon" href="/goShareArea" style="color: black">前往分享區</a></li>
					<li class="nav-item itembox"><a class="nav-link textCon" href="/postArticle" style="color: black">發表新文章</a></li>
					<li class="nav-item itembox"><a class="nav-link textCon" href="/#contactBox" style="color: black">客服中心</a></li>
					<li class="nav-item itembox"><a class="nav-link textCon" href="/shoppingCart" style="color: black"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg></a></li>
				</ul>
			</div>

			<c:if test='${userName == null}'>
				<span>您好，請登入會員</span>
				<a class="text-dark" href="/LoginSystem">登入</a>
			</c:if>

			<c:if test='${userName != null}'>
				<span><img class="memberPic" src="/img/${memberPic}">&ensp;${userName}&ensp;</span>
				<a class="text-dark" href="/normallogout">登出</a>
			</c:if>

			<div class="d-flex align-items-center">
				<div class="flex-shrink-0 dropstart">
					<a href="/memberIndex"> <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16" class="rounded-circle"><path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" /></svg></a>
				</div>
			</div>
		</nav>
	</header>

	<!-- ===========================================分隔線=========================================== -->

	<div>
		<nav class="navbar navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-bag"><path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path><line x1="3" y1="6" x2="21" y2="6"></line>	<path d="M16 10a4 4 0 0 1-8 0"></path></svg> 好煮意｜購物車</a>
				<form class="d-flex">
					<input class="form-control me-2" type="search" id="appleNoSale" placeholder="蘋果，沒有打折！！" aria-label="Search" value="">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="searchProduct()">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
					</button>
				</form>
			</div>
		</nav>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align: center">
		<div class="modal-dialog modal-dialog-centered modal-dialog modal-lg row justify-content-start">
			<div class="modal-content">
				<div class="modal-header">
					<h3>明智的選擇！</h3>
				</div>
				<div class="modal-body">
					<table class="table align-middle table-striped table-hover">
						<tbody class="productInformation">
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>

	<c:if test="${empty carts}">
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<div class="container" id="empty">
			<h1 class="display-7 fw-bold">目前購物車是空的哦</h1>
		</div>
		<div class="container" id="ProductPage">
			<a href="/Product"><button class="btn btn-danger" type="button">來去逛逛吧!!</button></a>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</c:if>

	<c:if test="${not empty carts}">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">購物車</th>
					<th scope="col">填寫資料</th>
					<th scope="col">訂單確認</th>
				</tr>
			</thead>
		</table>

		<div class="progress">
			<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 33%">33%</div>
		</div>
		<br>

		<table class="table table-striped table align-middle">
			<thead>
				<tr>
					<th scope="col">圖片</th>
					<th scope="col">商品</th>
					<th scope="col">單價</th>
					<th scope="col">數量</th>
					<th scope="col">小計</th>
					<th scope="col">操作</th>
				</tr>
			</thead>
			<tbody id="cartList">
				<c:forEach var="carts" items="${carts}">
					<tr>
						<th scope="row"><img src="/img/${carts.product.productPics}" style="width: 100px; height: 100px"></th>
						<td>${carts.product.productName}</td>
						<td>${carts.product.productPrice}</td>
						<td><button type="button" class="btn btn-secondary btn-sm" onclick="changeNum(${carts.productId},${-1})" id="minus"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus"><line x1="5" y1="12" x2="19" y2="12"></line></svg></button> 
							<input class="num" [type="number" ] readonly="readonly" value="${carts.quantity}" />
							<button type="button" class="btn btn-primary btn-sm" onclick="changeNum(${carts.productId},${1})" id="add"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg></button></td>
						<td>${carts.product.productPrice*carts.quantity}</td>
						<td><button onclick="deleteItem(${carts.product.productId})" class="btn btn-dark btn-sm"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<table class="discount">
			<thead>
				<tr>
					<th scope="col">
						<div class="input-group mb-3">
							<button class="btn btn-outline-secondary" type="submit" id="button-addon1">使用</button>
							<input type="text" id="discount" class="form-control" value="" placeholder="請輸入折價券" aria-label="Example text with button addon" aria-describedby="button-addon1">
						</div>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">滿$1000，宅配到府，免運費！！<a href="#" class="tip">了解更多<span class="popbox">
								<table class="table" id="modal">
									<thead>
										<tr>
											<th scope="col">低消</th>
											<th scope="col">運費</th>
											<th scope="col">物流選項</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>$0</th>
											<td>$100</td>
											<td>宅配到府</td>
										</tr>
										<tr>
											<th>$1000</th>
											<td>$0</td>
											<td>宅配到府</td>
										</tr>
									</tbody>
								</table>
						</span>
					</a>
					</th>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th>免費領取NT$:200元折價券
						<button type="button" class="btn btn-outline-dark btn-sm" onclick="insertDis()">點我領取</button>
					</th>
				</tr>
			</tfoot>
		</table>

		<table class="goToPay">
			<thead>
				<tr>
					<th scope="col">購物車總計</th>
				</tr>
				<tr>
					<td colspan="2">折扣金幣：
						<button class="btn btn-outline-warning btn-sm" type="button" onclick="minusNum()" id="minus"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path fill-rule="evenodd" d="M2 7.75A.75.75 0 012.75 7h10a.75.75 0 010 1.5h-10A.75.75 0 012 7.75z"></path></svg></button> 
						<input class="numCoin" [type="number" ] readonly="readonly" id="goldCoin" value="0" min="0"><input type="hidden" id="hiddenCoin" value="${coin}">
						<button type="button" class="btn btn-outline-warning btn-sm" onclick="addNum()" id="add"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path fill-rule="evenodd" d="M7.75 2a.75.75 0 01.75.75V7h4.25a.75.75 0 110 1.5H8.5v4.25a.75.75 0 11-1.5 0V8.5H2.75a.75.75 0 010-1.5H7V2.75A.75.75 0 017.75 2z"></path></svg></button>
					</td>
				</tr>
			</thead>
			<tbody id="total">
				<tr>
					<td colspan="2" id="freight">運費：<c:if test="${priceTotal < 1000}"><span>100 元</span></c:if> 
						<c:if test="${priceTotal >= 1000}"><del style="color: red;">100 元</del>&nbsp;&nbsp;<span>0 元</span></c:if></td>
				</tr>
				<tr>
					<td>已折價：<input class="fw-bold totalPriceArea" id="discountPrice" type="text" readonly="readonly" value="0" />元					
				</tr>
				<tr>
					<td colspan="2"><input class="fw-bold totalPriceArea" id="pay" type="text" readonly="readonly" value="NT$: ${priceTotal} 元" />&nbsp;<a href="/cartToOrders"><button type="button" class="btn btn-warning">去買單</button></a></td>
				</tr>
			</tbody>
		</table>
	</c:if>

	<div class="container">
		<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1"><svg class="bi" width="30" height="24"></svg></a> <span class="text-muted">&copy;2021 FooDelicious, Inc</span>
			</div>
			<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
				<li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter" /></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram" /></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook" /></svg></a></li>
			</ul>
		</footer>
	</div>

	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="../../js/cart.js"></script>
	<script src="../../js/bootstrap.bundle.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</body>

</html>