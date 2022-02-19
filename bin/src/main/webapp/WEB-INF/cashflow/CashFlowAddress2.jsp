<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>
<script src="../../js/cashflow.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
</head>


<body>

	<div align="center">
		<h2 >您的寄貨資訊</h2>
		<table>
		
			<thead>
				<div class="input-group mb-3">
					<span class="input-group-text" id="">會員編號：</span> <input
						type="text" class="form-control" id="memberId">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">會員帳號：</span> <input type="text"
						class="form-control" id="memberMail">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">會員姓名：</span> <input type="text"
						class="form-control" id="memberName">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">會員地址：</span> <input type="text"
						class="form-control" id="memberAddress">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">出貨地址：</span> <input type="text"
						class="form-control" id="commonAddress">
				</div>
		</table>

		<button type="submit" class="btn btn-outline-primary" id='sendData' >確認更改</button>

		<a href="<c:url value='/memberIndex'/> ">回前頁</a>
	</div>
	

</body>

</html>

<script>
window.onload = function() {
	$.ajax({
		url: "/CashflowAddress",
		type: "GET",
		contentType: "application/json; charset=utf-8",
		success: function(address) {
			let str = "";
			$("#memberId").val(address.memberId);
			$("#memberMail").val(address.memberMail);
			$("#memberName").val(address.userName);
			$("#memberAddress").val(address.memberAddress);
			for (let i = 0; i < address.title.length; i++) {
// 				$("#memberId").val(address.title[i].memberId);
				$("#commonAddress").val(address.title[i].commonAddress);
			}
		}
	})
}
</script>