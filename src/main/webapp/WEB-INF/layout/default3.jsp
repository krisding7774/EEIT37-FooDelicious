<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Kosugi+Maru&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../../css/default3.css">
<meta charset="UTF-8">
<title>FooDelicious</title>
</head>

<body>
	<header id="0" class="border-bottom navArea">
		<nav class="container-fluid navbar fixed-top navbar-expand-lg navbar-light bg-lightd-grid gap-3 align-items-center navArea"
			style="grid-template-columns: 1fr 2fr;">
			<a class="navbar-brand textCon item" href="${contextRoot}/">好煮意</a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item item"><a class="nav-link textCon"
						aria-current="page" href="/" style="color: black">首頁</a></li>
					<li class="nav-item item"><a class="nav-link textCon" href="/#bestSeller" style="color: black">暢銷商品</a></li>
					<li class="nav-item item"><a class="nav-link textCon" href="/#hotTopics" style="color: black">熱門文章</a></li>
					<li class="nav-item item"><a class="nav-link textCon" href="/Product" style="color: black">前往商城</a></li>
					<li class="nav-item item"><a class="nav-link textCon" href="/goShareArea" style="color: black">前往分享區</a></li>
					<li class="nav-item item"><a class="nav-link textCon" href="/#contactBox" style="color: black">客服中心</a></li>
					<li class="nav-item item"><a class="nav-link textCon" href="/shoppingCart" style="color: black"><svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-shopping-cart">
								<circle cx="9" cy="21" r="1"></circle>
								<circle cx="20" cy="21" r="1"></circle>	<path
									d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg></a></li>
				</ul>
			</div>
					
					<c:if test='${userName == null}'>
						<span>您好，請登入會員</span>
						<a class="text-dark" href="/LoginSystem">登入</a>
					</c:if>
					
					<c:if test='${userName != null}'>
						<span><img class="memberPic" src="/img/${memberPic}">

						&ensp;${userName}&ensp;</span>
						<a class="text-dark" href="/normallogout">登出</a>
					</c:if>
					
					<div class="d-flex align-items-center">
				<div class="flex-shrink-0 dropstart">
					<a href="/memberIndex">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16"
							class="rounded-circle"><path
								d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
											</svg></a>
                                <!-- 					<ul class="dropdown-menu text-large shadow" -->
                                <!-- 						aria-labelledby="dropdownUser2"> -->
                                <!-- 						<li><a class="dropdown-item" -->
                                <%-- 							href="${contextRoot}/LoginSystem">會員登入</a></li> --%>
                                    <!-- 						<li><a class="dropdown-item" -->
                                    <%-- 							href="${contextRoot}/RegisterPage">會員註冊</a></li> --%>
                                        <!-- 						<li><a class="dropdown-item" -->
                                        <%-- 							href="${contextRoot}/listAllMembers">修改會員資料(暫放)</a></li> --%>
                                            <!-- 						<li> -->
                                            <!-- 							<hr class="dropdown-divider"> -->
                                            <!-- 						</li> -->
                                            <!-- 						<li><a class="dropdown-item" href="normallogout">會員登出</a></li> -->
                                            <!-- 					</ul> -->
                            </div>
						</div>
		</nav>
	</header>
	<!--設定div class container代表標題以下是由tiles管理排版  -->
	<div class="" id="tilesContainer">
		<tiles:insertAttribute name="content" />
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.min.js"></script>
</body>

</html>