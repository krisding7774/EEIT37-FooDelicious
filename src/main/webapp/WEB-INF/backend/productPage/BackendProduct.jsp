<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <link rel="stylesheet" href="../../../css/backendProduct.css">
</head>
<body>
<h1 class="tableName titleName2">
    商品列表
    <br>
    <span class="littleName">Product List</span>
</h1>
<div class="searchArea">
    <select id="selectVal" class="form-select selectBox" aria-label="Default select example">
        <option selected>全部商品</option>
        <option value="食材">食材</option>
        <option value="廚具">廚具</option>
    </select>
    <input class="keyWord keyWord1 searchBox" type="text" name="accKeyWord" placeholder="請輸入名稱關鍵字...">
    <input id="searchAcc" class="keyWord btn btn-outline-secondary searchBox2 " type="button" value="查詢" />
</div>

<ul id="selectPage" class="nav nav-tabs">
    <li class="nav-item">
        <a id="all" class="nav-link active" aria-current="page" href="#">全部商品</a>
    </li>
    <li class="nav-item">
        <a id="food" class="nav-link" href="#">食材</a>
    </li>
    <li class="nav-item">
        <a id="tool" class="nav-link" href="#">廚具</a>
    </li>
</ul>
<section class="content">
    <div class="col-xs-12">
        <table id="" class='table table-striped table-hover '>
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
                    <th class="col table-success">查詢關鍵字</th>
                    <th class="col table-success">新增日期</th>
                    <th class="col table-success">更新</th>
                    <th class="col table-success">刪除</th>
                </tr>
            </thead>
            <tbody id="products"></tbody>
        </table>
        <nav aria-label="Page navigation example ">
            <ul id="page" class="pagination justify-content-center"></ul>
        </nav>
    </div>
</section>
<script>
    //=============刪除確認=============

    $("#products").on("click","#delBtn",function() {
        let deleteId = $(this).data("id");
        if (confirm("確定要刪除嗎")) {
            $.ajax({
                url: "/bkproducts/delete/"+deleteId,
                type: "DELETE",
                success: function(msg){
                    alert(msg);
                    window.location.href="/backend/product";
                }
            });
        }
    })
</script>
<script>
    //=============名稱關鍵字查詢功能=============
    $("#searchAcc").on("click",function(){
       let inputData = $(".keyWord1").val();
       let selectVal = $("#selectVal").val();
       let urlData = "";
       // alert("inputData："+inputData+", selectVal"+selectVal);
       if(selectVal === "全部商品"){
           urlData = "http://localhost:8080/bkproducts/"+inputData;
       }else if(selectVal === "廚具"){
           selectVal = 0;
           urlData = "http://localhost:8080/bkproducts/"+inputData+"/"+selectVal;
       }else{
           selectVal = 1;
           urlData = "http://localhost:8080/bkproducts/"+inputData+"/"+selectVal;
       }
       $.ajax({
           url: urlData,
           type: "GET",
           success:function(products){
               let num = products.length;
               //載入顯示功能
               showData(0, num, products);

               //載入分頁功能
               if(num>=10){
                   pages(10, products);
               }else{
                   pages(num, products);
               }
           }
       })

    });
</script>

<script>
    //=============更新商品資料功能=============

    //更新前先查詢出資料
    $("#products").on("click","#updateBtn",function(){
        let data = $(this).data("id");
        // alert("data："+data)
        $.ajax({
            url:"/bkproducts/find/"+data,
            type: "GET",
            success:function(product){
                //將json字串化
                let productString = JSON.stringify(product);
                //將資料存到localStorage，給另一個頁面使用
                localStorage.setItem("productData",productString);
                //跳轉頁面
                window.location.href="/backend/product/update";
            }
        })

    });
</script>

<script>
    //=============顯示所有商品資料=============
    window.onload=function(){
        const productUrl = "http://localhost:8080/bkproducts"

        $.ajax({
            url: productUrl,
            type: "GET",
            success: function(productData){
                $("#products").html("");
                $("#page").html("");
                let num = productData.length;
                if(num >= 10){
                    pages(10,productData);
                }else{
                    pages(num,productData);
                }
            }
        });
    }

</script>

<script>
    //=============顯示分頁設定=============
    let urlString = "";
    $("#all").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#all").prop("class","nav-link active");
        urlString = "http://localhost:8080/bkproducts";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(productAll){
                $("#products").html("");
                $("#page").html("");
                let num = productAll.length;
                if(num >= 10){
                    pages(10,productAll);
                }else{
                    pages(num,productAll);
                }
            }
        });
    })
    $("#food").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#food").prop("class","nav-link active");
        urlString = "http://localhost:8080/bkproducts/search/1";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(productFood){
                $("#products").html("");
                $("#page").html(" ");
                let num = productFood.length;
                if(num >= 10){
                    pages(10,productFood);
                }else{
                    pages(num,productFood);
                }
            }
        });
    })
    $("#tool").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#tool").prop("class","nav-link active");
        urlString = "http://localhost:8080/bkproducts/search/0";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(productTool){
                $("#products").html("");
                $("#page").html("");
                let num = productTool.length;
                if(num >= 10){
                    pages(10,productTool);
                }else{
                    pages(num,productTool);
                }
            }
        });
    })
</script>

<script>
    //=============分頁程式=============
    function pages(maxNum, dataSource){ //輸入單頁最大筆數和資料來源
        //=================分頁功能================
        //最大頁數
        let maxPage;
        //目前顯示頁數
        let nowPage = 0;
        //每頁最大筆數
        let maxItems = maxNum;
        //設定起始編號
        let startItem = 0;
        //設定結束編號
        let endItem = maxItems;

        //讀回資料時就先顯示
        showData(startItem, endItem, dataSource);

        //計算出最大頁數。
        if(dataSource.length % maxItems == 0){
            maxPage = Math.floor(dataSource.length / maxItems);
            // alert("最大頁數1：" + maxPage);
        }else{
            maxPage = (Math.floor(dataSource.length / maxItems))+1;
            // alert("最大頁數2：" + maxPage);
        }
        // alert("最大頁數：" + maxPage);
        //生成前先清空
        $("#page").html(" ");
        //動態生成頁數
        let pageHtml = `<li class="page-item previous disabled pageMove"><a class="page-link">上一頁</a></li>`;
        for(let i=0; i<maxPage; i++){
            let pageNum = i+1;
            pageHtml += `<li id=`+ i +` class="page-item page pageNum pageMove"><a class="page-link">`+ pageNum +`</a></li>`;
        };
        pageHtml += `<li class="page-item next pageMove"><a class="page-link" >下一頁</a></li>`;
        $("#page").html(pageHtml);

        //綁定前先清除綁定事件
        $("#page").unbind("click");
        //綁定click事件
        $("#page").on("click",".page", function(){
            nowPage = ($(this).prop("id"))*1;//強制轉成數字型態
            $(".pageNum").prop("class","page-item page pageNum")
            $(this).prop("class","page-item page pageNum active")
            // alert("nawPage："+nowPage+ "資料型態："+typeof nowPage);
            //恢復上、下頁的功能
            $(".previous").prop("class", "page-item previous");
            $(".next").prop("class", "page-item next");
            // alert("nowPage："+nowPage+"maxPage："+maxPage);
            //計算是否是最後一頁
            if((nowPage)+1 >= maxPage){
                startItem = nowPage * maxItems;
                if(dataSource.length % maxItems == 0){
                    endItem = startItem + maxItems
                }else{
                    endItem = startItem + dataSource.length % maxItems;
                }

            }else{
                startItem = nowPage * maxItems;
                endItem = startItem + maxItems;
            }
            // alert("開始："+startItem+"結束："+endItem);
            showData(startItem, endItem, dataSource);
        });

        //=======上一頁設定========
        $("#page").on("click", ".previous", function (){

            //恢復下一頁的功能
            $(".next").prop("class", "page-item next");

            let page = nowPage-1;

            $(".pageNum").prop("class","page-item page pageNum")
            $("#"+page).prop("class","page-item page pageNum active")

            //判斷是否已經是第一頁了，取消上一頁功能
            if(page <= 0 ){
                $(".previous").prop("class", "page-item previous disabled");
                startItem = 0 * maxItems;
                endItem = startItem + maxItems;
            }else{
                startItem = page * maxItems;
                endItem = startItem + maxItems;
            }
            showData(startItem, endItem, dataSource);
            nowPage = page;
        });

        //=============下一頁設定=============
        $("#page").on("click", ".next", function(){

            //恢復上一頁的功能
            $(".previous").prop("class", "page-item previous");

            let page = nowPage + 1;

            $(".pageNum").prop("class","page-item page pageNum")
            $("#"+page).prop("class","page-item page pageNum active")

            //計算是否是最後一頁，並取消下一頁功能
            if(page >= (maxPage-1)){
                $(".next").prop("class", "page-item next disabled")
                startItem = page * maxItems;
                if(dataSource.length % maxItems == 0){
                    endItem = startItem + maxItems
                }else{
                    endItem = startItem + dataSource.length % maxItems;
                }
            }else{
                startItem = page * maxItems;
                endItem = startItem + maxItems;
            }
            showData(startItem, endItem, dataSource);
            nowPage = page;
        });
    }
</script>

<script>
    //=============顯示功能=============
    function showData(startItem,endItem,dataSource){
        let txt = "<tr>";
        for (let i = startItem; i < endItem; i++) {
            txt += "<td class='align-middle'>"+dataSource[i].productId+"</td>"
            let cate = dataSource[i].categories;
            let type = ""
            if( cate == 0){type = "廚具";
            }else{ type = "食材";}
            txt += "<td class='align-middle'>"+type+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].productCompany+"</td>"
            let st = dataSource[i].product_status;
            let status = ""
            if( st == 1){
                status = "上架中";
            }else{
                status = "下架中";
            }
            txt += "<td class='align-middle'>"+status+"</td>"
            let nameObj = new String(dataSource[i].productName);
            let nameString = nameObj.substring(0,15);
            txt += "<td class='align-middle'>"+nameString+"</td>"
            let contentObj = new String(dataSource[i].productContent);
            let context = contentObj.substring(0,10);
            txt += "<td class='align-middle'>"+context+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].productPrice+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].productStock+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].productSalesFigures+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].productKeywords+"</td>"
            let newDate = new Date(dataSource[i].productInsertDate);
            let register = newDate.toLocaleString();
            txt += "<td class='align-middle'>"+register+"</td>"
            txt += '<td class="align-middle">'+
                '<form method="" >'+
                '<input id="updateBtn" class="btn btn-outline-primary" type="button" value="更新" data-id='+dataSource[i].productId+'>'+
                '</form>'+
                '</td>'
            txt += '<td class="align-middle">'+
                '<form method="" >'+
                '<input id="delBtn" class="btn btn-outline-primary" type="button" value="刪除" data-id='+dataSource[i].productId+'>'+
                '</form>'+
                '</td></tr>'
        }
        $("#products").html(txt);
    }

</script>
</body>

