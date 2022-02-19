<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html>

<html lang="zh-TW">
<head>
<meta charset="UTF-8">

<!--<title> Drop Down Sidebar Menu | CodingLab </title>-->
<link rel="stylesheet" href="../../css/Test.css">

<!-- Boxiocns CDN Link -->
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link
	href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap"
	rel="stylesheet">

<link href="../../css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>



<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="sidebar close">
		<div class="logo-details"></div>
		<ul class="nav-links">
			<li><a href="/companyMain"> <i class='bx bx-user-circle'></i>
					<span class="link_name">管理</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="/companyMain">管理</a></li>
				</ul></li>
			<li>
				<div class="iocn-link">
					<a href="/companyProduct"> <i class='bx bx-cart'></i> <span
						class="link_name">商品管理</span>
					</a> <i class='bx bxs-chevron-down arrow'></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="/companyProduct">商品管理</a></li>
					<li><a href="/companyProduct">所有商品</a></li>
					<li><a href="/companyProductsAdd">新增商品</a></li>

				</ul>
			</li>
			<li>
				<div class="iocn-link">
					<a href="/companyOrder"> <i class='bx bx-book-alt'></i> <span
						class="link_name">訂單管理</span>
					</a> <i class='bx bxs-chevron-down arrow'></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="/companyOrder">訂單管理</a></li>
					<li><a href="/companyOrder">所有訂單</a></li>
					
				</ul>
			</li>
			<li>
				<div class="iocn-link">
					<a href="#"> <i class='bx bx-bar-chart-alt-2'></i> <span
						class="link_name">分析報表</span>
					</a> <i class='bx bxs-chevron-down arrow'></i>
				</div>
				<ul class="sub-menu">
					<li><a class="link_name" href="#">分析報表</a></li>
					<li><a href="/companyBestSeller">暢銷商品</a></li>
					
				</ul>
			</li>
			<li><a href="#" class="problem"> <i class='bx bx-error-alt'></i>
					<span class="link_name">問題回報</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="problem" href="#">問題回報</a></li>
				</ul></li>

<!-- 			<li><a href="#"> <i class='bx bxs-inbox'></i> <span -->
<!-- 					class="link_name">訊息</span> -->
<!-- 			</a> -->
<!-- 				<ul class="sub-menu blank"> -->
<!-- 					<li><a class="link_name" href="#">訊息</a></li> -->
<!-- 				</ul></li> -->
<!-- 			<li> -->
				<div class="profile-details">

					<div class="profile-content">

						<i style="cursor:pointer" class='bx bxs-log-out' id="logoutButton"
							onclick="logout('${account}')"></i>
					</div>


				</div>
			</li>
		</ul>
	</div>
	<section class="home-section">
		<div class="home-content">
			<i class='bx bx-menu' style="color: black"></i> <span
				class="text brandName" style="color: black">好煮意<small
				style="color: black">admin</small></span>
			<a href="/" style="margin-left:82%;font-size:30px;color:black;margin-top:4px"><i class='bx bx-home-alt'></i></a>
		</div>
	</section>

	<section class="main-section">
		<tiles:insertAttribute name="content" />

	</section>

	<!-- 問題回報地跳出視窗 -->

	<div class="popup-modal">
		<div class="popup-modal-contents">

			<div class="popup-closing">+</div>

			<div>
				<h3 style="text-align: center">
					<strong>問題回報</strong>
				</h3>
				<form style="text-align: left; margin: 5px" id="problemform">
					<h6 style="margin: 5px">問題類型:</h6>
					<select id="problemsCat"
						class="form-select upInput text-middle upInputMd"
						style="width: 20%">
						<option value="" id="probStatus" selected></option>
						<option value="0">商品</option>
						<option value="1">訂單</option>
						<option value="2">系統</option>
						<option value="3">會員</option>
						<option value="4">其他</option>
					</select>

					<h6 style="margin: 5px; margin-top: 10px;">問題描述:</h6>
					<textarea name="problem-content" rows="8" cols="70"
						placeholder="請詳細描述問題:" id="problem-content" form="problemform"></textarea>
					</br>
					<span id="textareaError" style="color: red"></span>

					<!-- 					 <span style="margin:4px;margin-top:10px;margin-bottom:10px">檔案上傳:</span> </br> -->
					<!-- 					 <input type="file" id="fileUpload" accept="application/msword"> -->

					</br>
					</br>
					</br>
					</br>
					</br>
					</br>
					</br>
					<c:set var="userID" value="${userID}" />
					<input type="text" hidden id="companyId" value='${userID}'>
					<input type="text" hidden id="companyName" value='${userName}'>
					<input type="button" id="submitComplete"
						class="btn btn-outline-danger" value="submit">
				</form>
			<button type="button" onclick="autofill()">一鍵輸入</button>
			</div>

		</div>
	</div>
	


	<script>
	
	function autofill(){
		$('#problem-content').val("商品下架有問題，需要緊急處理因為商品庫存不夠無法應付需求。")
		$('#problemsCat').val("0")
	}
//     =============傳送問題回報資料=============
    	<!-- 確認問題回報單沒有空白 -->
    $("#submitComplete").on("click",function(){
    	event.preventDefault();
    	let now = new Date();
    	let companyId = $("#companyId").val();
    	if($("#problem-content").val() == ""){
    		$("#textareaError").text("請詳述問題內容");
    		return;
    	}
    	else{
    		let problemReport = {
    	        	"companyId":$("#companyId").val(),
    	        	"companyName": $("#companyName").val(),
    	            "problemCategory": $("#problemsCat").val(),
    	            "problemContent": $("#problem-content").val(),
    	            "problemStatus": "unresolved",
    	          
    	        };
    	        let problemString = JSON.stringify(problemReport);
    	        
    	        $.ajax({
    	        	url:"/companyProblemReport/"+companyId,
    	        	type:"PUT",
    	        	contentType:"application/json; charset=UTF-8",
    	        	data: problemString,
    	        	success:function(msg){
    	        		alert(msg);
    	        		setTimeout(function(){
    	     				window.location.href="/companyMain";
    	     			},1000);
    	        	}, error: function(){
    	        		alert("fail");
    	        		setTimeout(function(){
    	     				window.location.href="/companyMain";
    	     			},1000);
    	        	}
    	        })
    	        
    		
    		
    		
    	}
    	
        

  })
</script>



	<!-- 登出 -->
	<script>
		function logout(account) {

			if (confirm("確定要登出嗎") == true) {
				window.location.href="/logout";
			}
		}
	</script>

	<!-- 問題回報跳出視窗 -->
	<script>
				
		document.querySelector('.problem').addEventListener("click", function() {
			document.querySelector('.popup-modal').style.display = "flex";
		});

		document.querySelector('.popup-closing').addEventListener("click", function() {
			document.querySelector('.popup-modal').style.display = "none";
		});
	</script>


	<script>
  let arrow = document.querySelectorAll(".arrow");
  for (var i = 0; i < arrow.length; i++) {
    arrow[i].addEventListener("click", (e)=>{
   let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
   arrowParent.classList.toggle("showMenu");
    });
  }
  let sidebar = document.querySelector(".sidebar");
  let sidebarBtn = document.querySelector(".bx-menu");
  console.log(sidebarBtn);
  sidebarBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("close");
  });
  </script>
</body>
</html>