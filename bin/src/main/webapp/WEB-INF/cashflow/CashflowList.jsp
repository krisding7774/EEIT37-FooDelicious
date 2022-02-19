<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%request.setCharacterEncoding("UTF-8");%>


<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>
<script src="../../js/cashflow.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>

<title>訂單資訊</title>

<body >
	<div align="center" >
		<h2>訂單資訊</h2>
		<h2>付款完成!!</h2>
		<table class="table" style="background-color: white">
			<thead>
			<tbody id="cartList">
				<c:forEach var="carts" items="${carts}" begin="0" end="0">
					<span style="margin: 250px">
						<th>
							會員編號 :
					<td>${carts.member.memberId}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
				</c:forEach>
				<c:forEach var="carts" items="${carts}" begin="0" end="0">
					<th>訂單編號 : <td>${orderId}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<th>總金額 : <td>${priceTotal}
				
				</c:forEach>
			</tbody>		
		</table>
		<table class="table table-striped" align="center">
			<thead>
				<tr style="background-color: white"align="center">			
					<th>商品名稱					
									
					<th>商品數量					
					
					<th>商品價格					
					
					<th>購買總價				
				
				</tr>
			</thead>
			<tbody id="cartList">
			<c:forEach var="carts" items="${carts}">
				<tr style="background-color: white" align="center">
					<td>${carts.product.productName}</td>
					
					<td>${carts.quantity}</td>
					<td>${carts.product.productPrice}</td>
					<td>${carts.product.productPrice*carts.quantity}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

			<table>
				<thead>
				
				
				<tbody id="cartList">
					<c:forEach var="carts" items="${carts}" begin="0" end="0">
						<tr >
							<th>姓名&nbsp;<input id="ReceiverName" name="ReceiverName"
								type="text" size="4" maxlength="120"
								value="${carts.member.memberName}">
							
							
							<th>&nbsp;&nbsp;手機&nbsp;<input id="ReceiverMobile"
								name="ReceiverMobile" type="text" size="9" maxlength="12"
								value="${carts.member.memberPhone}">
							
							
							<th>&nbsp;&nbsp;信箱&nbsp;<input id="ReceiverTel"
								name="ReceiverMail" type="text" size="30" maxlength="30"
								value="${carts.member.memberMail}">
						
						
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table>
				<thead>
				
				
				<tbody id="cartList">
					<c:forEach var="carts" items="${carts}" begin="0" end="0">
						<tr>
							<th>寄送地址&nbsp; <input id="commonaddress" name="ReceiverAddr"
								type="text" size="30" maxlength="150"
								value="${carts.member.memberAddress}">						
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<input type="button" onclick="listComfirm()" value="確定" ></input>
			</div>
	<div class="container">
		<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1"><svg class="bi" width="30" height="24"></svg></a> <span class="text-muted">&copy;2021 Company, Inc</span>
			</div>
			
		</footer>
	</div>

</body>



