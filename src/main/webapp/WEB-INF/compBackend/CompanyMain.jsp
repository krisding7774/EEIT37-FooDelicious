<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<head>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@1,100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />

</head>


<div class="top-container">
	<!-- 用來當margin的 -->
	<h2 class="app-page-title" style="display: hidden"></h2>

	<div class="app-card shadow p-3 mb-5 bg-body rounded">
		<div class="">
			<div class="app-card-body p-3 p-lg-4">
				<h3 class="mb-3">Welcome, ${userName} !</h3>
				<div class="row gx-5 gy-3">
					<div class="col-12 col-lg-9">

						<div>&emsp;&emsp;&emsp;我們提供來自於歐洲新鮮直運的產品，以及的限量平價廚具用品。</div>
					</div>
					<!--//col-->

				</div>
				<!--//row-->

			</div>
		</div>
	</div>
</div>
<!--//app-card-body-->




<div class="app-wrapper">

	<div class="app-content shadow p-3 mb-5 bg-body rounded" style="width:50%;background-color:#E9F5C2">
		<div class="container-xl">
			<h2 class="app-page-title" style="font-family: 'Source Sans Pro', sans-serif">設定</h2>
			<hr class="mb-4">
			<div class="row g-4 settings-section">
				<div class="col-12 col-md-4">
					<h3 class="section-title">General</h3>
					
				</div>
				<div class="col-12 col-md-8">
					<div class="app-card app-card-settings shadow p-3 mb-5 bg-body rounded">

						<div class="app-card-body">
							<form>
								<div class="mb-3">
									<label for="setting-input-1" class="form-label"><strong>公司名稱</strong></label> 
									<input type="text" class="form-control" id="companyName" value="${userName}">
								</div>
								<div class="mb-3">
									<label for="setting-input-3" class="form-label"><strong>地址</strong></label> 
									<input type="text" class="form-control" id="companyAddress" value="${memberAddress}">
								</div>
								<div class="mb-3">
									<label for="setting-input-2" class="form-label"><strong>電子信箱</strong></label> 
									<input type="text" class="form-control"
										id="companyEmail" value="${memberMail}" required>
								</div>
								<div class="mb-3">
									<label for="setting-input-3" class="form-label"><strong>電話</strong></label> 
									<input type="text" class="form-control" id="companyPhone" value="${memberPhone}">
								</div>
								<div class="mb-3">
									<label for="setting-input-3" class="form-label"><strong>密碼</strong></label> 
									<input type="password" class="form-control" id="companyPassword" value="${pwd}" readonly/>
									<input type="checkbox" onclick="showPassword()" style="cursor:pointer;margin-top:10px">顯示密碼
								</div>
								<div class="mb-3">
									<input type="hidden" class="form-control" id="companyId" value="${userID}">
								</div>
								<input id="companyDetailUpdate" class="btn btn-outline-primary" type="button" value="儲存" style="margin-left:85%;margin-top:5px" onclick="alert1()">
							</form>
						</div>
						<!--//app-card-body-->

					</div>
					<!--//app-card-->
				</div>
			</div>
			<!--//row-->
		</div>
	</div>

</div>


<script>
	// toggle password visibility
	function showPassword() {

  		var x = document.getElementById("companyPassword");
  		if (x.type === "password") {
   			 x.type = "text";
  		} else {
    		x.type = "password";
  }
}

</script>
<script>
	

	$("#companyDetailUpdate").on("click",function(){
		let companyId =  $("#companyId").val();
		 //alert(companyId);
		 
		 let updateCompanyDetail = {
					"memberId":$("#companyId").val(),
					"memberName" : $("#companyName").val(),
					"memberMail": $("#companyEmail").val(),
					"memberPhone" : $("#companyPhone").val(),
					"memberAddress" :$("#companyAddress").val(),
		 };

		let detailString = JSON.stringify(updateCompanyDetail);
		//alert(detailString);
		
		$.ajax({
		 url:"/companyDetailUpdate/"+companyId,
		 type:"PUT",
		 contentType:"application/json; charset=UTF-8",
		 data: detailString,
		 success: function(msg){
			alert(msg);
			$.ajax({
				url:"/companyDetailUpdate/"+companyId,
				type:"GET",
				success: function(companyDetails){
					//alert(companyDetails.memberName);
					$("#companyName").val(companyDetails.memberName);
					$("#companyEmail").val(companyDetails.memberMail);
					$("#companyPhone").val(companyDetails.memberPhone);
					$("#companyAddress").val(companyDetails.memberAddress);
					
					window.location.href="/companyMain";
				
				}
			});

			
		  }
		
		})
	 
		
})



</script>