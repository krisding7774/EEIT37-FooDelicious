<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <head>

        <link href="/css/CKEditor.css" rel="stylesheet" />
        <link rel="stylesheet" href="../../../css/backendArticleDetail.css">
        <style>
            #content {
                pointer-events: none;
            }
        </style>
    </head>

    <body>
        <h1 class="tableName titleName2">
            文章詳細內容
            <br>
            <span class="littleName">Article Content</span>
        </h1>
        <div class="main">
            <form class="border col-md-12 rounded">
                <div class="input-group textSet">
                    <div class="col-md-2 ">
                        <label for="title" class="col-md-12 col-form-label">文章標題</label>
                    </div>

                    <div class="col-md-8">
                        <input type="text" class="form-control" readonly id="title" value="">
                    </div>
                </div>
                <div class="input-group textSet">
                    <label for="articleId" class="col-md-2 col-form-label">文章編號</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" readonly id="articleId" value="">
                    </div>
                    <label for="articleId" class="col-md-2 col-form-label">文章類別</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" readonly id="articleClallify" value="">
                    </div>
                </div>
                <div class="input-group textSet ">
                    <label for="account" class="col-md-2 col-form-label">作者帳號</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" readonly id="account" value="">
                    </div>
                    <label for="viewNum" class="col-md-2 col-form-label">點閱數量</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" readonly id="viewNum" value="">
                    </div>
                </div>

                <div class="input-group textSet ">
                    <div class="col-md-2 ">
                        <label for="articleId" class="">文章內容</label>
                    </div>

                    <div class="col-md-8">
                        <input type="text" class="form-control" readonly id="" hidden value="">
                    </div>
                </div>
                <hr/>
                <div id="content" class="textArea" style="border: 0px;">
                    <div id="editor">${articleContent}</div>
                </div>
            </form>
            <div class="input-group textSet buttonArea">
                <div class="col-md-6">
                    <input id="cancel" class="btn btn-outline-primary btn-lg " type="submit" value="取消" onclick="cancel()">
                </div>
                <div class="col-md-6">
                    <input id="delBtn" class="btn btn-outline-danger btn-lg" type="button" value="刪除" onclick=delfun(${ArticleId})>
                </div>
            </div>

        </div>
        <script src="/js/ckeditor.js"></script>
        <script>
            //=============跳回首頁=============
            function cancel() {
                window.location.href = "/backend/article";
            }
        </script>

        <script>
            var accountId = "";
            let clallifyAndTitle = "";
            $.ajax({
                url: "/responseArticle",
                type: "Get",
                success: function(data) {
                    $("#title").val(data.title[0].article_title);
                    $("#articleId").val(data.title[0].share_id);
                    $("#articleClallify").val(data.title[0].article_clallify);
                    //$("#account").val(data.title[0].fk_account_id);
                    findMail(data.title[0].fk_account_id)
                    $("#viewNum").val(data.title[0].viewNum);
                    $("#title").val(data.title[0].article_title);
                    //$("#content").html(data.article[0].article);
                }
            })
        </script>
        <script>
            //找信箱的function
            function findMail(id) {
                $.ajax({
                    url: "/useIdFindEmail/" + id,
                    type: "GET",
                    success: function(data) {
                        $("#account").val(data);
                    }
                })
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
                            window.location.href = "/backend/article";
                        }
                    })

                }
            }
        </script>
        <script>
            //ckeditor
            ClassicEditor
                .create(document.querySelector('#editor'), {})
                .then(editor => {
                    const toolbarElement = editor.ui.view.toolbar.element;
                    toolbarElement.style.display = 'none';
                })
                .catch(error => {
                    console.log(error);
                });
        </script>
    </body>