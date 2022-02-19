<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>好煮意後台管理系統</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/backend.css">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../fontawesome/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap" rel="stylesheet">
    <script src="../../js/jquery-3.6.0.min.js"></script>
</head>
<body >
<div class="col-fixed topBrand ">
    <b class="align-middle brand">後台管理系統</b>
</div>

<div class="row">
    <div class="navbar col-md-12 rightBrand justify-content-end">
        <ul class="nav nav-pills ">
            <li class="nav-item">
                <a class="nav-link text-white" href="/"><i class="fas fa-utensils fork"></i></a>
            </li>
        </ul>
    </div>
</div>

<div class="col-fixed leftBar">
    <!-- 左上登入帳號資訊小圖 -->
    <div class="photoArea">
        <!-- 左上登入帳號照片 -->
        <img src="${pageContext.request.contextPath}/img/wellcook.jpg" class="photo">
        <span class="brandName align-middle">好煮意</span>
    </div>

    <ul class="list-group list-group-flush functionBar">

        <!-- 會員列表 -->
        <li id="member" class="list-group-item funName">
            <a href="/backend/member" style="text-decoration: none">
                <i class="text-secondary far fa-address-card"></i>
                <span class="listName">會員管理</span>
            </a>
        </li>


        <!-- 商品管理 -->
        <li id="ProductList" class="list-group-item funName">
            <a href="/backend/product" style="text-decoration: none">
                <i class="text-secondary fas fa-archive"></i>
                <span class="listName">商品管理</span>
            </a>
        </li>

        <!-- 商品新增 -->
        <li id="ProductAdd" class="list-group-item funName">
            <a href="/backend/productAdd" style="text-decoration: none">
                <i class="text-secondary fas fa-gift"></i>
                <span class="listName">增加商品</span>
            </a>
        </li>



        <!-- 訂單管理 -->
        <li id="OrderList" class="list-group-item">
            <a href="/backend/order" style="text-decoration: none">
                <i class="text-secondary fas fa-shopping-cart"></i>
                <span class="listName">訂單管理</span>
            </a>
        </li>


        <!-- 文章管理 -->
        <li id="ArticleList" class="list-group-item funName">
            <a href="/backend/article" style="text-decoration: none">
                <i class="text-secondary fas fa-scroll"></i>
                <span class="listName">文章管理</span>
            </a>
        </li>


        <!-- 分析報表 -->
        <li class="list-group-item">
            <button class="btn btnBor" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                <i class="text-secondary fas fa-chart-bar"></i>
                <span class="listName">分析報表</span>
                <div class="collapse ulArea" id="collapseExample">
                    <ul id="collapseOne" class="accordion-collapse collapse show">
                        <li id="AgeDistribution" class="colLi funName">
                            <a class="colLi" href="/backend/report/age" style="text-decoration: none">
                                <i class="fa fa-circle-o"></i>
                                <span class="listName">年齡層分析</span>
                            </a>
                        </li>
                        <li id="1" class="colLi">
                            <a class="colLi" href="/backend/report/product" style="text-decoration: none">
                                <i class="fa fa-circle-o"></i>
                                <span class="listName">暢銷商品</span>
                            </a>
                        </li>
                        <li id="ArticleTop10" class="colLi funName">
                            <a class="colLi" href="/backend/report/article" style="text-decoration: none">
                                <i class="fa fa-circle-o"></i>
                                <span class="listName">熱門文章</span>
                            </a>
                        </li>
                        <li id="cartLi" class="colLi">
                            <a class="colLi" href="/backend/report/cart" style="text-decoration: none">
                                <i class="fa fa-circle-o"></i>
                                <span class="listName">猶豫商品</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </button>
        </li>


        <!-- 管理員名單 -->
        <li id="AdminList" class="list-group-item funName">
            <a href="/backend/manager" style="text-decoration: none">
                <i class="text-secondary fas fa-crown"></i> <span class="listName">管理名單</span>
            </a>
        </li>

        <!-- 問題回報 -->
        <li id="QuestList" class="list-group-item funName">
            <a href="/backend/problemReport" style="text-decoration: none">
                <i class="text-secondary fas fa-question-circle"></i> <span class="listName">問題回報</span>
            </a>
        </li>
    </ul>
</div>



<!-- 這裡是右邊的區塊 -->
<div class="row">
    <div class="col-md-12 rightArea">
        <tiles:insertAttribute name="content" />
    </div>
</div>

<script src="../../js/bootstrap.min.js"></script>
</body>
</html>

