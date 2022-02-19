<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/index.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=The+Nautigal&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../../fontawesome/css/all.css">
<%--裝B大圖片--%>
<div class="topPhoto">
    <img src="../../img/hero01.png"/>
    <div class="textArea">
        <h1 class="textAreaTxt">We make food easy <br> and delicious</h1>
    </div>
    <img src="../../img/hero03.png"/>
</div>

<%--熱銷商品--%>
<section id="bestSeller" class="month-specials productArea">
    <div class="productBox">
        <h1 class="textAreaTxt textSet">Best-Seller</h1>
        <div class="specials-content">
            <!--商品1-->
            <div class="special">
                <div class="special-img">
                    <a id="product0" href=""><img id="pho0" src="" /></a>
                </div>
                <div class="special-items">
                    <h2 id="productName0"></h2>
                    <p id="productContent0"></p>
                    <span id="productPrice0"></span>
                </div>
            </div>
            <!--商品2-->
            <div class="special">
                <div class="special-img">
                    <a id="product1" href=""><img id="pho1" src="" /></a>
                </div>
                <div class="special-items">
                    <h2 id="productName1"></h2>
                    <p id="productContent1"></p>
                    <span id="productPrice1"></span>
                </div>
            </div>
            <!--商品3-->
            <div class="special">
                <div class="special-img">
                    <a id="product2" href=""><img id="pho2" src="" /></a>
                </div>
                <div class="special-items">
                    <h2 id="productName2"></h2>
                    <p id="productContent2"></p>
                    <span id="productPrice2"></span>
                </div>
            </div>
            <!--商品4-->
            <div class="special">
                <div class="special-items">
                    <h2 id="productName3"></h2>
                    <p id="productContent3"></p>
                    <span id="productPrice3"></span>
                </div>
                <div class="special-img">
                    <a id="product3" href=""><img id="pho3" src="" /></a>
                </div>
            </div>
            <!--商品5-->
            <div class="special">
                <div class="special-items">
                    <h2 id="productName4"></h2>
                    <p id="productContent4"></p>
                    <span id="productPrice4"></span>
                </div>
                <div class="special-img">
                    <a id="product4" href=""><img id="pho4" src="" /></a>
                </div>
            </div>
            <!--商品6-->
            <div class="special">
                <div class="special-items">
                    <h2 id="productName5"></h2>
                    <p id="productContent5"></p>
                    <span id="productPrice5"></span>
                </div>
                <div class="special-img">
                    <a id="product5" href=""><img id="pho5" src="" /></a>
                </div>
            </div>
        </div>
    </div>
</section>

<%--熱門文章--%>
<section id="hotTopics" class="menu-cart articleArea">
    <div class="hotTopicArea">
        <h1 class="textAreaTxt textSet">Hot-Topics</h1>

        <ul class="menu-navigation" data-tabs data-match-height="true" id="example-tabs">
            <li id="foodArticle" class="tabs-title active "><a class="m-aim pageName" >食譜類</a></li>
            <li id="toolArticle" class="tabs-title pageName"><a class="m-anim pageName" >餐廚類</a></li>
        </ul>

        <div class="tabs-content articleArea" data-tabs-content="example-tabs">
            <div class="tabs-panel is-active" id="panel1">
                <table class="">
                    <thead>
                        <th>#</th>
                        <th>文章標題</th>
                        <th>作者</th>
                        <th>瀏覽數</th>
                        <th>上傳日期</th>
                    </thead>
                    <tbody id="articleArea"></tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<!-- Modal -->
<div class="modal fade" id="foodDrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">文章內容</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="content" class="" style="border: 0px;">
                    <div id="editor"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--回報頁面--%>
<footer class="footArea">
    <a href="#0" class="arrowTop"><i class="fas fa-arrow-alt-circle-up"></i></a>
    <div class="contactBox" >
        <h2>客戶反應中心</h2>
        <p>請留下您的問題與敘述，我們會於24小時內回覆給您</p>

        <div class="container">
            <form action="/action_page.php">
                <div class="row">
                    <div class="col-25">
                        <label for="name">姓名</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="name" name="name" placeholder="輸入您的姓名" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="email">聯絡Email或電話</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="email" name="email" placeholder="輸入您的email" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="country">問題類別</label>
                    </div>
                    <div class="col-75">
                        <select id="country" name="country">
                            <option value="">訂單問題</option>
                            <option value="">商品問題</option>
                            <option value="">投訴</option>
                            <option value="">其他</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="subject">問題(請盡量詳述)</label>
                    </div>
                    <div class="col-75">
                        <textarea id="subject" name="subject" placeholder="請描述您的問題" style="height:200px"></textarea>
                    </div>
                </div>
                <br>
                <div class="row" >
                    <input type="submit" value="送出" style="height:50px;width:100px">
                    <input type="button" value="清除" onclick="clearText();" style="height:50px;width:100px">
                    <input type="submit" value="一鍵輸入" style="height:50px;width:100px">
                </div>
            </form>
        </div>
    </div>
    <p id="contactBox" class="author">Made 2022 © by EEIT137 Team 1</p>
</footer>



<script src="../../js/bootstrap.bundle.min.js"></script>
<script>
    window.onload=function() {
        $.ajax({
            url: "/report/product/food",
            type: "GET",
            success: function (foods) {
                for (let i=0; i<3; i++){
                    $("#pho"+i).prop("src","../../img/"+foods[i].productImg);
                    $("#productName"+i).text(foods[i].productName);
                    $("#product"+i).prop("href","/Product/"+foods[i].productId);
                    let contentObj = new String(foods[i].productContent);
                    let productContent = contentObj.substring(0,20);
                    $("#productContent"+i).text(productContent);
                    $("#productPrice"+i).text(foods[i].productPrice+"$");
                }
            }
        })

        $.ajax({
            url: "/report/product/tool",
            type: "GET",
            success: function (tool) {
                for (let i=0; i<3; i++){
                    let j=i+3
                    $("#pho"+j).prop("src","../../img/"+tool[i].productImg);
                    $("#productName"+j).text(tool[i].productName);
                    $("#product"+j).prop("href","/Product/"+tool[i].productId);
                    let contentObj2 = new String(tool[i].productContent);
                    let productContent2 = contentObj2.substring(0,20);
                    $("#productContent"+j).text(productContent2);
                    $("#productPrice"+j).text(tool[i].productPrice+"$");
                }
            }
        })
        $("#foodArticle").on("click",foodPage);
        $("#toolArticle").on("click",toolPage);
        foodPage();
    }
</script>

<script>
    //=========食材區=========
function foodPage(){
    $("#toolArticle").prop("class","tabs-title");
    $("#foodArticle").prop("class","tabs-title active");
    $.ajax({
        url:"/report/article/food",
        type: "GET",
        success: function(foods){
            let foodList = foods;
            let foodArray = new Array();
            //=========統計數據=========
            let foodHtml="";
            for(let i=0; i<foods.length; i++){
                foodHtml +='<tr class="trHover"><td scope="row">'+(i+1)+'</td>';
                let nameObj = new String(foodList[i].article_title);
                let nameString = nameObj.substring(0,20);
                foodHtml += '<td><a class="detail" href="" data-bs-toggle="modal" data-bs-target="#foodDrop" data-id='+i+'>'+nameString+'</a></td>';
                foodHtml += '<td>'+foodList[i].bkMember.memberName+'</td>';
                foodHtml += '<td>'+foodList[i].viewNum+'</td>';
                let newDate = new Date(foodList[i].postTime);
                let register = newDate.toLocaleString();
                foodHtml += '<td>'+register+'</td></tr>';
                foodArray[i] = foodList[i].bkReportArticle.article;

            }
            $("#articleArea").html(foodHtml);
            $("#articleArea").on("click", ".detail", function(){
                let num = $(this).data("id");
                $("#editor").html(foodArray[num]);
            })
        }
    })
}

function toolPage() {
    //=========餐廚區=========
    $("#foodArticle").prop("class","tabs-title");
    $("#toolArticle").prop("class","tabs-title active");
    $.ajax({
        url: "/report/article/tool",
        type: "GET",
        success: function (tools) {
            let toolList = tools;
            let toolArray = new Array();
            //=========統計數據=========
            let toolHtml = "";
            for (let i = 0; i < tools.length; i++) {
                toolHtml += '<tr class="trHover"><td scope="row">' + (i + 1) + '</td>';
                let nameObj = new String(toolList[i].article_title);
                let nameString = nameObj.substring(0, 20);
                toolHtml += '<td><a class="detail" href="" data-bs-toggle="modal" data-bs-target="#foodDrop" data-id=' + i + '>' + nameString + '</a></td>';
                toolHtml += '<td>' + toolList[i].bkMember.memberName + '</td>';
                toolHtml += '<td>' + toolList[i].viewNum + '</td>';
                let newDate = new Date(toolList[i].postTime);
                let register = newDate.toLocaleString();
                toolHtml += '<td>' + register + '</td></tr>';
                toolArray[i] = toolList[i].bkReportArticle.article;
            }
            $("#articleArea").html(toolHtml);
            $("#articleArea").on("click", ".detail", function(){
                let num = $(this).data("id");
                $("#editor").html(toolArray[num]);
            })
        }
    })
}
</script>




</body>
</html>
