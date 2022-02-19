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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>客服中心</title>
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

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: center;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

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
  <div class="row">
    <input type="submit" value="送出" style="height:50px;width:100px">
    <input type="button" value="清除" onclick="clearText();" style="height:50px;width:100px">
    <input type="submit" value="一鍵輸入" style="height:50px;width:100px">
  </div>
  </form>
</div>

</body>
</html>
