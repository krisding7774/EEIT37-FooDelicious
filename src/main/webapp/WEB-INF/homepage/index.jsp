<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<link rel="stylesheet" href="../../css/app.css">
<link rel="stylesheet" href="../../css/index.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=The+Nautigal&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../../fontawesome/css/all.css">


<style>

* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

.contactBox {
	margin:28px 0 0 660px;
}

input[type=text], textarea {
	width: 100%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 0px;
	margin-bottom: 0px;
	resize: vertical;
}

label {
	padding-top: 0px;
	padding-bottom: 0px;
	display: inline-block;
	font-size: 20px;
	font-weight: bold;
}

input[type=button] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: center;
	margin: 15px;
	position: center;
}

input[type=reset] {
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: center;
	margin: 15px;
	position: center;
}

input[type=button]:hover {
	background-color: #45a049;
}

input[type=radio] {
	width: 20px;
	height: 20px;
}

.container {
	border-radius: 15px;
	padding: 40px;
	margin-top: 20px;
	margin-bottom: 20px;
	position: center;
}

.form {
	border-radius: 15px;
	padding: 40px;
	margin-top: 20px;
	margin-bottom: 20px;
	position: center;
}

.control-label {
	font-size: 22px;
}

.custom-control-label {
	font-weight: normal;
	padding: 0;
	margin: 0px 16px 0px 0px;
	font-size:18px;
}

.pagination {
	padding-left:72px;
}
h2 {
	font-weight: bold;
}

p {
	font-weight: bold;
	font-size: 22px;
}

/* Clear floats after the columns */
.form:after {
	content: "";
	display: table;
	clear: both;
}

</style>
<%--裝B大圖片--%>
<div class="topPhoto">
    <img class="headPho" src="../../img/hero01.png"/>
    <div class="textArea">
        <h1 class="textAreaTxt">We make food easy <br> and delicious</h1>
    </div>
    <img class="headPho" src="../../img/hero03.png"/>
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
<div class="footArea">
    <a href="#0" class="arrowTop"><i class="fas fa-arrow-alt-circle-up"></i></a>
    <div class="contactBox" >
    <br/>
    <br/>
		<h2>客服中心</h2>
		<p>請留下您的寶貴建議，我們會將盡速與您聯繫，謝謝您!</p>

	<button onclick="queryMessageHistory();" id="toMessageBoard"
		class="float-right"
		style="height: 42px; width: 130px; background-color: #B8DBFB; color: black; position: center; 
		border-radius: 4px; border: 1px solid #000000; font-weight: bold; font-size: 20px">查詢問答紀錄</button>

	<br />
	<br />
<!-- 	<form:form id="form1" class="form-horizontal" method="POST" -->
<!-- 		modelAttribute="customerService" autocomplete="on"> -->
		<form action="" name="customerInputPage">
		<!--  customerService是物件的型別-->
		<div class="form-group">
			<label class="control-label" for="name">姓名</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="name" name="name" minlength="2"
					placeholder="範例：王小明" style="font-size:20px" required>
			</div>

			<label class="control-label" for="email">聯絡Email</label>
			<div class="col-sm-8">
				<input type="email" class="form-control" id="email" name="email"
					placeholder="範例：littleming11@gmail.com" style="font-size:20px" required>
			</div>
		</div>
		<br>
		<div class="form-group">
			<label class="control-label" for="problemType">問題類別</label>

			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" id="customRadioInline1"
					name="customRadioInline1" class="custom-control-input"
					value="Orders"> 
				<label class="custom-control-label" for="customRadioInline1">訂單問題</label> 
				<input type="radio" id="customRadioInline2"
					name="customRadioInline1" class="custom-control-input" 
					value="ReturnMaintenance"> 
				<label class="custom-control-label" for="customRadioInline1">退換貨/維修</label>
				<input type="radio" id="customRadioInline3"
					name="customRadioInline1" class="custom-control-input"
					value="Member"> 
				<label class="custom-control-label" for="customRadioInline1">會員相關</label> 
				<input type="radio" id="customRadioInline4" name="customRadioInline1"
					class="custom-control-input" value="RefundReceipt"> 
				<label class="custom-control-label" for="customRadioInline1">退款/發票</label>
				<br/>
				<input type="radio" id="customRadioInline5"
					name="customRadioInline1" class="custom-control-input" value="Other"> 
				<label class="custom-control-label" for="customRadioInline1">其他</label>
			</div>
		</div>
		<br />

		<form:form>
			<div class="form-group">
				<label class="control-label" for="subject">反應事項</label>
				<div class="col-sm-8">
					<textarea id="subject" name="problemText"
						placeholder="請描述您的問題(限500字內)" rows="6" style="font-size:20px" required></textarea>
				</div>
			</div>
		</form:form>

		<br />
		<%-- 下方三個按鈕 --%>
		<div class="pagination">
			<input type="button" id="sendButton" value="送出" onclick="sendData();"
				style="height: 50px; width: 100px; background-color: #4CAF50; color: #fff; font-weight: bold; font-size:20px" required/>
			<input type="reset" value="清除" onclick="clearText();"
				style="height: 50px; width: 100px; background-color: #999999; color: #000000; font-weight: bold; font-size:20px" required/>
			<input type="button" value="一鍵輸入" onclick="enter();"
				style="height: 50px; width: 120px; background-color: #FFD966; color: #000000; font-weight: bold; font-size:20px" required/>
		</div>
<!-- 	</form:form> -->
	</form>
    </div>
    <br/>
    <br/>
  </div>
<footer>
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

//===================客服中心==================
		function enter() {
			$("#name").val("張君雅");
			$("#email").val("tastyfood@gmail.com");
			$("#subject").val("張君雅小妹妹，恁兜的泡麵已經煮好了，恁阿嬤限妳一分鐘內趕緊回去呷；哪嘸，到時麵若爛去，伊是概不負責!");
		}
		
		function clearText() {
			$("#name").val('');
			$("#email").val('');
			$("#subject").val('');
		}
		
		$(document).ready(function() {
			console.log("ready!");
			$("#sendButton").click(function(){
		        if($("#name").val()==""){
		            alert("您未填寫姓名");
		            eval("document.form1['name'].focus()");       
		        }else if($("#email").val()==""){
		            alert("您未填寫Email");
		            eval("document.form1['email'].focus()");    
		        }else if($("#customRadioInline1").val()=="" || $("#customRadioInline2").val()=="" || $("#customRadioInline3").val()=="" || $("#customRadioInline4").val()=="" || $("#customRadioInline5").val()==""){
		            alert("您未選擇類別");
		            eval("document.form1['customRadioInline1'].focus()");       
		        }else if($("#subject").val()==""){
		            alert("您未填寫內容");
		            eval("document.form1['subject'].focus()");       
		        }else{
		            document.form1.submitData();
		        }
			});
		});
		
		function sendData() {
				var ele = document.getElementsByName('customRadioInline1');
				var checkedRadio = ''; 
				for (i = 0; i < ele.length; i++) {
					if (ele[i].checked) {
						checkedRadio = ele[i].value;	
					}
				}
							
			var submitData = {
				"Id" : "",
				"cstm_name" : $("#name").val(),
				"cstm_email" : $("#email").val(),
				"problem_Type" : checkedRadio,
				"problem_Text" : $("#subject").val(),

			};

			var ajaxRequest = $.ajax({
				type : "POST",
				url : "/customerService/add",
				dataType : "json",
				data : JSON.stringify(submitData), //formdata1 + '&' + formdata2
				contentType : "application/json;charset=utf-8",
			// 				async : false,
			// 				cache : false,
			// 				contentType : false,
			// 				processData : false,
			});
			
			ajaxRequest.done(function(response){
				if (response == true) {
					alert("送出成功");						
					self.location = "/";
				} else {
					alert("送出失敗，請重新輸入");
				}
			});
		}

		function queryMessageHistory(){
			var email = $("#email").val();
			location.href = "/customerService/query/" + email;
// 			var queryData = {
// 					"email" : email,
// 				};
			
// 			var ajaxRequest2 = $.ajax({
// 				type : "POST",
// 				url : "/customerService/query",
// 				dataType : "json",
// 				data : JSON.stringify(queryData), //formdata1 + '&' + formdata2
// 				contentType : "application/json;charset=utf-8",
// 			// 				async : false,
// 			// 				cache : false,
// 			// 				contentType : false,
// 			// 				processData : false,
// 			});
			
// 			ajaxRequest2.done(function(response){
// 				console.log("post ok");
// 				console.log(response);
		
// 				$(document.body).text(response);
// 			});
		}

</script>

<script>

//====================嘗試用表單驗證

    // Document is ready
// $(document).ready(function () {
	
// Validate Username
// 	$('#usercheck').hide();
// 	let usernameError = true;
// 	$('#usernames').keyup(function () {
// 		validateUsername();
// 	});
	
// 	function validateUsername() {
// 	let usernameValue = $('#usernames').val();
// 	if (usernameValue.length == '') {
// 	$('#usercheck').show();
// 		usernameError = false;
// 		return false;
// 	}
// 	else if((usernameValue.length < 3)||
// 			(usernameValue.length > 10)) {
// 		$('#usercheck').show();
// 		$('#usercheck').html
// ("**length of username must be between 3 and 10");
// 		usernameError = false;
// 		return false;
// 	}
// 	else {
// 		$('#usercheck').hide();
// 	}
// 	}

// Validate Email
// 	const email =
// 		document.getElementById('email');
// 	email.addEventListener('blur', ()=>{
// 	let regex =
// /^([_\-\.0-9a-zA-Z]+)@([_\-\.0-9a-zA-Z]+)\.([a-zA-Z]){2,7}$/;
// 	let s = email.value;
// 	if(regex.test(s)){
// 		email.classList.remove(
// 				'is-invalid');
// 		emailError = true;
// 		}
// 		else{
// 			email.classList.add(
// 				'is-invalid');
// 			emailError = false;
// 		}
// 	})

		
// Submit button
// 	$('#submitbtn').click(function () {
// 		validateUsername();
// 		validatePassword();
// 		validateConfirmPassword();
// 		validateEmail();
// 		if ((usernameError == true) &&
// 			(passwordError == true) &&
// 			(confirmPasswordError == true) &&
// 			(emailError == true)) {
// 			return true;
// 		} else {
// 			return false;
// 		}
// 	});
// });
   	
//================
    
// }



</script>


</body>
</html>
