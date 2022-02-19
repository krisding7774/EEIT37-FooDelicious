<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="row" id="rowSelect">
        <div class="col-12 col-md-2">
            <div class="list-group">
                <a href="/LoginSystem" class="list-group-item list-group-item-action">會員登入</a>
                <a href="/Product" class="list-group-item list-group-item-action">前往商城</a>
                <a href="#" class="list-group-item list-group-item-action">前往分享區</a>
                <a href="/postArticle" class="list-group-item list-group-item-action">發表新文章</a>
                <a href="/custService" class="list-group-item list-group-item-action">客服中心</a>
            </div>
        </div>
        <div class="col-12 col-md-9">

            <div class="row">
                <div class="col-md-3">
                    <img src="https://picsum.photos/300/200?random=1" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <img src="https://picsum.photos/300/200?random=1" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <img src="https://picsum.photos/300/200?random=1" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <img src="https://picsum.photos/300/200?random=1" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <hr>
            <div class="topDIV">
                <ul class="nav nav-tabs">
                    <li class="nav-item"><button id="navTotal" type="button" class="nav-link active" aria-current="page">全部文章</button></li>
                    <li class="nav-item"><button id="navKitchenware" type="button" class="nav-link">廚具開箱</button>
                    </li>
                    <li class="nav-item"><button id="navRecipe" type="button" class="nav-link">食譜分享</button></li>
                </ul>

            </div>

            <table class="table table-hover">
                <tbody id="articleArea">
                </tbody>
            </table>
        </div>
    </div>

    <script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
    <script>
        //設定起始編號
        let startItem = 0;
        //設定結束編號
        //let endItem = maxItems;
        let endItem;
        //=======================文章區域 都只顯示5筆=======================

        //載入視窗先執行區域
        window.addEventListener('load', function() {
            searchShareDate("/VNArticleData", "GET");
        })

        //  searchShareDate方法區域
        function searchShareDate(url, type) {
            //輸入聊天訊息區域
            inputMessageArea = document.getElementById('inputMessageArea');
            //傳送訊息BTN
            btnSendToChatRoom2 = document.getElementById('sendToChatRoom2');
            $.ajax({
                url: url,
                type: type,
                contentType: "application/json; charset=utf-8",
                success: function(articles) {
                    ShareData = articles

                    UserId = articles.session;

                    //得到格式：{session: null, title: Array(18)}
                    //=================分頁功能================
                    endItem = (articles.title.length <= 10) ? articles.title.length : 5;
                    //讀回資料時就先顯示
                    showData(startItem, endItem);
                }
            });
        };

        //  showData方法區域
        function showData(startItem, endItem) {
            let ArticleData = "";
            for (let i = startItem; i < 5; i++) {
                ArticleData += "<tr>";
                ArticleData += "<th scope='row'>" + (i + 1) + "</th>";
                ArticleData += "<td>" + ShareData.title[i].article_clallify + "</td>";
                ArticleData += "<td><a href='/intIDFindAll/" + ShareData.title[i].share_id + "'>" + ShareData.title[i].article_title + "</a></td>";
                ArticleData += "</tr>";
            }
            $("#articleArea").html(ArticleData);
        }

        //上面分類選擇器
        $("#navTotal").click(function() {
            searchShareDate("/VNArticleData", "GET");
            nowPage = 0;
            startItem = 0;
            $("#navTotal").prop("class", "nav-link active")
            $("#navKitchenware").prop("class", "nav-link")
            $("#navRecipe").prop("class", "nav-link")
        })
        $("#navKitchenware").click(function() {
            searchShareDate("/VNKitchenwareData", "GET");
            nowPage = 0;
            startItem = 0;
            $("#navTotal").prop("class", "nav-link")
            $("#navKitchenware").prop("class", "nav-link active")
            $("#navRecipe").prop("class", "nav-link")
        })
        $("#navRecipe").click(function() {
            searchShareDate("/VNRecipeData", "GET");
            nowPage = 0;
            startItem = 0;
            $("#navTotal").prop("class", "nav-link")
            $("#navKitchenware").prop("class", "nav-link")
            $("#navRecipe").prop("class", "nav-link active")
        })
    </script>