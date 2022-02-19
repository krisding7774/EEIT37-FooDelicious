<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
    <link rel="stylesheet" href="../../../css/backendProductAdd.css">
</head>
<body>
	<div class="container mt-3" style="position:absolute;left:30%">
		<h2 class="tableName titleName2">新增商品<br>
    <span class="littleName">New Product</span></h2>
		<p>請在此新增您的商品</p> 
		<form action="/backend/product" enctype="multipart/form-data"
			method="post" class="needs-validation" novalidate>
			<div class="row mb-1">
			<label for="productCategories" class="col-sm-2 col-form-label">商品分類：</label>
			<div class="col-md-3">
			<select class="form-select form-select-sm" aria-label=".form-select-sm example"
				name="productCategories" id="productCategories" required>
				<option selected>選擇您的商品分類</option>
				<option value="0">廚具</option>
				<option value="1">食材</option>
			</select>
			</div>
			</div>
			<div class="row mb-2">
				<label for="productCategoriesName" class="col-sm-2 col-form-label">分類名稱 :</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productCategoriesName" id="productCategoriesName" placeholder="分類名稱" required/>
					 <div class="invalid-feedback">請輸入分類名稱</div>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productName" class="col-sm-2 col-form-label">商品名稱 :</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productName" id="productName" placeholder="商品名稱" required/>
				<div class="invalid-feedback">請輸入商品名稱(不得少於3個字)</div>
				<div class="valid-feedback ">感覺會熱賣唷</div>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productCompany" class="col-sm-2 col-form-label">商品公司：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productCompany" id="productCompany" placeholder="商品公司" required/>
				<div class="invalid-feedback">請輸入商品公司</div>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productCompanyId" class="col-sm-2 col-form-label">公司編號：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productCompanyId" id="productCompanyId" placeholder="公司編號" required/>
					<div class="invalid-feedback">請輸入公司編號(只能為數字)</div>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productPrice" class="col-sm-2 col-form-label">商品價格 :</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productPrice" id="productPrice" placeholder="商品價格" required/>
					<div class="invalid-feedback">請輸入商品價格</div>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productPics" class="col-sm-2 col-form-label">商品圖片：</label>
				<div class="col-sm-3">
					<input type="file" class="form-control" name="photo" id="photo" placeholder="產品圖片" required/>
					<div class="invalid-feedback">請新增商品圖片</div>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productContent" class="col-sm-2 col-form-label">商品內容：</label>
				<div class="col-sm-3">
					<textarea class="form-control" cols="10" rows="3" name="productContent" id="productContent" placeholder="商品內容" required></textarea>
					<div class="invalid-feedback">請輸入商品內容(不得少於5個字)</div>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productStock" class="col-sm-2 col-form-label">商品存量：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productStock" id="productStock" placeholder="商品存量" required/>
					<div class="invalid-feedback">請輸入商品存量</div>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productInsertDate" class="col-sm-2 col-form-label">新增日期：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productInsertDate" id="productInsertDate" placeholder="日期" required/>
					<div class="invalid-feedback">請輸入新增日期</div>
				</div>
			</div>
			<div class="row mb-1">
			<label for="productStatus" class="col-sm-2 col-form-label">商品狀態：</label>
			<div class="col-md-3">
			<select class="form-select form-select-sm"	aria-label=".form-select-sm example"
				name="productStatus" id="productStatus" required>
				<option selected>選擇商品上架狀態</option>
				<option value="0">下架</option>
				<option value="1">上架</option>
			</select>
			</div>
			</div>
			<div class="invalid-feedback">請選擇上架狀態</div>
			<div class="row mb-2">
				<label for="productKeywords" class="col-sm-2 col-form-label">關鍵字：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productKeywords" id="productKeywords" placeholder="商品關鍵字" required/>
					<div class="invalid-feedback">請輸入商品關鍵字</div>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productSalesFigures" class="col-sm-2 col-form-label"></label>
				<div class="col-sm-3">
					<input type="hidden" class="form-control" value="0" name="productSalesFigures"	placeholder="銷貨量" required/>
				</div>
			</div>
		

			&emsp;&emsp;
			<button type="reset" class="btn btn-outline-primary mt-3">重製</button>
			&emsp;&emsp;&emsp;
			<button type="submit" class="btn btn-outline-primary mt-3">提交</button>
			&emsp;&emsp;&emsp;
			<button class="btn btn-outline-danger mt-3" id="auto">一鍵輸入</button>
			</form>
	</div>


<script>
(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    var forms = document.getElementsByClassName("needs-validation");
	    var validation = Array.prototype.filter.call(forms, function(forms) {
	      forms.addEventListener('submit', function(event) {
	        if (forms.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        forms.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	})();

</script>
<script type="text/javascript">
	//自動填入資料
	$(document).ready(function() {
		$("#auto").click(function() {
			$("#productCategories").val('1');
			$("#productCategoriesName").val('蔬果');
			$("#productName").val('台灣新鮮高麗菜');
			$("#productCompany").val('好蔬果');
			$("#productCompanyId").val('22');
			$("#productPrice").val('45');
// 			$("#productPics").val('7.jpg');
			$("#productContent").val('平地高麗菜外觀則為較扁的平頭狀。 口感：滋味甜脆、中肋細小，清炒、生食、涼拌醃漬、製作菜卷等都很適合。');
			$("#productStock").val('200');
			$("#productInsertDate").val('2022-01-27 09:41:28.000');
			$("#productStatus").val('1');
			$("#productKeywords").val('菜');
		})
	});
</script>
</body>

</html>

