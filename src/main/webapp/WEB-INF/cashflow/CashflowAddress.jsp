<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>





<body>
	<h1>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</h1>
	<c:forEach var="carts" items="${carts}">
		<h1>${carts.productId}</h1>

	</c:forEach>




	<div align="center">
		<h2>您的寄貨資訊</h2>
		<table class="table">
			<!-- <thead>
				<div class="input-group mb-3">
					<span class="input-group-text">會員編號：</span>
					
				<div class="input-group mb-3">
					<span class="input-group-text">會員帳號：</span>

				<div class="input-group mb-3">
					<span class="input-group-text">會員姓名：</span>

				<div class="input-group mb-3">
					<span class="input-group-text">會員地址：</span>

				<div class="input-group mb-3">
					<span class="input-group-text">出貨地址：</span>
				</thead> -->

			
			<tbody>
			<!-- <c:forEach var="data" items="${data}"> -->
				<tr>
					<td>AAAAAAAAAAAAAAAAAAAAAAAAAAA</td>
					<td>BBBBBBBBBBBBBBBBBBBBBBBbb</td>

				</tr>
			<!-- </c:forEach> -->
			</tbody>
			
		</table>

		<button type="submit" class="btn btn-outline-primary" id='sendData'>確認更改</button>

		<a href="<c:url value='/listAllMembers'/> ">回前頁</a>
	</div>

</body>

</html>
