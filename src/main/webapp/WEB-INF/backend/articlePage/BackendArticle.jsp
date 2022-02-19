<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

            <head>
                <link rel="stylesheet" href="../../../css/backendManager.css">
            </head>

            <body>
                <h1 class="tableName titleName2">
                    文章列表
                    <br>
                    <span class="littleName">Article List</span>
                </h1>

                <div class="w-50 p-3 input-group mb-3">
                    <select class="btn btn-outline-secondary dropdown" id="clasify">
                        <option selected>全部文章</option>
                        <option>廚具開箱</option>
                        <option>食譜分享</option>
                    </select>
                    <input type="text" placeholder="請輸入文章標題關鍵字..." class="form-control" aria-label="Text input with dropdown button" id="titleKeyWord">
                    <button class="btn btn-outline-secondary" type="button" id="articleSearch">查詢文章</button>
                </div>

                <section class="content">
                    <div class="col-xs-12">
                        <table id="" class='table table-striped table-hover '>
                            <thead>
                                <tr>
                                    <th class="col col1 table-danger">文章編號</th>
                                    <th class="col col2 table-danger">文章分類</th>
                                    <th class="col col4 table-danger">文章標題</th>
                                    <th class="col col10 table-danger">點擊次數</th>
                                    <th class="col col13 table-danger">發布日期</th>
                                    <th class="col col15 table-danger">刪除</th>
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
                    //使用者ID
                    let UserId;
                    //將值傳到全域
                    let ShareData;
                    //最大頁數
                    var maxPage;
                    //目前顯示頁數
                    let nowPage = 0;
                    //每頁最大筆數
                    let maxItems = 10;
                    //設定起始編號
                    let startItem = 0;
                    //設定結束編號
                    //let endItem = maxItems;
                    let endItem;

                    window.addEventListener('load', function() {
                        searchShareDate("/totalArticleData", "GET");
                    })

                    //ajax function
                    function searchShareDate(url, type) {
                        $.ajax({
                            url: url,
                            type: type,
                            contentType: "application/json; charset=utf-8",
                            success: function(articles) {
                                ShareData = articles

                                UserId = articles.session;
                                console.log(articles)
                                    //得到格式：{session: null, title: Array(18)}        
                                    //console.log(ShareData)
                                    //=================分頁功能================
                                endItem = (articles.title.length <= 10) ? articles.title.length : 10;
                                //讀回資料時就先顯示
                                showData(startItem, endItem);

                                //計算出最大頁數。
                                maxPage = (articles.title.length % maxItems == 0) ? Math.floor(articles.title.length / maxItems) : (Math.floor(articles.title.length / maxItems)) + 1;

                                //動態生成頁數
                                let pageHtml = `<li class="page-item previous disabled pageMove"><a class="page-link">上一頁</a></li>`;
                                for (let i = 0; i < maxPage; i++) {
                                    let pageNum = i + 1;
                                    pageHtml += `<li id=` + i + ` class="page-item page pageNum pageMove"><a class="page-link">` + pageNum + `</a></li>`;
                                };
                                pageHtml += `<li class="page-item next pageMove"><a class="page-link" >下一頁</a></li>`;
                                $("#page").html(pageHtml);

                            }
                        });
                    };
                    //綁定click事件
                    $("#page").on("click", ".page", function() {
                        //alert(ShareData);
                        nowPage = ($(this).prop("id")) * 1; //強制轉成數字型態
                        $(".pageNum").prop("class", "page-item page pageNum")
                        $(this).prop("class", "page-item page pageNum active")
                            // alert("nawPage："+nowPage+ "資料型態："+typeof nowPage);
                            //恢復上、下頁的功能
                        $(".previous").prop("class", "page-item previous");
                        $(".next").prop("class", "page-item next");
                        // alert("nowPage："+nowPage+"maxPage："+maxPage);
                        //計算是否是最後一頁
                        if ((nowPage) + 1 >= maxPage) {
                            startItem = nowPage * maxItems;
                            if (ShareData.title.length % maxItems == 0) {
                                endItem = startItem + maxItems
                            } else {
                                endItem = startItem + ShareData.title.length % maxItems;
                            }

                        } else {
                            startItem = nowPage * maxItems;
                            endItem = startItem + maxItems;
                        }
                        // alert("開始："+startItem+"結束："+endItem);
                        showData(startItem, endItem);
                    });
                    //=======上一頁設定========
                    $("#page").on("click", ".previous", function() {

                        //恢復下一頁的功能
                        $(".next").prop("class", "page-item next");

                        let page = nowPage - 1;

                        $(".pageNum").prop("class", "page-item page pageNum")
                        $("#" + page).prop("class", "page-item page pageNum active")

                        //判斷是否已經是第一頁了，取消上一頁功能
                        if (page <= 0) {
                            $(".previous").prop("class", "page-item previous disabled");
                            startItem = 0 * maxItems;
                            endItem = startItem + maxItems;
                        } else {
                            startItem = page * maxItems;
                            endItem = startItem + maxItems;
                        }
                        showData(startItem, endItem);
                        nowPage = page;
                    });

                    //========下一頁設定============
                    $("#page").on("click", ".next", function() {

                        //恢復上一頁的功能
                        $(".previous").prop("class", "page-item previous");

                        let page = nowPage + 1;

                        $(".pageNum").prop("class", "page-item page pageNum")
                        $("#" + page).prop("class", "page-item page pageNum active")

                        //計算是否是最後一頁，並取消下一頁功能
                        if (page >= (maxPage - 1)) {
                            $(".next").prop("class", "page-item next disabled")
                            startItem = page * maxItems;
                            if (ShareData.title.length % maxItems == 0) {
                                endItem = startItem + maxItems
                            } else {
                                endItem = startItem + ShareData.title.length % maxItems;
                            }
                        } else {
                            startItem = page * maxItems;
                            endItem = startItem + maxItems;
                        }
                        showData(startItem, endItem);
                        nowPage = page;
                    });
                </script>
                <script>
                    //==================模糊搜尋==================
                    var alertPlaceholder = document.getElementById('liveAlertPlaceholder')
                    var alertTrigger = document.getElementById('articleSearch')

                    $("#articleSearch").on("click", function() {
                        let clasify = $("#clasify").val();
                        let titleKeyWord = $("#titleKeyWord").val()

                        if (titleKeyWord == "" || titleKeyWord.length == 0) {
                            alertMsg('搜尋內容不能空白喔', 'success')
                            return;
                        } else {
                            $("#liveAlertPlaceholder").html("");
                        }

                        let fuzzySearch = {
                            "clasify": clasify,
                            "AssociateString": titleKeyWord
                        }
                        console.log(fuzzySearch)

                        $.ajax({
                            url: "/fuzzySearch/" + clasify + "/" + titleKeyWord,
                            type: "GET",
                            //data: JSON.stringify(fuzzySearch),
                            contentType: "application/json; charset=utf-8",
                            success: function(articles) {
                                ShareData = articles
                                    //得到格式：{session: null, title: Array(18)}        

                                //=================分頁功能================
                                endItem = (articles.title.length <= 10) ? articles.title.length : 10;
                                //讀回資料時就先顯示
                                showData(startItem, endItem, articles);
                                //計算出最大頁數。
                                maxPage = (articles.title.length % maxItems == 0) ? Math.floor(articles.title.length / maxItems) : (Math.floor(articles.title.length / maxItems)) + 1;

                                //動態生成頁數
                                let pageHtml = `<li class="page-item previous disabled pageMove"><a class="page-link">上一頁</a></li>`;
                                for (let i = 0; i < maxPage; i++) {
                                    let pageNum = i + 1;
                                    pageHtml += `<li id=` + i + ` class="page-item page pageNum pageMove"><a class="page-link">` + pageNum + `</a></li>`;
                                };
                                pageHtml += `<li class="page-item next pageMove"><a class="page-link" >下一頁</a></li>`;
                                $("#page").html(pageHtml);
                            }
                        })

                    })

                    function showMessageOutput(messageOutput) {
                        let line = "";
                        JSONData = JSON.stringify(messageOutput);
                        line += JSON.stringify(messageOutput) + "\n";
                    }
                    //模糊搜尋報錯
                    function alertMsg(message, type) {
                        var wrapper = document.createElement('div')
                        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

                        alertPlaceholder.append(wrapper)
                    }
                </script>


                <script>
                    //=============顯示功能=============
                    function showData(startItem, endItem) {
                        let txt = "<tr>";
                        for (let i = startItem; i < endItem; i++) {
                            txt += "<td class='align-middle'>" + ShareData.title[i].share_id + "</td>"
                            txt += "<td class='align-middle'>" + ShareData.title[i].article_clallify + "</td>"
                            txt += "<td class='align-middle'><a href='/adminIDFindAll/" + ShareData.title[i].share_id + "'>" + ShareData.title[i].article_title + "</a></td>";
                            txt += "<td class='align-middle'>" + ShareData.title[i].viewNum + "</td>"

                            let newDate = ShareData.title[i].postTime;
                            let register = newDate.toLocaleString();
                            txt += "<td class='align-middle'>" + register + "</td>"

                            txt += '<td class="mdata">' +
                                '<form method="" action="">' +
                                '<input type="hidden" type="text" name="empdel" value=?>' +
                                '<input id="delBtn" class="btn btn-outline-danger" type="button" value="刪除" onclick="delfun(' + ShareData.title[i].share_id + ')">' +
                                '</form>' +
                                '</td></tr>'
                        }
                        $("#members").html(txt);
                    }
                </script>
                <script>
                    //=============刪除確認=============

                    function delfun(id) {
                        if (confirm("確定刪除此筆紀錄嗎 ?")) {
                            $.ajax({
                                url: "/adminDeleteData/" + id,
                                type: "DELETE",
                                success: function() {
                                    searchShareDate("/totalArticleData", "GET");
                                }
                            })
                        }
                    }
                </script>
            </body>