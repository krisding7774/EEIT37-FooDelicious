<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<body>
	<div class="container mt-3">
		<h2>新增商品</h2>
		<p>請在此新增您的商品</p> 
		商品分類：
		<form action="/backend/product" enctype="multipart/form-data"
			method="post">
			<select class="form-select form-select-sm"
				aria-label=".form-select-sm example"
				name="productCategories">
				<option selected>選擇您的商品分類</option>
				<option value="0">廚具</option>
				<option value="1">食材</option>
			</select><br>
			<div class="row mb-2">
				<label for="productCategoriesName" class="col-sm-2 col-form-label">分類名稱 :</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productCategoriesName" placeholder="分類名稱"/>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productName" class="col-sm-2 col-form-label">商品名稱 :</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productName" placeholder="商品名稱"/>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productCompany" class="col-sm-2 col-form-label">商品公司：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productCompany" placeholder="商品公司"/>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productCompanyId" class="col-sm-2 col-form-label">公司編號：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productCompanyId" placeholder="公司編號"/>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productPrice" class="col-sm-2 col-form-label">商品價格 :</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productPrice" placeholder="商品價格"/>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productPics" class="col-sm-2 col-form-label">商品圖片：</label>
				<div class="col-sm-3">
					<input type="file" class="form-control" name="photo" placeholder="產品圖片" />
				</div>
			</div>
			<div class="row mb-2">
				<label for="productContent" class="col-sm-2 col-form-label">商品內容：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productContent" placeholder="商品內容"/>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productStock" class="col-sm-2 col-form-label">商品存量：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productStock" placeholder="商品存量"/>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productInsertDate" class="col-sm-2 col-form-label">商品存量：</label>
				<div class="col-sm-3">
					<input type="datetime-local" class="form-control" name="productInsertDate" placeholder="日期"/>
				</div>
			</div>

			商品狀態：<select class="form-select form-select-sm"
				aria-label=".form-select-sm example"
				name="productStatus">
				<option selected>選擇商品上架狀態</option>
				<option value="0">下架</option>
				<option value="1">上架</option>
			</select><br>
			<div class="row mb-2">
				<label for="productKeywords" class="col-sm-2 col-form-label">關鍵字：</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="productKeywords"
						placeholder="商品關鍵字"/>
				</div>
			</div>
			<div class="row mb-2">
				<label for="productSalesFigures" class="col-sm-2 col-form-label"></label>
				<div class="col-sm-3">
					<input type="hidden" class="form-control" value="0" name="productSalesFigures"
						placeholder="銷貨量"/>
				</div>
			</div>
		

			&emsp;&emsp;
			<button type="reset" class="btn btn-outline-primary mt-3">重製</button>
			&emsp;&emsp;&emsp;
			<button type="submit" class="btn btn-outline-primary mt-3">提交</button>
			</form>
	</div>



</body>
</html>

