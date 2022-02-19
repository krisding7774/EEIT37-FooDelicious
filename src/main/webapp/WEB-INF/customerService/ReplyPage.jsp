<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客服回覆</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../css/backend.css">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../fontawesome/css/all.css">
<link
	href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap"
	rel="stylesheet">
<script src="../../js/jquery-3.6.0.min.js"></script>

<style>
* {
  box-sizing: border-box;
}

/* Style inputs */
input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

/* Style the container/contact section */
.container {
  border-radius: 5px;
  background-color: transparent;
  padding: 10px;
}

/* Create two columns that float next to eachother */
.column {
  float: left;
  width: 50%;
  margin-top: 6px;
  padding: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.column, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

/* ########################################### */
/*                 Global                      */
/* ########################################### */
html{

    font-family: 'Titillium Web', sans-serif;
    background-color:rgb(0,0,0);
    color:#FFFFFF;
}

h1{
    font-size:40px;
	font-weight: bolder;
	float:right;
	padding-right:330px;
}

.message-count {
	font-size:25px;
	font-weight: bolder;
	padding-left:780px;
}

/* Pagination for post*/

.pagination{
    padding: 20px;
    font-size: 15px;
}

.pagination a{
    color: #fff;
    margin-inline: 5px;
    padding: 5px 10px;
    border: solid 0.5px #fff;
}

.pagination a:hover{
    opacity: 0.5;
}

.note{
    background-color:#FFD966;
    padding: 20px;
    display: block;
}

.note span{
    font-size: 20px;
    margin-block: 5px;
}

.head{
    display: flex;
    background-color: #FFD966;
    padding: 5px;
    font-weight: bold;
    font-size: 15px;
}

.authors{
    flex: 20%;
}

.content{
    flex: 50%;
    font-size:24px;
    margin:15px;
}


.body{
    display: flex;
    background-color: #FFFFFF;
    box-shadow:2px 2px #979A9A;
    padding: 10px;
    margin-top: 5px;
    border-radius: 6px;
    border:1px solid #7B7D7D;
}

.body .authors .username{
    font-size: 20px;
}

.body .authors img{
    max-width: 50px;
    max-height: 80px;
}

.body .content .comment button{
    border:none;
    border-radius: 6px;
    margin: 5px;
    padding:12px 20px;
    font-color: #FFFFFF;
    font-weight: bold;
    cursor: pointer;
    float: right;
    background-color: #FDD835;
    height:60px;
    width:140px
}

.body .content .comment button:hover{
    background-color:#FFF176;
}

.body .content {
	position:float-right;
}
/* comment section */
.comment-area{
    margin-bottom:50px;
}

.comment-area textarea{
    width: 100%;
    min-height: 100px;
    padding: 10px;
    margin-block: 10px;
}

.comments-container {
	width:75%;
	position:relative;
}

.comment-area input{
    float: right;
    padding: 10px;
    border-radius: 10px;
    cursor: pointer;
}

.comment-area input:hover {
    border: solid 1px #000000;}

</style>

</head>
<body>
	<h1>問答紀錄(客服專用)</h1>
	<br />
	<br/>
		<div class="message-count">
        	共有：${cslist.size()}  筆資料
        </div>
    <br/>
		<select id='ptype' style="height:50px; width:980px; font-size:18px">
			<option value="" disabled selected hidden>請選擇類別</option>	
		    <option value="Orders">訂單問題</option>
		    <option value="ReturnMaintenance">退換貨/維修</option>
		    <option value="Member">會員相關</option>
		    <option value="RefundReceipt">退款/發票</option>
		    <option value="Other">其他</option>
		</select>
   
        <c:forEach var="message" items="${cslist}">
        <div class="comments-container">
            <div class="body">

                <div class="content">
                    
                        客戶姓名：${message.getCstm_name()}
                        <br />
                        問題類型：${message.getProblem_Type()}
                        <br />
                        <label>問題內容：${message.getProblem_Text()}</label>
                        <br />
                        留言時間：${message.getProblem_postTime()}
                    
                    <div class="comment">
                    	<input class="col-md-8" id="replyToCustomer${message.getId()}" placeholder="請在此輸入回應" required></input> 
                        <button class="col-md-2" onclick="replyMessage(${message.getId()})">提交回覆</button>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
        
	<script>
		function replyMessage(id){
			var data = {
				"Id" : id,
				"responseMessage" : $('#replyToCustomer'+id).val(),
			};
			
			var ajaxRequest = $.ajax({
				type : "POST",
				url : "/customerService/saveResponseMessage",
				dataType : "json",
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
			});
			
			ajaxRequest.done(function(response){
				if (response == true) {
					alert("成功");						
					self.location = "/customerService/reply/";
				} else {
					alert("失敗");
				}
			});
		}
		
		$('#ptype').change(function() {
			ptype = $('#ptype').val();
			
			self.location = "/customerService/reply/" + ptype;
		});
	</script>
	</body>
</html>
