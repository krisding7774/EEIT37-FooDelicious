<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<head>
    <link rel="stylesheet" href="../../../css/backendReportArticle.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
</head>
<body>
<h1 class="tableName titleName2">
    熱門文章
    <br>
    <span class="littleName">Popular Articles</span>
</h1>
<div class="foodArea">
    <p class="textName"><i class="fas fa-hamburger"></i>食譜分享</p>
    <div class="col-sm-12 report2">
        <h2>食譜類 Top 5</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col" class="table-danger">名次</th>
                <th scope="col" class="table-danger">文章編號</th>
                <th scope="col" class="table-danger">文章標題</th>
                <th scope="col" class="table-danger">作者</th>
                <th scope="col" class="table-danger">瀏覽數</th>
                <th scope="col" class="table-danger">發文日期</th>
            </tr>
            </thead>
            <tbody id="foodList">
            </tbody>
        </table>
    </div>
</div>

<div class="toolArea">
    <p class="textName"><i class="fas fa-utensils"></i>廚具開箱</p>

    <div class="col-sm-12 report2">
        <h2>廚具類 Top 5</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col" class="table-secondary">名次</th>
                <th scope="col" class="table-secondary">文章編號</th>
                <th scope="col" class="table-secondary">文章標題</th>
                <th scope="col" class="table-secondary">作者</th>
                <th scope="col" class="table-secondary">瀏覽數</th>
                <th scope="col" class="table-secondary">發文日期</th>
            </tr>
            </thead>
            <tbody id="toolList">
            </tbody>
        </table>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="foodDrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">文章內容</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="content" class="textArea" style="border: 0px;">
                    <div id="editor"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    //=========食材區=========

    $.ajax({
        url:"/report/article/food",
        type: "GET",
        success: function(foods){
            let foodList = foods;
            let foodArray = new Array();
            //=========統計數據=========
            let foodHtml="";
            for(let i=0; i<foods.length; i++){
                foodHtml +='<tr><th scope="row">'+(i+1)+'</th>';
                foodHtml += '<td>'+foodList[i].shareId+'</td>';
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
            $("#foodList").html(foodHtml);
            $("#foodList").on("click", ".detail", function(){
                let num = $(this).data("id");
                $("#editor").html(foodArray[num]);
            })
        }
    })



    //=========餐廚區=========
    $.ajax({
        url:"/report/article/tool",
        type: "GET",
        success: function(tools){
            let toolList = tools;
            let toolArray = new Array();
            //=========統計數據=========
            let toolHtml="";
            for(let i=0; i<tools.length; i++){
                toolHtml +='<tr><th scope="row">'+(i+1)+'</th>';
                toolHtml += '<td>'+toolList[i].shareId+'</td>';
                let nameObj = new String(toolList[i].article_title);
                let nameString = nameObj.substring(0,20);
                toolHtml += '<td><a class="detail" href="" data-bs-toggle="modal" data-bs-target="#foodDrop" data-id='+i+'>'+nameString+'</a></td>';
                toolHtml += '<td>'+toolList[i].bkMember.memberName+'</td>';
                toolHtml += '<td>'+toolList[i].viewNum+'</td>';
                let newDate = new Date(toolList[i].postTime);
                let register = newDate.toLocaleString();
                toolHtml += '<td>'+register+'</td></tr>';
                toolArray[i] = toolList[i].bkReportArticle.article;
            }
            $("#toolList").html(toolHtml);
            $("#toolList").on("click", ".detail", function(){
                let num = $(this).data("id");
                $("#editor").html(toolArray[num]);
            })
        }
    })
</script>

</body>
</html>
