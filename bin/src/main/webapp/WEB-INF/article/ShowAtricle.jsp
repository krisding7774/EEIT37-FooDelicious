<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <style>
            #contentArea {
                pointer-events: none;
            }

            #sendMsg {
                margin-bottom: 1.5em;
            }

            .align-right {

                float: right;
            }
        </style>

        <link href="/css/CKEditor.css" rel="stylesheet" />
        <div class="row" id="rowSelect">
            <div class="col-12 col-md-2">
                <br>

                <button type="button" id="updateBTN" class="btn btn-primary btn-lg" role="button"
                    data-bs-toggle="button">修改</button>
            </div>

            <div class="col-12 col-md-9">
                <button type="button" class="btn btn-primary" id="likeBTN">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                        <path
                            d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
                    </svg>
                    喜歡
                </button>

                <button type="button" class="btn btn-primary" id="unlikeBTN">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                        <path
                            d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                    </svg>
                    取消
                </button>

                <br>
                <!--觀看文章-->
                <div id="contentArea" disabled>
                    <table class="table table-hover">
                        <tbody id="clallifyAndTitle"></tbody>
                    </table>
                    <div id="editor">${articleContent}</div>
                </div>
                <!--留言區-->
                <div id="msgArea">
                    <!--摺疊-->
                    <div id="foldArea">
                        <button id="foldBTN" class="container btn btn-primary" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">

                        </button>
                        <div class="collapse" id="collapseExample">
                            <div class="card card-body">
                                <table class="table table-hover table-sm" id="foldMSG">
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--五筆留言以下-->
                    <div id="shortArea">
                        <table class="table table-hover table-sm" id="showMSG" style="background-color: whitesmoke;">

                        </table>

                    </div>
                    <input id="sendMsg" type="text" class="form-control" placeholder="留言..." aria-label="Username"
                        aria-describedby="addon-wrapping">
                </div>
            </div>
        </div>
        <script src="/js/ckeditor.js"></script>
        <script src="/js/jquery-3.6.0.min.js"></script>
        <script>
            $("#unlikeBTN").hide();
            $("#likeBTN").hide();
            var articleId = "";
            let clallifyAndTitle = "";
            let loginId = "";
            $.ajax({
                url: "/responseArticle",
                type: "Get",
                success: function (data) {
                    let accId = data.title[0].fk_account_id;
                    loginId = data.LoginId;
                    articleId = data.title[0].share_id
                    clallifyAndTitle += "<tr><th>分類：" + data.title[0].article_clallify + "</th></tr>";
                    clallifyAndTitle += "<tr><th>標題：" + data.title[0].article_title + "</th></tr>";
                    clallifyAndTitle += "<tr>";
                    clallifyAndTitle += "<td><span>發帖時間：" + data.title[0].postTime + "</span></td>";
                    clallifyAndTitle += "<td><span>閱覽數：" + data.title[0].viewNum + "</span></td>";
                    clallifyAndTitle += "</tr>";
                    $("#clallifyAndTitle").html(clallifyAndTitle);
                    $("#editor").html(data.article[0].article);
                    document.getElementById("updateBTN").style.visibility = (loginId == accId) ? 'visible' : 'hidden';
                    document.getElementById("sendMsg").style.visibility = (loginId != null) ? 'visible' : 'hidden';

                    msgShow();
                    checkLike();


                }
            })
            $("#updateBTN").click(function () {
                window.location.href = "/goUpdatePage"
            })
        </script>

        <script>
            //ckeditor
            ClassicEditor
                .create(document.querySelector('#editor'), {
                    commentsOnly: true
                })
                .then(editor => {
                    const toolbarElement = editor.ui.view.toolbar.element;
                    toolbarElement.style.display = 'none';

                })
                .catch(error => {
                    console.log(error);
                });
        </script>
        <script>
            //留言功能區域
            $("#sendMsg").keydown(function () {
                if (event.keyCode === 13 & sendMsg.value.length != 0) {
                    //console.log(sendMsg.value)
                    let MsgData = {};
                    MsgData.articleId = articleId;
                    MsgData.text = sendMsg.value;
                    MsgData.loginId = loginId;
                    console.log(MsgData)
                    $.ajax({
                        url: "/insertMsg",
                        type: "Post",
                        dataType: 'json',
                        contentType: "application/json;charset=utf-8",
                        data: JSON.stringify(MsgData),
                        success: function () {
                            msgShow();
                        }
                    })
                    sendMsg.value = "";
                }
                //msgShow();
            })
        </script>

        <script>
            //留言顯示區域
            function msgShow() {
                $.ajax({
                    url: "/showAllMsg/" + articleId,
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    success: function (msg) {
                        expandMSG(msg);
                    }
                })
            }
        </script>
        <script>
            //msg全部展開
            function expandMSG(msg) {
                let msgData = "";
                //console.log(msg.length)
                if (msg.length >= 5) {
                    $("#shortArea").hide();

                    $("#foldBTN").html("一共有 " + msg.length + " 筆留言")
                    for (let i = 0; i < msg.length; i++) {
                        msgData += "<tr><td><div>" + msg[i].memberName +"： ";
                        msgData += "<button class='align-right'>更新</button></div>";
                        msgData += "<div><button class='align-right'>刪除</button></div>";
                        msgData += "<div>" + msg[i].text + "</div></td></tr>";
                    }
                    msgData += "</table>";
                    $("#foldMSG").html(msgData);
                    msgShow();
                } else {
                    $("#foldArea").hide();
                    for (let i = 0; i < msg.length; i++) {
                        msgData += "<tr><td><div>" + msg[i].memberName +"： ";
                        msgData += "<button class='align-right'>更新</button></div>";
                        msgData += "<div><button class='align-right'>刪除</button></div>";
                        msgData += "<div>" + msg[i].text + "</div></td></tr>";
                    }
                    $("#showMSG").html(msgData);
                    msgShow();
                }
            }

            //
        </script>
        <script>
            //按讚事件
            $("#likeBTN").on("click", function () {
                ajaxFunc("/likeArticle", "Post");
                $("#unlikeBTN").show();
                $("#likeBTN").hide();
            })

            //一點也不讚事件
            $("#unlikeBTN").on("click", function () {
                ajaxFunc("/unlike", "Post");
                $("#unlikeBTN").hide();
                $("#likeBTN").show();
            })

            function ajaxFunc(url, type) {
                let LON = {};
                LON.userId = loginId;
                LON.articleId = articleId;
                $.ajax({
                    url: url,
                    type: type,
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(LON)
                })
            }

            //判斷是否有按讚區域
            function checkLike() {
                console.log("loginId：" + loginId);
                if (loginId != null) {
                    let LON = {};
                    LON.userId = loginId;
                    LON.articleId = articleId;
                    $.ajax({
                        url: "/checkLick/" + loginId + "/" + articleId,
                        type: "GET",
                        success: function (cellback) {
                            console.log("cellback：" + cellback)
                            if (cellback) {
                                $("#unlikeBTN").show();
                                $("#likeBTN").hide();
                            } else {
                                $("#unlikeBTN").hide();
                                $("#likeBTN").show();
                            }
                        }
                    })
                } else {
                    $("#unlikeBTN").hide();
                    $("#likeBTN").hide();
                }
            }
        </script>

        <script>
            //刪除留言
        </script>

        <script>
            //新增留言
        </script>