<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<body>
	<h1 class="tableName titleName2">
		訂單列表<span class="smallFont">Order List</span><span id="date"
			class="smallFont2"></span>
	</h1>
	<div class="searchArea">
		<input class="keyWord keyWord1 searchBox" type="text"
			name="accKeyWord" placeholder="請輸入訂單編號.."> <input
			id="searchAcc" class="keyWord btn btn-outline-secondary searchBox2 "
			type="button" value="查詢" />
	</div>
	<ul id="selectPage" class="nav nav-tabs">
		<li class="nav-item"><a id="all" class="nav-link active"
			aria-current="page" href="#">全部訂單</a></li>
		<li class="nav-item"><a id="todayOrders" class="nav-link active"
			aria-current="page" href="#">今日訂單</a></li>
	</ul>
	<section class="content">
		<div class="col-xs-12">
			<table id="" class='table table-striped table-hover'
				style="text-align: center">
				<thead>
					<tr>
						<th class="col table-warning smalW">訂單編號</th>
						<th class="col table-warning midW">會員帳號</th>
						<th class="col table-warning smalW">收件人姓名</th>
						<th class="col table-warning smalW">收件人電話</th>
						<th class="col table-warning large">收件人地址</th>
						<th class="col table-warning large">購買商品</th>
						<th class="col table-warning large">商品編號</th>
						<th class="col table-warning large">購買數量</th>
						<th class="col table-warning smalW">訂單金額</th>
						<th class="col table-warning midW">下單日期</th>

					</tr>
				</thead>
				<tbody id="orders"></tbody>
			</table>
			<nav aria-label="Page navigation example ">
				<ul id="page" class="pagination justify-content-center"></ul>
			</nav>


		</div>
		<input type="text" hidden id="companyId" value='${userID}'>
	</section>



	<script>
	var today = new Date();
	var month = today.getMonth()+1;
	var monthString;
	switch (month){
		case 1:
			monthString = "Jan";
			break;
		case 2:
			monthString = "Feb";
			break;
		case 3:
			monthString = "Mar";
			break;
		case 4:
			monthString = "Apr";
			break;
		case 5:
			monthString = "May";
			break;
		case 6:
			monthString = "Jun";
			break;
		case 7:
			monthString = "July";
			break;
		case 8:
			monthString = "Aug";
			break;
		case 9:
			monthString = "Sep";
			break;
		case 10:
			monthString = "Oct";
			break;
		case 11:
			monthString = "Nov";
			break;
		case 12:
			monthString = "Dec";
			break;
	}
// 	var today = monthString+" "+today.getDate()+", "+today.getFullYear();
// 	var todayFormat = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();

		//=============顯示所有商品資料=============

		let companyId = $("#companyId").val();
		
		let allFoundCompanyOrders = new Array();
		let allOrderDetailsLength;
		let allOrderIds = new Array();
		let allOrderIdsUnique = allOrderIds.filter((element, index, array) => array.indexOf(element) === index);
		

		window.onload = function() {
			$.ajax({
				url : "/companyOrderDetails",
				type : "GET",
				success : function(allCompanyOrderDetails) {
					//alert("here")
					allFoundCompanyOrders.length=0;
					let totalOrders = allCompanyOrderDetails.length;
					
					for (let j = 0; j < totalOrders; j++) {
						if (allCompanyOrderDetails[j].product.productCompanyId == companyId) {
							allFoundCompanyOrders.push(allCompanyOrderDetails[j]);
							allOrderIds.push(allCompanyOrderDetails[j].ordersId)
						
						}
					}
					allOrderDetailsLength = allFoundCompanyOrders.length;
					//alert(allOrderDetailsLength);
					
					if (allOrderDetailsLength >= 10) {
						pages(10, allFoundCompanyOrders);
					} else {
						pages(allOrderDetailsLength, allFoundCompanyOrders);
					}
				}
			});
		}

	//=========顯示今天日期======================
 	today = monthString+" "+today.getDate()+", "+today.getFullYear();
	$("#date").text(today);

    //=============顯示分頁設定=============
    //=============全部訂單=============

    let todayOrder = new Array();

    let urlString = "";
    $("#all").on("click",function(){
        $("#selectPage a").prop("class","nav-link");
        $("#all").prop("class","nav-link active");
        
        if(allOrderDetailsLength >= 10){
				pages(10, allFoundCompanyOrders);
			} else {
				pages(allOrderDetailsLength, allFoundCompanyOrders);
			}
		})

		//=============完成=============
		$("#todayOrders").on("click",function() {
					$("#selectPage a").prop("class", "nav-link");
					$("#todayOrders").prop("class", "nav-link active");
					
					//清空畫面
					todayOrder.length = 0;
					
					let todayDate = new Date();
					let month = todayDate.getMonth() + 1;
					if (month < 10) {
						month = "0" + month;
					}
					let todays = todayDate.getFullYear() + '-' + month + '-' + todayDate.getDate();
					//alert(todays)
					for (let k = 0; k < allOrderDetailsLength; k++) {

						let date = allFoundCompanyOrders[k].ordersBean.ordersDate;

						let sub = date.substring(0, 10);
						//alert(sub);
						if (Object.is(sub, todays)) {
							
							//alert(allOrders[k].ordersDetailId)
							todayOrder.push(allFoundCompanyOrders[k]);
						}
					}
					let size = todayOrder.length;
					//alert(size)

					if (size >= 10) {
						pages(10, todayOrder);
					} else {
						pages(size, todayOrder);
					}

				})
	</script>

	<script>
    //=============訂單編號查詢功能=============
    $("#searchAcc").on("click",function(){
    	
       let searchOrder = new Array();	
       let orderId = $(".searchBox").val();
       
       let txt;
       for(let k = 0; k < allOrderDetailsLength; k++){
    	   
		   if(allFoundCompanyOrders[k].ordersId == orderId){
			   txt += "<tr>";
               txt += "<td class='align-middle'>"+allFoundCompanyOrders[k].ordersId+"</td>"
               txt += "<td class='align-middle'>"+allFoundCompanyOrders[k].ordersBean.member.memberMail+"</td>"
               txt += "<td class='align-middle'>"+allFoundCompanyOrders[k].ordersBean.ordersName+"</td>"
               txt += "<td class='align-middle'>"+allFoundCompanyOrders[k].ordersBean.ordersPhone+"</td>"
               txt += "<td class='align-middle'>"+allFoundCompanyOrders[k].ordersBean.ordersAddress+"</td>"
               txt += "<td class='align-middle'>"+allFoundCompanyOrders[k].product.productName+"</td>"
               txt += "<td class='align-middle'>"+allFoundCompanyOrders[k].product.productId+"</td>"
               
               let quantity = allFoundCompanyOrders[k].quantity;
               txt += "<td class='align-middle'>"+quantity+"</td>"
               let sumPrice = quantity*(allFoundCompanyOrders[k].product.productPrice);
               
               txt += "<td class='align-middle'>"+sumPrice+"</td>"
               
               let newDate = new Date(allFoundCompanyOrders[k].ordersBean.ordersDate);
               let register = newDate.toLocaleString();
               
               txt += "<td class='align-middle'>"+register+"</td>"
   	           txt += '</tr>'
			   
		    }
	    }
       $("#page").html("");
       $("#orders").html(txt);
     

    });
</script>




	<script>
		//=============分頁程式=============
		function pages(maxNum, dataSource) { //輸入單頁最大筆數和資料來源
			//=================分頁功能================
		
			//最大頁數
			let maxPage;
			//目前顯示頁數
			let nowPage = 0;
			//每頁最大筆數
			let maxItems = maxNum;
			//設定起始編號
			let startItem = 0;
			//設定結束編號
			let endItem = maxItems;

			//讀回資料時就先顯示
			showData(startItem, endItem, dataSource);

			//計算出最大頁數。
			if (dataSource.length % maxItems == 0) {
				maxPage = Math.floor(dataSource.length / maxItems);
				 //alert("最大頁數1：" + maxPage);
			} else {
				maxPage = (Math.floor(dataSource.length / maxItems)) + 1;
				 //alert("最大頁數2：" + maxPage);
			}
			
			//alert("最大頁數：" + maxPage);
			//生成前先清空
			$("#page").html(" ");
			
			//動態生成頁數
			let pageHtml = `<li class="page-item previous disabled pageMove"><a class="page-link">上一頁</a></li>`;
			for (let i = 0; i < maxPage; i++) {
				let pageNum = i + 1;
				pageHtml += `<li id=`+ i +` class="page-item page pageNum pageMove"><a class="page-link">`
						+ pageNum + `</a></li>`;
			}
			;
			pageHtml += `<li class="page-item next pageMove"><a class="page-link" >下一頁</a></li>`;
			$("#page").html(pageHtml);

			//綁定前先清除綁定事件
			$("#page").unbind("click");
			//綁定click事件
			$("#page").on("click", ".page", function() {
				nowPage = ($(this).prop("id")) * 1;//強制轉成數字型態
				$(".pageNum").prop("class", "page-item page pageNum")
				$(this).prop("class", "page-item page pageNum active")
				// alert("nawPage："+nowPage+ "資料型態："+typeof nowPage);
				//恢復上、下頁的功能
				$(".previous").prop("class", "page-item previous");
				$(".next").prop("class", "page-item next");
				// alert("nowPage："+nowPage+"maxPage："+maxPage);
				//計算是否是最後一頁
				if ((nowPage) + 1 >= maxPage) {
					startItem = nowPage * maxItems;
					if (dataSource.length % maxItems == 0) {
						endItem = startItem + maxItems
					} else {
						endItem = startItem + dataSource.length % maxItems;
					}

				} else {
					startItem = nowPage * maxItems;
					endItem = startItem + maxItems;
				}
				// alert("開始："+startItem+"結束："+endItem);
				showData(startItem, endItem, dataSource);
			});

			//=======上一頁設定========
			$("#page").on("click",".previous",function() {

						//恢復下一頁的功能
						$(".next").prop("class", "page-item next");

						let page = nowPage - 1;

						$(".pageNum").prop("class", "page-item page pageNum")
						$("#" + page).prop("class",
								"page-item page pageNum active")

						//判斷是否已經是第一頁了，取消上一頁功能
						if (page <= 0) {
							$(".previous").prop("class",
									"page-item previous disabled");
							startItem = 0 * maxItems;
							endItem = startItem + maxItems;
						} else {
							startItem = page * maxItems;
							endItem = startItem + maxItems;
						}
						showData(startItem, endItem, dataSource);
						nowPage = page;
					});

			//=============下一頁設定=============
			$("#page").on("click", ".next", function() {

				//恢復上一頁的功能
				$(".previous").prop("class", "page-item previous");

				let page = nowPage + 1;

				$(".pageNum").prop("class", "page-item page pageNum")
				$("#" + page).prop("class", "page-item page pageNum active")

				//計算是否是最後一頁，並取消下一頁功能
				if (page >= (maxPage - 1)) {
					$(".next").prop("class", "page-item next disabled")
					startItem = page * maxItems;
					if (dataSource.length % maxItems == 0) {
						endItem = startItem + maxItems
					} else {
						endItem = startItem + dataSource.length % maxItems;
					}
				} else {
					startItem = page * maxItems;
					endItem = startItem + maxItems;
				}
				showData(startItem, endItem, dataSource);
				nowPage = page;
			});
 		}
	</script>

	<script>
    //=============顯示功能=============
    function showData(startItem,endItem,dataSource){
        let txt;
        for (let i = startItem; i < endItem; i++) {
        	txt += "<tr>";
            txt += "<td class='align-middle'>"+dataSource[i].ordersId+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].ordersBean.member.memberMail+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].ordersBean.ordersName+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].ordersBean.ordersPhone+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].ordersBean.ordersAddress+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].product.productName+"</td>"
            txt += "<td class='align-middle'>"+dataSource[i].product.productId+"</td>"
            
            let quantity = dataSource[i].quantity;
            txt += "<td class='align-middle'>"+quantity+"</td>"
            let sumPrice = quantity*(dataSource[i].product.productPrice);
            
            txt += "<td class='align-middle'>"+sumPrice+"</td>"
            
            let newDate = new Date(dataSource[i].ordersBean.ordersDate);
            let register = newDate.toLocaleString();
            
            txt += "<td class='align-middle'>"+register+"</td>"
	            txt += '</tr>'
	        }
        $("#orders").html(txt);
    }

</script>



</body>