<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<body>

	<h1 class="tableName" style="margin: 8px">
		商品列表<span class="smallFont">Product List</span>
	</h1>

	<table class="table table-hover" style='text-align: center'>
		<thead class="table table-striped table-dark">
			<tr>
					<th class="col">商品編號</th>
                    <th class="col">商品類別</th>
                    <th class="col">商品公司</th>
                    <th class="col">上架狀態</th>
                    <th class="col">商品名稱</th>
                    <th class="col">商品概述</th>
                    <th class="col">商品價格</th>
                    <th class="col">商品庫存</th>
                    <th class="col">銷售量</th>
                    <th class="col">關鍵字</th>
                    <th class="col">新增日期</th>
                    <th class="col">更新</th>
                    <th class="col">取消</th>
			</tr>
		</thead>
		 <tbody>
                    <form>
                        <tr>
                            <td class='align-middle'>
                                <input class="upInput readonly text-middle upInputSm" type="text" value="" readonly id="comProductId" style="width:80px;text-align:center" >
                            </td>
                             <td class='align-middle'>
                                <select id="categories" class="form-select upInput text-middle upInputMd">
                                    <option value="" id="cate" selected></option>
                                    <option value="1">食材</option>
                                    <option value="0">廚具</option>
                                </select>
                            </td>
                            <td class='align-middle'>
                                <input class="upInput upInputMd" type="text" value="" id="comProductCompany" style="width:100px;text-align:center">
                            </td>
                           <td class='align-middle'>
                                <select id="productStatus" class="form-select upInput text-middle upInputMd">
                                    <option value="" id="status" selected hidden></option>
                                    <option value="1">上架中</option>
                                    <option value="0">下架中</option>
                                    
                                </select>
                            </td>
                            <td class='align-middle'>
                                <input class="upInputBig" type="text" value="" id="comProductName" style="width:170px;text-align:center">
                            </td>
                            <td class='align-middle'>
                                <input class="upInputBig" type="text" value="" id="comProductContent" style="width:170px;text-align:center">
                            </td>
                            <td class='align-middle'>
                                <input class="upInputSm" type="text" value="" id="comProductPrice" style="width:75px;text-align:center">
                            </td>
                            <td class='align-middle'>
                                <input class="upInputSm" type="text" value="" id="comProductStock" style="width:75px;text-align:center">
                            </td>
                            <td class='align-middle'>
                                <input class="upInputSm" type="text" value="" id="comProductSalesFigures" style="width:75px;text-align:center" readonly>
                            </td>
                            <td class='align-middle'>
                                <input class="upInputSm" type="text" value="" id="comProductKeywords" style="width:170px;text-align:center">
                            </td>
                            <td class='align-middle'>
                                <input class="upInput upInputBig readonly" type="text" value="" readonly id="comRegisterDate">
                            </td>
                            <td class="align-middle">
                                    <input id="comUpdateBtn" class="btn btn-outline-primary" type="button" value="更新">
                            </td>
                            <td class="">
                                <input id="comDelBtn" class="btn btn-outline-danger" type="button" value="取消" onclick="comCancel()">
                            </td></tr>
                    </form>
                </tbody>

	</table>



	<script>
		//=============刪除確認=============

		$("#comProducts").on("click", "#delBtnCom", function() {
			let deleteProductId = $(this).attr("data-id")

			if (confirm("確定要刪除嗎")) {
				$.ajax({
					url : "/companyProducts/delete/" + deleteProductId,
					type : "DELETE",
					success : function() {
						alert("刪除成功");
						window.location.href = "/companyProduct";
					}
				});
			}
		});
	</script>



<script>
    //=============抓取另一頁傳來的資料=============
    let comProductString = localStorage.getItem("comProductData")
    //將字串json化
    let comProductData = JSON.parse(comProductString);
    //填入資料
    $("#comProductId").val(comProductData.productId);
    //轉換數字成中文
    let cate = comProductData.categories;
    let type = ""
    if( cate == 0){type = "廚具";
    }else{ type = "食材";}
    $("#cate").val(cate);
    $("#cate").text(type);
    
    let st = comProductData.productStatus;
    let status = ""
    if( st == 1){
        status = "上架中";
    }else{
        status = "下架中";
    }
    $("#status").val(st);
    $("#status").text(status);
    
    $("#comProductCompany").val(comProductData.productCompany);
    
    $("#comProductName").val(comProductData.productName);
    $("#comProductContent").val(comProductData.productContent);
    $("#comProductPrice").val(comProductData.productPrice);
    $("#comProductStock").val(comProductData.productStock);
    $("#comProductSalesFigures").val(comProductData.productSalesFigures);
    $("#comProductKeywords").val(comProductData.productKeywords);
    let newDate = new Date(comProductData.productInsertDate);
    let register = newDate.toLocaleString();
    $("#comRegisterDate").val(register);
</script>

<script>
    //=============更新資料=============
    $("#comUpdateBtn").on("click",function(){
        let comProductId = $("#comProductId").val();
        //alert($("#productStatus").val());
     
        let updatedProduct = {
            "productCategories": $("#categories").val(),
            "productCompany": $("#comProductCompany").val(),
            "productName": $("#comProductName").val(),
            "productContent": $("#comProductContent").val(),
            "productPrice": $("#comProductPrice").val(),
            "productStatus" : $("#productStatus").val(),
            "productStock": $("#comProductStock").val(),
            "productSalesFigures": $("#comProductSalesFigures").val(),
            "productKeywords": $("#comProductKeywords").val()
            
        };
        
        //When sending data to a web server, the data has to be a string.
        let newProductString = JSON.stringify(updatedProduct);

        $.ajax({
            url:"/companyProducts/update/"+comProductId,
            type:"PUT",
            contentType:'application/json; charset=UTF-8',
            data: newProductString,
            success:function(msg){
                alert(msg)
                window.location.href="/companyProduct";
            }
        })
    })
</script>

<script>
    //=============跳回首頁=============
    function comCancel(){
        window.location.href="/companyProduct";
    }
</script>



</body>
