<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<head>
<link rel="stylesheet" href="../../../css/backendProduct.css">

</head>
<body>
	<h1 class="tableName titleName2" style="margin-left:10px">
		問題回覆 <br> <span class="littleName">Problem Response</span>
	</h1>
	<div class="responseTable">
		<div style="margin: 10px">
			<h4>
				<strong>詳細問題內容:</strong>
			</h4>
			<textarea name="problem-content" rows="8" cols="70" placeholder=""
				id="problem-content" readonly style="background-color: #FFFFCE"></textarea>


		</div>

		<div style="margin: 10px">
			<h4>
				<strong>回覆:</strong>
			</h4>
			<textarea name="problem-response" rows="8" cols="70" placeholder=""
				id="problem-response"></textarea><br/>
				<span id="textareaError" style="color: red"></span>


		</div>

		<div style="margin-left: 250px;margin-bottom:10px">
			<input type="button" id="submitResponse"
				class="btn btn-outline-danger" value="submit">

		</div>
		<button type="button" onclick="autofill()">一鍵輸入</button>

	</div>



	<script>
		function autofill(){
			$('#problem-response').val("會馬上為您處理。請給2-3個小時的排除問題時間。")
		}
	
		//=============抓取另一頁傳來的資料=============
		let problemString = localStorage.getItem("problem");
		//將字串json化
		let problemData = JSON.parse(problemString);
		//填入資料
		$("#problem-content").val(problemData.problemContent);
		
		let problemId = problemData.problemId;
	</script>

	<script>
	  $("#submitResponse").on("click",function(){
	    	event.preventDefault();
	    
	    	if($("#problem-response").val() == ""){
	    		$("#textareaError").text("請填寫回覆內容");
	    		return;
	    	}
	    	else{
	    		let problemResponse = {
	    	        	"problemResponse":$("#problem-response").val(),
	    	        };
	    	        let responseString = JSON.stringify(problemResponse);
	    	        
	    	        $.ajax({
	    	        	url:"/companyProblemReport/response/"+problemId,
	    	        	type:"PUT",
	    	        	contentType:"application/json; charset=UTF-8",
	    	        	data: responseString,
	    	        	success:function(msg){
	    	        		alert(msg);
	    	        		setTimeout(function(){
	    	     				window.location.href="/backend/problemReport";
	    	     			},1000);
	    	        	}, error: function(){
	    	        		alert("問題回覆失敗。請重新再試一次。");
	    	        		setTimeout(function(){
	    	     				window.location.href="/companyMain";
	    	     			},1000);
	    	        	}
	    	        });
	
	    	   }

	  })
	</script>

</body>