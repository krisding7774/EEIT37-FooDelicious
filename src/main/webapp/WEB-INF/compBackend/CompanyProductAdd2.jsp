<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>




<body>
	<h1 class="tableNameProduct titleName2">
		新增商品 <span class="smallFontProduct">Add Product</span>
	</h1>
	<div class="main">
		<form action="/companyProductsAdd" enctype="multipart/form-data"
			method="post" class="border col-md-12 rounded addProduct needs-validation" novalidate>

			<div class="input-group textSet">
				<label for="productCategories" class="col-md-2 col-form-label">商品分類
					:</label>
				<div class="col-md-3">
					<select class="form-select form-select-sm"
						aria-label=".form-select-sm example" name="productCategories" id="productCategories"
						style="width: 60%">
						<option selected>分類</option>
						<option value="0">廚具</option>
						<option value="1">食材</option>
					</select><br>
				</div>
				<label for="productStatus" class="col-md-2 col-form-label">商品狀態:</label>
				<div class="col-md-3">
					<select class="form-select form-select-sm"
						aria-label=".form-select-sm example" name="productStatus" id="productStatus"
						style="width: 80%">
						<option selected>選擇商品上架狀態</option>
						<option value="0">下架</option>
						<option value="1">上架</option>
					</select><br>
				</div>
			</div>
			<hr />
			<div class="input-group textSet">
				<label for="productCategoriesName" class="col-md-2 col-form-label">分類名稱
					:</label>
				<div class="col-md-3">
					<input type="text" class="form-control"
						name="productCategoriesName" id="productCategoriesName" value="" required>
					 <div class="invalid-feedback">請輸入分類名稱</div>
				</div>
				<label for="productName" class="col-md-2 col-form-label">商品名稱
					:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="productName" id="productName" value="" required>
					<div class="invalid-feedback">請輸入商品名稱(不得少於3個字)</div>
				</div>
			</div>
			<div class="input-group textSet ">
				<label for="productCompany" class="col-md-2 col-form-label">商品公司：</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="productCompany" id="productCompany"
						value="" required>
					<div class="invalid-feedback">請輸入商品公司</div>
				</div>
				<label for="productPrice" class="col-md-2 col-form-label">商品價格
					:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="productPrice" id="productPrice"
						value="" required>
					<div class="invalid-feedback">請輸入商品價格</div>	
				</div>
			</div>

			<div class="input-group textSet">
				<label for="productStock" class="col-md-2 col-form-label">商品庫存
					:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="productStock" id="productStock"
						value="" required>
					<div class="invalid-feedback">請輸入商品庫存</div>
				</div>
				<label for="productKeywords" class="col-md-2 col-form-label">關鍵字：</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="productKeywords" id="productKeywords"
						value="">
				</div>
			</div>

			<div class="input-group textSet ">
				<div class="col-md-2 ">
					<label for="productPics" class="col-md-12 col-form-label">商品圖片：</label>
				</div>
				<div class="col-md-8">
					<input type="file" class="form-control" name="photo"
						placeholder="產品圖片" required/>
					<div class="invalid-feedback">請新增商品圖片</div>
				</div>
			</div>



			<div class="input-group textSet">
				<div class="col-md-2 ">
					<label for="productContent" class="col-md-12 col-form-label" required>商品內容
						:</label>
				</div>

				<div class="col-md-8">
					<input type="text" class="form-control" name="productContent" id="productContent" required>
					<div class="invalid-feedback">請輸入商品內容(不得少於5個字)</div>
				</div>
			</div>

			<div class="row mb-2">
				<div class="col-sm-3">
					<input type="hidden" class="form-control" name="productCompanyId"
						placeholder="公司編號" value="${userID}" />
				</div>
			</div>

			<div class="row mb-2">
				<label for="productSalesFigures" class="col-sm-2 col-form-label"></label>
				<div class="col-sm-3">
					<input type="hidden" class="form-control" value="0"
						name="productSalesFigures" placeholder="銷貨量"/>
				</div>
			</div>

			<div class="input-group textSet buttonArea" style="margin: 5px">
				<div class="col-md-6">
					<button type="reset" class="btn btn-outline-danger mt-3"
						id="resetProduct">重製</button>
				</div>
				<div class="col-md-6">
					<button type="submit" class="btn btn-outline-primary mt-3"
						id="submitAddProduct">提交</button>
				</div>
			</div>
		</form>
		
			<button type="button" value="一鍵輸入" style="margin-top:10px" onclick="autofill2()">一鍵輸入</button>
	</div>

	<script>
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						var forms = document
								.getElementsByClassName("needs-validation");
						var validation = Array.prototype.filter.call(forms,
								function(forms) {
									forms.addEventListener('submit', function(
											event) {
										if (forms.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										forms.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();
		
		function autofill2(){
			$('#productContent').val("可愛的米奇鬆餅機");
			$('#productKeywords').val("鬆餅機 可愛 好用快速");
			$('#productStock').val("20")
			$('#productPrice').val("799")
			$('#productCompany').val("Disney")
			$('#productName').val("米奇鬆餅機")
			$('#productCategoriesName').val("廚具")
			$('#productStatus').val("1")
			$('#productCategories').val("0")
			
			

			
		}
	</script>
</body>