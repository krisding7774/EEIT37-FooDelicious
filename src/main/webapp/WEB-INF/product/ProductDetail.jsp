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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
<!-- <div class="left"> -->
<!-- 	<div class="row" id="rowSelect"> -->
<!-- 		<div class="col-12 col-md-2"> -->
<!-- 			<div class="list-group"> -->
<!-- 				<a href="/LoginSystem" class="list-group-item list-group-item-action">會員登入</a> -->
<!--                     <a href="/Product" class="list-group-item list-group-item-action">前往商城</a> -->
<!--                     <a href="#" class="list-group-item list-group-item-action">前往分享區</a> -->
<!--                     <a href="/postArticle" class="list-group-item list-group-item-action">發表新文章</a> -->
<!--                     <a href="/custService" class="list-group-item list-group-item-action">客服中心</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<div class="left">
<div class="list-group" id="">
  <a href="/Product" class="list-group-item active d-flex justify-content-between align-items-center" id="allProduct">全部商品
   <span class="badge rounded-pill" style="background-color:#00cc44"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket" viewBox="0 0 16 16">
  <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9H2zM1 7v1h14V7H1zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5z"/>
</svg></span></a>
  <a href="/Product" class="list-group-item d-flex justify-content-between align-items-center" id="allKitchenware">廚具</a>
  <a href="/Product" class="list-group-item d-flex justify-content-between align-items-center" id="allFood">食材</a>
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
						<h2 class="product-conpany" style="color:#7B7B7B">${pro.productCompany}</h2>
						<h3 class="product-title">${pro.productName}</h3>
						<p class="product-description">${pro.productContent}</p>
						<hr>
						<div class="qty mt-2">
                        <span class="minus bg-dark">-</span>
                        <input type="number" class="count" id="pdQty" name="pdQty" value="1" min=1 max='${pro.productStock}'>
                        <span class="plus bg-dark">+</span>
                   		</div>
						<hr>						
						<h4 class="price">甜甜價 : <span>$${pro.productPrice}</span><span class="stock">剩餘 : ${pro.productStock}件</span></h4>

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
<script>
$(document).ready(function(){
    $('.count').prop('disabled', true);
		$(document).on('click','.plus',function(){
		$('.count').val(parseInt($('.count').val()) + 1 );
	});
	$(document).on('click','.minus',function(){
		$('.count').val(parseInt($('.count').val()) - 1 );
			if ($('.count').val() == 0) {
				$('.count').val(1);
			}
    	});
	});
</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

