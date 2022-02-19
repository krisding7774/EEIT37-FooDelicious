<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<head>
<link rel="stylesheet" href="../../../css/backendProduct.css">
</head>
<body>
	<div>
		<h1 class="tableName titleName2">
			問題回報 <br> <span class="littleName">Problem Report</span>
		</h1>

		<section class="content">
			<div class="col-xs-12">
				<table id="" class='table table-striped table-hover'
					style="text-align: center">
					<thead>
						<tr>
							<th class="col table-success">問題編號</th>
							<th class="col table-success">問題類別</th>
							<th class="col table-success">問題內容</th>
							<th class="col table-success">新增日期</th>
							<th class="col table-success">問題狀態</th>
							<th class="col table-success">廠商名稱</th>
							<th class="col table-success">更新</th>
							<th class="col table-success">取消</th>
						</tr>
					</thead>
					<tbody>
						<form>
							<tr>
								<td class='align-middle'><input
									class="upInput readonly text-middle upInputSm" type="text"
									value="" readonly id="problemId"></td>

								<td class='align-middle'><input class="upInput upInputMd" readonly
									type="text" value="" id="problemCategory"></td>

								<td class='align-middle'><input class="upInputBig" readonly
									type="text" value="" id="problemContent"></td>

								<td class='align-middle'><input class="upInputSm" readonly
									type="text" value="" id="problemSubmitDate"></td>

								<td class='align-middle'><select id="problemStatus"
									class="form-select upInput text-middle upInputMd">
										<option value="" id="status" selected hidden></option>
										<option value="0">處理中</option>
										<option value="1">完成</option>
								</select></td>

								<td class='align-middle'><input class="upInputSm" readonly
									type="text" value="" id="companyName"></td>

								<td class="align-middle"><input id="updateBtn"
									class="btn btn-outline-primary" type="button" value="更新">
								</td>
								<td class=""><input id="cancelBtn"
									class="btn btn-outline-danger" type="button" value="取消"
									onclick="cancel()"></td>
							</tr>
						</form>
					</tbody>
				</table>
			</div>
		</section>
		
	</div>
	<script>
		//=============抓取另一頁傳來的資料=============
		let problemString = localStorage.getItem("problemData")
		//將字串json化
		let problemData = JSON.parse(problemString);
		//填入資料
		$("#problemId").val(problemData.problemId);
		//轉換數字成中文
		let category = problemData.problemCategory;
		let type = "";
		switch (category) {
		case 0:
			type = "商品";
			break;
		case 1:
			type = "訂單";
			break;
		case 2:
			type = "系統";
			break;
		case 3:
			type = "會員";
			break;
		case 4:
			type = "其他";
			break;

		}

		$("#problemCategory").val(type);
		$("#problemContent").val(problemData.problemContent);

		let newDate = new Date(problemData.problemSubmitDate);
		let register = newDate.toLocaleString();
		$("#problemSubmitDate").val(register);
		let status = problemData.problemStatus;
		let sta = "";
		if (status == "unresolved") {
			sta = 0;
			status = "處理中";
		} else {
			sta = 1;
			status = "完成";
		}
		$("#status").val(sta);
		$("#status").text(status);

		$("#companyName").val(problemData.companyName);
	</script>

	<script>
		//=============跳回首頁=============
		function cancel() {
			window.location.href = "/backend/problemReport";
		}
	</script>

	<script>
		//=============更新資料=============
		$("#updateBtn").on("click", function() {
			let problemId = $("#problemId").val();
			//alert(problemId);
			let getStatus =  $("#problemStatus").val();
			let updatedStatus = "";
			if(getStatus == 0){
				updatedStatus = "unresolved";
			}else{
				updatedStatus = "resolved";
			}
			let problemObject = {

				"problemStatus" : updatedStatus,

			};
			
			//alert(updatedStatus);
 			let problemString = JSON.stringify(problemObject);
 			
 			//alert(problemString);

			$.ajax({
				url : "/companyProblems/update/"+ problemId,
				type : "PUT",
				contentType : 'application/json; charset=UTF-8',
				data : problemString,
				success : function(msg) {
					alert(msg);
					window.location.href = "/backend/problemReport";
				},
			})
		})
	</script>






</body>