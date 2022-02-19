<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>商品詳情</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="../../css/ProductDetail.css">
</head>

<body>
<div class="left">
	<div class="row" id="rowSelect">
		<div class="col-12 col-md-2">
			<div class="list-group">
				<a href="/LoginSystem" class="list-group-item list-group-item-action">會員登入</a>
                    <a href="/Product" class="list-group-item list-group-item-action">前往商城</a>
                    <a href="#" class="list-group-item list-group-item-action">前往分享區</a>
                    <a href="/postArticle" class="list-group-item list-group-item-action">發表新文章</a>
                    <a href="/custService" class="list-group-item list-group-item-action">客服中心</a>
			</div>
		</div>
	</div>
</div>
<div class="right">
	<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
				<c:forEach items="${prod}" var="pro">
					<div class="preview col-md-6">
						<div class="preview-pic tab-content">
							<div class="tab-pane active" id="pic-1">
								<img src="/img/${pro.productPics}" />
							</div>
						</div>
					</div>
					<div class="details col-md-6">
						<h2 class="product-conpany">${pro.productCompany}</h2>
						<h3 class="product-title">${pro.productName}</h3>
						<p class="product-description">${pro.productContent}</p>
						<hr>
						<input id="pdQty" type="number" value = 1 min=1 max='${pro.productStock}'>
						<hr>						
						<h4 class="price">
							商品甜甜價 : <span>$${pro.productPrice}</span>
							</h4>

						<div class="action">
							<button class="add-to-cart btn btn-default" type="button" onclick="addToCart(${pro.productId})">新增至購物車</button>
						</div>
					</div>
				  </c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

function addToCart(productId) {
	var quantity = $("#pdQty").val();
	var postData = { "pid": productId, "qty": quantity };
	$.ajax({
		url: "/shoppingCart/insert",
		type: "POST",
		data: JSON.stringify(postData),
		contentType: "application/json; charset=utf-8",
		success: function() {
			Swal.fire({
				  title: '確定新增至購物車?',
				  text: "你絕對不會後悔的!",
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '加入購物車!'
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire(
				      '新增成功!',
				      '已添加至購物車',
				      'success'
				    )
				  }
				})
		}
	})
}

</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

