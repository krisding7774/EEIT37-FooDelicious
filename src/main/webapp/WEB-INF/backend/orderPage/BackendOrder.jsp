<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <link rel="stylesheet" href="../../../css/backendOrder.css">
</head>
<body>
<h1 class="tableName titleName2">
    訂單列表
    <br>
    <span class="littleName">Order List</span>
</h1>
<div class="searchArea">
    <input class="keyWord keyWord1 searchBox" type="text" name="accKeyWord" placeholder="請輸入正確訂單編號">
    <input id="searchAcc" class="keyWord btn btn-outline-secondary searchBox2 " type="button" value="查詢" />
</div>

<ul id="selectPage" class="nav nav-tabs">
    <li class="nav-item">
        <a id="all" class="nav-link active" aria-current="page" href="#">全部訂單</a>
    </li>
    <li class="nav-item">
        <a id="success" class="nav-link" href="#">完成</a>
    </li>
    <li class="nav-item">
        <a id="handling" class="nav-link" href="#">處理中</a>
    </li>
    <li class="nav-item">
        <a id="failed" class="nav-link" href="#">失敗</a>
    </li>
</ul>

<section class="content">
    <div class="col-xs-12">
        <table id="" class='table table-striped table-hover '>
            <thead>
                <tr>
                    <th class="col table-warning smalW">編號</th>
                    <th class="col table-warning midW">會員帳號</th>
                    <th class="col table-warning smalW">收件人姓名</th>
                    <th class="col table-warning smalW">收件人電話</th>
                    <th class="col table-warning large">收件人地址</th>
                    <th class="col table-warning smalW">訂單狀態</th>
                    <th class="col table-warning smalW">訂單金額</th>
                    <th class="col table-warning midW">新增日期</th>
                    <th class="col table-warning smalW">更新</th>
                </tr>
            </thead>
            <tbody id="orders"></tbody>
        </table>
        <nav aria-label="Page navigation example ">
            <ul id="page" class="pagination justify-content-center"></ul>
        </nav>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="orderDetail" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">訂單內容</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="col-xs-12">
                    <table class='table table-striped table-hover '>
                        <thead>
                        <tr>
                            <th class="col table-warning midW">商品照片</th>
                            <th class="col table-warning smalW">商品名稱</th>
                            <th class="col table-warning smalW">商品價格</th>
                            <th class="col table-warning large">購買數量</th>
                        </tr>
                        </thead>
                        <tbody id="productDetail"></tbody>
                        <tfoot>
                            <td id="totalPric"></td>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    //=============顯示所有商品資料=============
    window.onload=function(){
        $.ajax({
            url: "/bkorders",
            type: "GET",
            success: function(productData){
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
    //=============訂單編號查詢功能=============
    $("#searchAcc").on("click",function(){
        let orderId = $(".keyWord1").val();
       $.ajax({
           url: "/bkorders/"+orderId,
           type: "GET",
           success:function(order){
               if(order){
                   let txt = "<tr>";
                   txt += '<td class="align-middle"><a class="detail" href="" data-bs-toggle="modal" data-bs-target="#orderDetail" onclick="detailData('+order.ordersId+')">'+order.ordersId+'</a></td>';
                   txt += "<td class='align-middle'>"+order.bkMember.memberMail+"</td>";
                   txt += "<td class='align-middle'>"+order.ordersName+"</td>";
                   txt += "<td class='align-middle'>"+order.ordersPhone+"</td>";
                   txt += "<td class='align-middle'>"+order.ordersAddress+"</td>";
                   txt += "<td class='align-middle'>"+order.ordersState+"</td>";
                   txt += "<td class='align-middle'>"+order.ordersTotal+"</td>";
                   let newDate = new Date(order.ordersDate);
                   let register = newDate.toLocaleString();
                   txt += "<td class='align-middle'>"+register+"</td>"
                   txt += '<td class="align-middle">'+
                       '<form method="" >'+
                       '<input id="updateBtn" class="btn btn-outline-primary" type="button" value="更新" data-id='+order.ordersId+'>'+
                       '</form>'+
                       '</td></tr>'
                   $("#orders").html(txt);
                   $("#page").html("");

               }else{
                   alert("查無此訂單資料，請再次確認訂單編號是否正確");
               }
           }
       })

    });
</script>

<script>
    //=============更新商品資料功能=============

    //更新前先查詢出資料
    $("#orders").on("click","#updateBtn",function(){
        let data = $(this).data("id");
        // alert("data："+data)
        $.ajax({
            url:"/bkorders/"+data,
            type: "GET",
            success:function(order){
                //將json字串化
                let orderString = JSON.stringify(order);
                //將資料存到localStorage，給另一個頁面使用
                localStorage.setItem("orderData",orderString);
                //跳轉頁面
                window.location.href="/backend/order/update";
            }
        })

    });
</script>

<script>
    //=============顯示分頁設定=============
    //=============全部訂單=============
    let urlString = "";
    $("#all").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#all").prop("class","nav-link active");
        urlString = "/bkorders";
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(productAll){
                let num = productAll.length;
                if(num >= 10){
                    pages(10,productAll);
                }else{
                    pages(num,productAll);
                }
            }
        });
    })

    //=============完成=============
    $("#success").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#success").prop("class","nav-link active");
        urlString = "/bkorders/pages/完成";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(success){
                $("#products").html("");
                $("#page").html(" ");
                let num = success.length;
                if(num >= 10){
                    pages(10,success);
                }else{
                    pages(num,success);
                }
            }
        });
    })

    //=============處理中=============
    $("#handling").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#handling").prop("class","nav-link active");
        urlString = "/bkorders/pages/訂單處理中/待出貨/運送中";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(handling){
                $("#products").html("");
                $("#page").html("");
                let num = handling.length;
                if(num >= 10){
                    pages(10,handling);
                }else{
                    pages(num,handling);
                }
            }
        });
    })

    //=============失敗=============
    $("#failed").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#failed").prop("class","nav-link active");
        urlString = "/bkorders/pages/失敗";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(failed){
                $("#products").html("");
                $("#page").html("");
                let num = failed.length;
                if(num >= 10){
                    pages(10,failed);
                }else{
                    pages(num,failed);
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
            txt += '<td class="align-middle"><a class="detail" href="" onclick="detailData('+dataSource[i].ordersId+')" data-bs-toggle="modal" data-bs-target="#orderDetail">'+dataSource[i].ordersId+'</a></td>'
            txt += "<td class='align-middle'>"+dataSource[i].bkMember.memberMail+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].ordersName+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].ordersPhone+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].ordersAddress+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].ordersState+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].ordersTotal+"</td>"
            let newDate = new Date(dataSource[i].ordersDate);
            let register = newDate.toLocaleString();
            txt += "<td class='align-middle'>"+register+"</td>"
            txt += '<td class="align-middle">'+
                '<form method="" >'+
                '<input id="updateBtn" class="btn btn-outline-primary" type="button" value="更新" data-id='+dataSource[i].ordersId+'>'+
                '</form>'+
                '</td></tr>'
        }
        $("#orders").html(txt);
    }

</script>
<script>
    //-------------------訂單內容-----------------
    function detailData(orderId){

        $.ajax({
            url:"/bkordersDetail/"+orderId,
            type:"GET",
            success:function(detail){
                let detailHtml = "<tr>";
                let totalPrice = 0;
                for(let i=0; i<detail.length; i++){
                    detailHtml += "<td><img class='detailImg' src='../../../img/"+detail[i].bkProduct.productImg+"'/></td>";
                    detailHtml += "<td>"+detail[i].bkProduct.productName+"</td>";
                    detailHtml += "<td>"+detail[i].bkProduct.productPrice+"</td>";
                    detailHtml += "<td>"+detail[i].quantity+"</td></tr>";
                    totalPrice += ((detail[i].bkProduct.productPrice)*(detail[i].quantity));
                }
                $("#productDetail").html(detailHtml);
                let total = totalPrice.toLocaleString('en-US');
                $("#totalPric").text("總金額："+total+"NT");
            }
        })
    }
</script>
</body>

