<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
.error {
	color: red;
	display: inline-block;
	font-size: 8pt;
}
</style>

<body>

	<div align='center'>
		<h3>會員註冊</h3>
		

		<c:set var='updateurl'
			value='${pageContext.request.contextPath}/members/${memberId}' />
		<form:form class="form" method="POST" modelAttribute="member">

			<form:input type="hidden" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" path="memberId" />

			<div class="input-group mb-3">
				<span class="input-group-text">會員帳號：</span>
				<form:input type="text" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id="memberMail"
					path="memberMail" />
				<form:errors path="memberMail" cssClass="error" />
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">會員密碼：</span>
				<form:input type="password" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id="pwd" path="pwd" />
				<form:errors path="pwd" cssClass="error" />
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">會員姓名：</span>
				<form:input type="text" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id="memberName"
					path="memberName" />
				<form:errors path="memberName" cssClass="error" />
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">會員性別：</span>
				<div class="radio" style="margin-left: 10px; margin-top: 5px">
					<div class="form-check form-check-inline"
						style="margin-left: 20px; align-items: center">
						<form:radiobutton class="form-check-input" path="memberGender"
							id="member_gender_m" value="MALE" />
						<label class="form-check-label" for="inlineRadio1">男</label>
					</div>
					<div class="form-check form-check-inline">
						<form:radiobutton class="form-check-input" path="memberGender"
							id="member_gender_f" value="FEMALE" />
						<label class="form-check-label" for="inlineRadio2">女</label>
					</div>
				</div>
				<form:errors path="memberGender" cssClass="error" />
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">出生日期：</span>
				<form:input type="date" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id="memberBirth"
					path="memberBirth" />
				<form:errors path="memberBirth" cssClass="error" />
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">會員電話：</span>
				<form:input type="tel" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id="memberPhone"
					path="memberPhone" />
				<form:errors path="memberPhone" cssClass="error" />
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">會員地址：</span>
				<form:input type="text" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id="memberAddress"
					path="memberAddress" />
				<form:errors path="memberAddress" cssClass="error" />
			</div>

			<form:input type="hidden" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" path="memberDiscountId" />

			<form:input type="hidden" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" path="memberCoin" />

			<button type="submit" class="btn btn-outline-primary"
				value="register" id="" onclick="success()">註冊</button><br>
				<button type="button" class="btn btn-outline-danger" id="C1">一鍵送出</button>
				
		</form:form>
	</div>
	
</body>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/jquery-ui.js"></script>
<script type="text/javascript">
	//自動填入資料
	$(document).ready(function() {
		$("#C1").on("click",function() {
			$("#memberMail").val('yolandabestone@gmail.com');
			$("#pwd").val('$happy13711');
			$("#memberName").val('石悠悠');
			$("#member_gender_f").prop("checked",true);
			$("#memberBirth").val('1990-11-29');
			$("#memberPhone").val('0912520520');
			$("#memberAddress").val('台北市大安區信義路100號');
		})
	});

</script>
