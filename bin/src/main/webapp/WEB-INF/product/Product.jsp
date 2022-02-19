<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<link rel="stylesheet" href="../../css/Product.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<!-- <div class="searchArea"> -->
<!--     <select id="selectVal" class="form-select selectBox" aria-label="Default select example"> -->
<!--         <option selected>全部商品</option> -->
<!--         <option value="食材">食材</option> -->
<!--         <option value="廚具">廚具</option> -->
<!--     </select> -->
<!--     <input class="keyWord keyWord1 searchBox" type="text" name="accKeyWord" placeholder="請輸入名稱關鍵字..."> -->
<!--     <input id="searchAcc" class="keyWord btn btn-outline-secondary searchBox2 " type="button" value="查詢" /> -->
<!-- </div> -->

<div class="list-group left ">
  <a href="#" class="list-group-item active">全部商品</a>
  <a href="#" class="list-group-item">廚具</a>
  <a href="#" class="list-group-item">食材</a>
</div>
     
     
<div class="right">
  <div class="container" >
    <div class="row" >
        <div class="col-lg-12 my-3" >
            <div class="pull-right">
                <div class="btn-group">
                    <button class="btn btn-primary" id="list"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list" viewBox="0 0 20 20">
                                                              <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                                                              </svg></button>
                    <button class="btn btn-warning" id="grid" ><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-grid-fill" viewBox="0 0 20 20">
 																	   <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zm8 0A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm-8 8A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm8 0A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3z"/>
																	   </svg></button>
                </div>
            </div>
        </div>
    </div> 
    		<div id="products" class="row view-group">
<%-- 			  <c:forEach items="${pros}" var="pro"> --%>
                <div class="item col-xs-4 col-lg-4" >
                    <div class="thumbnail card h-100" >
                        <div class="img-event">
                        	<a href ="/Product/${pro.productId}">
                            <img class="group list-group-image img-fluid " src="/img/${pro.productPics}" alt="" style="width:260px ;height:260px"/>
                            </a>
                        </div>
                        <div class="caption card-body">
                        	<h3 class="item-product-company text-secondary">${pro.productCompany}</h3>                       
                            <h4 class="group card-title inner list-group-item-heading fw-bolder">${pro.productName}</h4>
                            <p class="group inner list-group-item-text">${pro.productContent}</p>
                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                    <p class="lead text-danger fs-4 text fw-bold">$${pro.productPrice}</p>
                                </div>
                                <div class="col-xs-12 col-md-4">
                                    <button class="add-to-cart btn btn-primary" type="button" onclick="addToCart(${pro.productId})">加入購物車</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
<%-- 			</c:forEach> --%>
           </div>
        </div>
        <nav aria-label="Page navigation example ">
            <ul id="page" class="pagination justify-content-center"></ul>
        </nav>

	  </div>
        

	<script type="text/javascript">
	
		function addToCart(productId) {
			var quantity = ""+1;
			var postData = { "pid": productId, "qty": quantity };
			$.ajax({
				url: "/shoppingCart/insert",
				type: "POST",
				data: JSON.stringify(postData),
				contentType: "application/json; charset=utf-8",
				success: function() {
					Swal.fire({
						  title: '確定新增至購物車?',
						  text: "你絕對不會後悔的!",
						  icon: 'question',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '加入購物車!'
						}).then((result) => {
						  if (result.isConfirmed) {
						    Swal.fire(
						      '新增成功!',
						      '已添加至購物車',
						      'success'
						    )
						  }
						})
				}
			})
		}
		
		$(document).ready(function() {
            $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
            $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
        });
	</script>
<script>
    //=============顯示所有商品資料=============
    	//將值傳到全域
        let ShareData;
        //最大頁數
        var maxPage;
        //目前顯示頁數
        let nowPage = 0;
        //每頁最大筆數
        let maxItems = 9;
        //設定起始編號
        let startItem = 0;
        //設定結束編號
        //let endItem = maxItems;
        let endItem;
    //螢幕載入時 先執行的區域
        window.addEventListener('load', function () {
        	searchProductDate("/Products", "GET");
        })

        	function searchProductDate(url, type) {
            $.ajax({
                url: url,
                type: type,
                contentType: "application/json; charset=utf-8",
                success: function (products) {
                	ShareData = products

                    //得到格式：{title: Array}        
                    //console.log(ShareData)
                    //=================分頁功能================
                    endItem = (products.length <= 9) ? products.length : 9;
                    //讀回資料時就先顯示
                    showData(startItem, endItem);
                    //計算出最大頁數。
                    maxPage = (products.length % maxItems == 0) ? Math.floor(products.length / maxItems) : (Math.floor(products.length / maxItems)) + 1;

                    //動態生成頁數
                    let pageHtml = `<li class="page-item previous disabled pageMove"><a class="page-link">上一頁</a></li>`;
                    for (let i = 0; i < maxPage; i++) {
                        let pageNum = i + 1;
                        pageHtml += `<li id=` + i + ` class="page-item page pageNum pageMove"><a class="page-link">` + pageNum + `</a></li>`;
                    };
                    pageHtml += `<li class="page-item next pageMove"><a class="page-link" >下一頁</a></li>`;
                    $("#page").html(pageHtml);
                    
                    //顯示資料用
                    function showData(startItem, endItem,) {
                        let ProductData = "";
                        console.log(ShareData);
                       	//console.log("endItem：" + endItem);
                       	//console.log(ShareData);
                        for (let i = startItem; i < endItem; i++) {
                            //console.log(ShareData[i].productId);
                            
//                             ProductData += "<img src=" + /img/ + ShareData[i].productPics
							
                             ProductData += "<div class='item col-xs-4 col-lg-4' >"
                             ProductData += "<div class='thumbnail card h-100' >"
                             ProductData += "<div class='img-event'>"
                             ProductData += "<a href='/Product/" + ShareData[i].productId + "'>"
                             ProductData += "<img class='group list-group-image img-fluid' src=" + /img/ + ShareData[i].productPics + "/>";
                             ProductData += "</a>"
                             ProductData += "</div>"
                             ProductData += "<div class='caption card-body'>"
                             ProductData += "<h3 class='item-product-company text-secondary'>" + ShareData[i].productCompany + "</h3>";                       
                          	 ProductData += "<h4 class='group card-title inner list-group-item-heading fw-bolder'><a href='/Product/" + ShareData[i].productId + "'>" + ShareData[i].productName + "</a></h4>";
                           	 ProductData += "<p class='group inner list-group-item-text'" + ShareData[i].productContent + "/>";
                           	 ProductData += "<div class='row'>"
                           	 ProductData += "<div class='col-xs-12 col-md-6'>"
                           	 ProductData += "<p class='lead text-danger fs-3 text fw-bold'>$"+ ShareData[i].productPrice + "</p>";
                           	 ProductData += "</div>"
                           	 ProductData += "<div class='col-xs-12 col-md-4'>"
                           	 ProductData += '<button class="add-to-cart btn btn-primary" type="button" onclick="addToCart('+ ShareData[i].productId +')"><i class="bi bi-cart-plus"></i>加入購物車</button>';
                           	 ProductData += "</div>"
                           	 ProductData += "</div>"
                           	 ProductData += "</div>"
                           	 ProductData += "</div>"
                           	 ProductData += "</div>" 
                           	 ProductData += "</div>" 
                           	 ProductData += "</div>" 


                        }
                        $("#products").html(ProductData);
                    }
                  //綁定click事件
                    $("#page").on("click", ".page", function () {
                        //alert(ShareData);
                        nowPage = ($(this).prop("id")) * 1; //強制轉成數字型態
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
                            if (ShareData.length % maxItems == 0) {
                                endItem = startItem + maxItems
                            } else {
                                endItem = startItem + ShareData.length % maxItems;
                            }

                        } else {
                            startItem = nowPage * maxItems;
                            endItem = startItem + maxItems;
                        }
                        // alert("開始："+startItem+"結束："+endItem);
                        showData(startItem, endItem);
                    });
                    //=======上一頁設定========
                    $("#page").on("click", ".previous", function () {

                        //恢復下一頁的功能
                        $(".next").prop("class", "page-item next");

                        let page = nowPage - 1;

                        $(".pageNum").prop("class", "page-item page pageNum")
                        $("#" + page).prop("class", "page-item page pageNum active")

                        //判斷是否已經是第一頁了，取消上一頁功能
                        if (page <= 0) {
                            $(".previous").prop("class", "page-item previous disabled");
                            startItem = 0 * maxItems;
                            endItem = startItem + maxItems;
                        } else {
                            startItem = page * maxItems;
                            endItem = startItem + maxItems;
                        }
                        showData(startItem, endItem);
                        nowPage = page;
                    });

                    //========下一頁設定============
                    $("#page").on("click", ".next", function () {

                        //恢復上一頁的功能
                        $(".previous").prop("class", "page-item previous");

                        let page = nowPage + 1;

                        $(".pageNum").prop("class", "page-item page pageNum")
                        $("#" + page).prop("class", "page-item page pageNum active")

                        //計算是否是最後一頁，並取消下一頁功能
                        if (page >= (maxPage - 1)) {
                            $(".next").prop("class", "page-item next disabled")
                            startItem = page * maxItems;
                            if (ShareData.length % maxItems == 0) {
                                endItem = startItem + maxItems
                            } else {
                                endItem = startItem + ShareData.length % maxItems;
                            }
                        } else {
                            startItem = page * maxItems;
                            endItem = startItem + maxItems;
                        }
                        showData(startItem, endItem);
                        nowPage = page;
                    });
                }
            })
   		 };
   		//上面分類選擇器
         $("#navTotal").click(function() {
             searchShareDate("/Products", "GET");
             nowPage = 0;
             startItem = 0;
             $("#navTotal").prop("class", "nav-link active")
             $("#navKitchenware").prop("class", "nav-link")
             $("#navIngredient").prop("class", "nav-link")
         })
         $("#navKitchenware").click(function() {
             searchShareDate("/ProductsKitchenware", "GET");
             nowPage = 0;
             startItem = 0;
             $("#navTotal").prop("class", "nav-link")
             $("#navKitchenware").prop("class", "nav-link active")
             $("#navIngredient").prop("class", "nav-link")
         })
         $("#navIngredient").click(function() {
             searchShareDate("/ProductsIngredient", "GET");
             nowPage = 0;
             startItem = 0;
             $("#navTotal").prop("class", "nav-link")
             $("#navKitchenware").prop("class", "nav-link")
             $("#navIngredient").prop("class", "nav-link active")
         })
     </script>

	

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>