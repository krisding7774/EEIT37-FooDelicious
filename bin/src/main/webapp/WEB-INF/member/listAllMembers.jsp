<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage='true'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	function delfun(memberId, memberName) {
		if (confirm("確定刪除此筆紀錄(會員姓名: " + memberName + ") ?")) {
			var form = document.forms[0];
			form.action = "<c:url value='/members/' />" + memberId;
			form.submit();
		}

	}
</script>

<link rel='stylesheet' href="<c:url value='/css/styles.css' />"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顯示所有會員</title>
</head>
<body>
	<div align="center">
	<h3>會員清單</h3>
	<hr>

	<p>
		   <c:if test='${empty membersForJSP}'>
				查無會員資料<br>
		  </c:if> 
	   <c:forEach var="member"  varStatus="statusX" items="${membersForJSP}">
	      <c:if test="${statusX.first}" >
	         <c:out value="<table border='1' cellspacing='5' cellpadding='5' >" escapeXml="false"/>

	         <c:out value="<tr bgcolor='#CA8EC2'><th>員編</th><th>帳號</th><th>密碼</th><th>姓名</th><th>性別</th><th>生日</th><th>電話</th><th>地址</th><th>折扣</th><th>幣</th><th>身分別</th><th>註冊時間</th><th>刪除</th></tr>" escapeXml='false'/>
	      </c:if>		         
	      <c:choose>
	         <c:when test="${ statusX.count % 2 == 0 }">
	            <c:set var="colorVar" value="#F1E1FF" />
	         </c:when>
	         <c:otherwise>
	            <c:set var="colorVar" value="#FFFFFF" />
	         </c:otherwise>
	      </c:choose>

	        <tr bgcolor="${colorVar}">
	            <td><a href="<c:url value='/updatePage' />?MemberId=${member.memberId}">${member.memberId}</a></td>
	            <td>${member.memberMail} </td>
	            <td>${member.pwd} </td>
	            <td>${member.memberName}</td>
	            <td>${member.memberGender}</td>
	            <td>${member.memberBirth}</td>
	            <td>${member.memberPhone}</td>
	            <td>${member.memberAddress} </td>
	            <td>${member.memberDiscountId} </td>
	            <td>${member.memberCoin} </td>
	            <td>${member.member_status} </td>
	            <td>${member.register_date} </td>
	            <td><button id="delbtn" onclick="delfun('${member.memberId}', '${member.memberName}')">刪除</button></td>
	        </tr>
	        <c:if test="${statusX.last}" >
	             <c:out value="</table>" escapeXml="false" />
	        </c:if>		                      
		</c:forEach>
	</div>
	<p>
	<div class='center'>
	<hr>
	<small><a href="<c:url value='/' />">回首頁</a></small>
	</div>
	<form method='POST'>
	  <input type='hidden' name='_method'  value='DELETE' >
	</form>
</body>
</html>