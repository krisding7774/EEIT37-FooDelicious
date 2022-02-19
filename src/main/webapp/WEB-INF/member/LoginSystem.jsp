<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="google-signin-client_id"
	content="676062096-mh4b0oa5ekomddrromhcdjkgl1it3mkv.apps.googleusercontent.com">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<body>
	<div align="center">
		<font color='red'>&nbsp;${insertSuccess}</font>
	</div>

	<section class="vh-100" style="background-color: #508bfc;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card shadow-2-strong" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<h3 class="mb-5">會員登入</h3>
							<span id="loginSpan">${errors.msg}</span>
							<form action="checklogin.controller" method="post">
								<div class="form-outline mb-4">
									<input type="text" class="form-control form-control-lg" name="memberMail" id="memberMail"
										placeholder="請輸入mail" /> 
										<label class="form-label" for="memberMail"></label>
										<span id="loginSpan">${errors.memberMail}</span>
								</div>

								<div class="form-outline mb-4">
									<input type="password" 	class="form-control form-control-lg" name="pwd" id="pwd" placeholder="請輸入密碼" /> 
										<label class="form-label" for="typePasswordX-2"></label>
										<span id="loginSpan">${errors.pwd}</span>
								</div>
								
								<div align="center" class="g-signin2 social_signin" onclick="ClickLogin()"
								data-onsuccess="onSignIn"></div>

								<!-- Checkbox -->
								<a href="RegisterPage" class="link-info">立即註冊</a>
								<a href="pwdForgetPage" class="link-info">忘記密碼</a><br>
								
								<button class="btn btn-primary btn-lg btn-block" type="submit">送出</button><br>

								<hr class="my-4">
								
							<button class="btn btn-info" id="Ricky" >P.H. Wang</button>
							<button class="btn btn-secondary" id="oldLee" >老李</button>
							<button class="btn btn-warning" id="chris">胖胖</button>
							<button class="btn btn-success" id="kevin" >彌豆子</button>
							<button class="btn btn-danger" id="drew" >歐洲食品</button>

							</form>
							
							<form method="post" action="${contextRoot}/googleLogin">
								<input type="hidden" id="memberName" name="memberName">
								<input type="hidden" id="memberMailGoogle" name="memberMail">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/jquery-ui.js"></script>
<script>
	var clicked = false;
	function ClickLogin() {
		clicked = true;
	}

	function onSignIn(googleUser) {
		if (clicked) {
			let profile = googleUser.getBasicProfile();
			document.getElementById("memberName").value = profile.getName();
			document.getElementById("memberMailGoogle").value = profile.getEmail();
			document.forms[1].submit();
		}
	}
	
	$("#Ricky").on("click",function() {
		$("#memberMail").val('krisding7774@gmail.com');
		$("#pwd").val('$Q123456');
	});
	
	$("#oldLee").on("click",function() {
		$("#memberMail").val('xc1zt1x2005@gmail.com');
		$("#pwd").val('@lee0704');
	});
	
	$("#chris").on("click",function() {
		$("#memberMail").val('panpan@gmail.com');
		$("#pwd").val('333333');
	});
	
	$("#kevin").on("click",function() {
		$("#memberMail").val('kevin.wang629@gmail.com');
		$("#pwd").val('123456');
	});
	
	$("#drew").on("click",function() {
		$("#memberMail").val('jinglu.sw@gmail.com');
		$("#pwd").val('111111');
	});
	
</script>
