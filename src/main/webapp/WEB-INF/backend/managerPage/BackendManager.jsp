<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <link rel="stylesheet" href="../../../css/backendManager.css">
</head>
<body>
<h1 class="tableName titleName2">
    管理員列表
    <br>
    <span class="littleName">Manager List</span>
</h1>
<form action="">
    <div class="col-sm-3">
        <input class="keyWord keyWord1" type="text" name="accKeyWord" placeholder="請輸入Email關鍵字...">
        <input id="searchAcc" class="keyWord btn btn-outline-secondary" type="button" value="查詢" />
    </div>
</form>
<ul id="selectPage" class="nav nav-tabs">
    <li class="nav-item">
        <a id="all" class="nav-link active" aria-current="page" href="#">All</a>
    </li>
    <li class="nav-item">
        <a id="admin" class="nav-link" href="#">Admin</a>
    </li>
    <li class="nav-item">
        <a id="company" class="nav-link" href="#">Company</a>
    </li>
</ul>
<section class="content">
        <div class="col-xs-12">
            <table id="" class='table table-striped table-hover '>
                <thead>
                <tr>
                    <th class="col col1 table-danger">管理員編號</th>
                    <th class="col col2 table-danger">帳號Email</th>
                    <th class="col col4 table-danger">權限狀態</th>
                    <th class="col col5 table-danger">管理員姓名</th>
                    <th class="col col10 table-danger">管理員電話</th>
                    <th class="col col11 table-danger">管理員地址</th>
                    <th class="col col8 table-danger">管理員coin</th>
                    <th class="col col13 table-danger">註冊日期</th>
                    <th class="col col14 table-danger">更新</th>
                </tr>
                </thead>
                <tbody id="members"></tbody>
            </table>
            <nav aria-label="Page navigation example ">
                <ul id="page" class="pagination justify-content-center"></ul>
            </nav>
    </div>
</section>

<script>
    //=============E-mail關鍵字查詢功能=============
    $("#searchAcc").on("click",function(){
       let data = $(".keyWord1").val();
       $.ajax({
           url:"http://localhost:8080/bkmanagers/"+data,
           type: "GET",
           success:function(managers){
               let num = managers.length;
               //載入顯示功能
               showData(0, num, managers);

               //載入分頁功能
               if(num>=10){
                   pages(10, managers);
               }else{
                   pages(num, managers);
               }
           }
       })

    });
</script>

<script>
    //=============更新會員資料功能=============

    //更新前先查詢出資料
    $("#members").on("click","#updateBtn",function(){
        let data = $(this).data("id");
        // alert("data："+data)
        $.ajax({
            url:"http://localhost:8080/bkmanagers/update/"+data,
            type: "GET",
            success:function(manager){
                //將json字串化
                let managerString = JSON.stringify(manager);
                //將資料存到localStorage，給另一個頁面使用
                localStorage.setItem("managerData",managerString);
                //跳轉頁面
                window.location.href="/backend/manager/update";
            }
        })

    });
</script>

<script>
    //=============顯示所有會員資料=============
    const managerUrl = "http://localhost:8080/bkmanagers"
    let managerData;

    $.ajax({
        url: managerUrl,
        type: "GET",
        success: function(managerAll){
            //將值傳到全域
            managerData = managerAll;
            let num = managerAll.length;
            if(num >= 10){
                pages(10,managerData);
            }else{
                pages(num,managerData);
            }
        }
    });
</script>

<script>
    //=============顯示分頁設定=============
    let urlString = "";
    $("#all").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#all").prop("class","nav-link active");
        urlString = "/bkmanagers";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(managerAll){
                //將值傳到全域
                managerData = managerAll;
                let num = managerAll.length;
                if(num >= 10){
                    pages(10,managerData);
                }else{
                    pages(num,managerData);
                }
            }
        });
    })
    $("#admin").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#admin").prop("class","nav-link active");
        urlString = "/bkmanagers/find/admin";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(admins){
                $("#products").html("");
                $("#page").html(" ");
                let num = admins.length;
                if(num >= 10){
                    pages(10,admins);
                }else{
                    pages(num,admins);
                }
            }
        });
    })
    $("#company").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#company").prop("class","nav-link active");
        urlString = "/bkmanagers/find/company";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(company){
                $("#products").html("");
                $("#page").html("");
                let num = company.length;
                if(num >= 10){
                    pages(10,company);
                }else{
                    pages(num,company);
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
        var maxPage;
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
            txt += "<td class='align-middle'>"+dataSource[i].memberId+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].memberMail+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].memberStatus+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].memberName+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].memberPhone+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].memberAddress+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].memberCoin+"</td>"
            let newDate = new Date(dataSource[i].registerDate);
            let register = newDate.toLocaleString();
            txt += "<td class='align-middle'>"+register+"</td>"
            txt += '<td class="align-middle">'+
                '<form method="" >'+
                '<input id="updateBtn" class="btn btn-outline-primary" type="button" value="更新" data-id='+dataSource[i].memberId+'>'+
                '</form>'+
                '</td></tr>'
        }
        $("#members").html(txt);
    }

</script>
</body>

