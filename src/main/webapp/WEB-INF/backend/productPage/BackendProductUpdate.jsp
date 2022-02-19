<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <link rel="stylesheet" href="../../../css/BackendProductUpdate.css">
</head>
<body>
<div>
    <h1 class="tableName titleName2">
        商品列表
        <br>
        <span class="littleName">Product List</span>
    </h1>

    <section class="content">
        <div class="col-xs-12">
            <table id="" class='table table-striped table-hover'>
                <thead>
                <tr>
                    <th class="col table-success">編號</th>
                    <th class="col table-success">類別</th>
                    <th class="col table-success">公司</th>
                    <th class="col table-success">上架狀態</th>
                    <th class="col table-success">商品名稱</th>
                    <th class="col table-success">商品概述</th>
                    <th class="col table-success">價格</th>
                    <th class="col table-success">庫存</th>
                    <th class="col table-success">銷售量</th>
                    <th class="col table-success">關鍵字</th>
                    <th class="col table-success">新增日期</th>
                    <th class="col table-success">更新</th>
                    <th class="col table-success">取消</th>
                </tr>
                </thead>
                <tbody>
                    <form>
                        <tr>
                            <td class='align-middle'>
                                <input class="upInput readonly text-middle upInputSm" type="text" value="" readonly id="productId">
                            </td>
                            <td class='align-middle'>
                                <select id="categories" class="form-select upInput text-middle upInputMd">
                                    <option value="" id="cate" selected></option>
                                    <option value="1">食材</option>
                                    <option value="0">廚具</option>
                                </select>
                            </td>
                            <td class='align-middle'>
                                <input class="upInput upInputMd" type="text" value="" id="productCompany">
                            </td>
                            <td class='align-middle'>
                                <select id="productStatus" class="form-select upInput text-middle upInputMd">
                                    <option value="" id="status" selected></option>
                                    <option value="0">下架中</option>
                                    <option value="1">上架中</option>
                                </select>
                            </td>
                            <td class='align-middle'>
                                <input class="upInputBig" type="text" value="" id="productName">
                            </td>
                            <td class='align-middle'>
                                <input class="upInputBig" type="text" value="" id="productContent">
                            </td>
                            <td class='align-middle'>
                                <input class="upInputSm" type="text" value="" id="productPrice">
                            </td>
                            <td class='align-middle'>
                                <input class="upInputSm" type="text" value="" id="productStock">
                            </td>
                            <td class='align-middle'>
                                <input class="upInputSm" type="text" value="" id="productSalesFigures">
                            </td>
                            <td class='align-middle'>
                                <input class="upInputSm" type="text" value="" id="productKeywords">
                            </td>
                            <td class='align-middle'>
                                <input class="upInput upInputBig readonly" type="text" value="" readonly id="registerDate">
                            </td>
                            <td class="align-middle">
                                    <input id="updateBtn" class="btn btn-outline-primary" type="button" value="更新">
                            </td>
                            <td class="">
                                <input id="delBtn" class="btn btn-outline-danger" type="button" value="取消" onclick="cancel()">
                            </td></tr>
                    </form>
                </tbody>
            </table>
        </div>
    </section>
</div>
<script>
    //=============抓取另一頁傳來的資料=============
    let productString = localStorage.getItem("productData")
    //將字串json化
    let productData = JSON.parse(productString);
    //填入資料
    $("#productId").val(productData.productId);
    //轉換數字成中文
    let cate = productData.categories;
    let type = ""
    if( cate == 0){type = "廚具";
    }else{ type = "食材";}
    $("#cate").val(cate);
    $("#cate").text(type);

    $("#productCompany").val(productData.productCompany);
    let st = productData.product_status;
    let status = ""
    if( st == 1){
        status = "上架中";
    }else{
        status = "下架中";
    }
    $("#status").val(st);
    $("#status").text(status);
    $("#productName").val(productData.productName);
    $("#productContent").val(productData.productContent);
    $("#productPrice").val(productData.productPrice);
    $("#productStock").val(productData.productStock);
    $("#productSalesFigures").val(productData.productSalesFigures);
    $("#productKeywords").val(productData.productKeywords);
    let newDate = new Date(productData.productInsertDate);
    let register = newDate.toLocaleString();
    $("#registerDate").val(register);
</script>
<script>
    //=============跳回首頁=============
    function cancel(){
        window.location.href="/backend/product";
    }
</script>
<script>
    //=============更新資料=============
    $("#updateBtn").on("click",function(){
        let productId = $("#productId").val();
        let productObj = {
            "categories": $("#categories").val(),
            "productCompany": $("#productCompany").val(),
            "product_status": $("#productStatus").val(),
            "productName": $("#productName").val(),
            "productContent": $("#productContent").val(),
            "productPrice": $("#productPrice").val(),
            "productStock": $("#productStock").val(),
            "productSalesFigures": $("#productSalesFigures").val(),
            "productKeywords": $("#productKeywords").val()
        };
        let productString = JSON.stringify(productObj);

        $.ajax({
            url:"http://localhost:8080/bkproducts/update/"+productId,
            type:"PUT",
            contentType:'application/json; charset=UTF-8',
            data: productString,
            success:function(msg){
                alert(msg)
                window.location.href="/backend/product";
            }
        })
    })
</script>
</body>

