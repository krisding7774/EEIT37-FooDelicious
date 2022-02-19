<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<style>

 </style>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘記密碼</title>
</head>
<body>

	<div class="container">
    	<div class="row">
    		<div class="col-md-3">
    		    <img src="https://scocre.com/assets/img/forgot.png" class="img-fluid" alt="">
    		</div>
    		<div class="col-md-9" style="padding-top:100px">
    		    <h2 class="font-weight-light">忘記密碼?</h2>
    		    別擔心，請輸入註冊時的email帳號，<br>
				我們將發送驗證信至您的信箱
    		    <form target="_blank" action="/pwdForgetAction.controller" method="POST" class="mt-3">
    		        <input class="form-control form-control-lg" type="email" placeholder="Your email address" name="memberMail" value="">
    		        
    		        <span id="loginSpan">${errors.msg}</span>
    		        <div class="text-right my-3">
    		            <button type="submit" id="button" class="btn btn-lg btn-success">送出</button>
						
    		        </div>
    		    </form>
    		</div>
    	</div>
    </div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#button").click(function() {
			var yes = confirm('請確定輸入的mail是否正確？');
			if (yes) {
				alert('寄信成功，請於20分鐘內至信箱收信並點選驗證連結');
			} else {
// 				this.form.action = "";
				alert('取消寄信');
				return false;
			}
		})
	});
</script>
</html>