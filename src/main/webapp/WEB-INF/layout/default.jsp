<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>FooDelicious</title>
<style type="text/css">
.img-fluid {
	width: 100%;
	height: 200px;
}

div.path {
	background-color: rgb(209, 203, 203);
}

#rowSelect {
	margin-top: 30px;
}

#mainDiv {
	margin-top: 30px;
	border: 1px black solid;
	padding: 20px;
	border-radius: 10px;
}

#passwordDiv {
	margin-bottom: 10px;
}

#loginSpan {
	color: red;
}

#registerMain {
	margin-top: 30px;
	border: 1px gray solid;
	padding: 20px;
	border-radius: 10px;
}
</style>

</head>

<body>
	<header class="py-3 mb-3 border-bottom">

		<nav
			class="container-fluid navbar navbar-expand-lg navbar-light bg-lightd-grid gap-3 align-items-center"
			style="grid-template-columns: 1fr 2fr;">
			<a class="navbar-brand" href="${contextRoot}/">好煮意</a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/">首頁</a></li>
					<li class="nav-item"><a class="nav-link" href="/Product">前往商城</a></li>
					<li class="nav-item"><a class="nav-link" href="/goShareArea">前往分享區</a></li>
					<li class="nav-item"><a class="nav-link" href="/postArticle">發表新文章</a></li>
					<li class="nav-item"><a class="nav-link" href="/customerService">客服中心</a></li>

				</ul>
			</div>
					
					<c:if test='${userName == null}'>
						<span>您好，請登入會員</span>
						<a class="text-dark" href="/LoginSystem">登入</a>
					</c:if>
					
					<c:if test='${userName != null}'>
						<span><img src="/img/${memberPic}" width="30" height="30" 
						style="border-radius: 50%; border: 2px solid black;"> 

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


	<div>
		<img src="${contextRoot}\img\top.jpg" class="img-fluid">
	</div>
	<!-- -fluid -->
	<!--設定div class container代表標題以下是由tiles管理排版  -->
	<div class="container" id="tilesContainer">
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
