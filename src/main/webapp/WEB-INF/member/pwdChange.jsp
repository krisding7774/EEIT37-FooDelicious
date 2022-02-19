<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密碼</title>
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<img src="https://scocre.com/assets/img/forgot.png"
					class="img-fluid" alt="">
			</div>
			<div class="col-md-6" style="padding-top: 100px">
				<h2 class="font-weight-light">修改密碼</h2>

				<form target="_blank" action="/pwdForgetSuccess.controller" method="POST" enctype="multipart/form-data" class="mt-3">
					<input class="form-control form-control-lg" name="emailAddress" value="${forgetmail}" readonly> 
					<label>請輸入新密碼</label> 
					<input class="form-control form-control-lg" type="password"	name="password">

					<div class="text-right my-3">
						<button type="submit" class="btn btn-lg btn-success">確認送出</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- <form action="/pwdForgetSuccess.controller" method="POST" enctype="multipart/form-data">
	<div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">修改密碼</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="pass" class="label" >Email </label>
					<input id="pass" type="text" class="input"  name="emailAddress" value="${forgetmail}" readonly unselectable="on">
					<label for="pass" class="label" >新密碼 </label>
					<input id="pass" type="text" class="input"  name="password" >
	</div>
	<div class="group">
		<input type="submit" class="button" value="送出">
	</div>
</div>
</form> -->

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</html>