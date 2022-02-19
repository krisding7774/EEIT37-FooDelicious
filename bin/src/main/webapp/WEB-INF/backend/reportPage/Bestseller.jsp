<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<head>
    <link rel="stylesheet" href="../../../css/backendReportProduct.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
</head>
<body>
<h1 class="tableName titleName2">
    暢銷商品
    <br>
    <span class="littleName">Top selling products</span>
</h1>
<div class="foodArea">
    <p class="textName "><i class="fas fa-hamburger"></i>食材類 </p>
    <div class="col-sm-5 report1">
        <canvas id="myChart" ></canvas>
    </div>

    <div class="col-sm-5 report2">
        <h2>食材類 Top 5</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col" class="table-danger">名次</th>
                <th scope="col" class="table-danger">編號</th>
                <th scope="col" class="table-danger">商品名稱</th>
                <th scope="col" class="table-danger">庫存</th>
                <th scope="col" class="table-danger">銷售數量</th>
                <th scope="col" class="table-danger">總銷售額</th>
            </tr>
            </thead>
            <tbody id="foodList">
            </tbody>
        </table>
    </div>
</div>

<div class="toolArea">
    <p class="textName"><i class="fas fa-utensils"></i>餐廚類</p>
    <div class="col-sm-5 report1">
        <canvas id="myChart2" ></canvas>
    </div>

    <div class="col-sm-5 report2">
        <h2>餐廚類 Top 5</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col" class="table-secondary">名次</th>
                <th scope="col" class="table-secondary">編號</th>
                <th scope="col" class="table-secondary">商品名稱</th>
                <th scope="col" class="table-secondary">庫存</th>
                <th scope="col" class="table-secondary">銷售數量</th>
                <th scope="col" class="table-secondary">總銷售額</th>
            </tr>
            </thead>
            <tbody id="toolList">
            </tbody>
        </table>
    </div>
</div>

<script>
    //=========食材區=========
    $.ajax({
        url:"/report/product/food",
        type: "GET",
        success: function(foods){
            let foodList = foods;
            let data1 = foodList[0].productSalesFigures;
            let data2 = foodList[1].productSalesFigures;
            let data3 = foodList[2].productSalesFigures;
            let data4 = foodList[3].productSalesFigures;
            let data5 = foodList[4].productSalesFigures;

            let name1 = "商品編號："+foodList[0].productId;
            let name2 = foodList[1].productId;
            let name3 = foodList[2].productId;
            let name4 = foodList[3].productId;
            let name5 = foodList[4].productId;

            //=========統計數據=========
            let foodHtml="";
            for(let i=0; i<foods.length; i++){
                foodHtml +='<tr><th scope="row">'+(i+1)+'</th>';
                foodHtml += '<td>'+foodList[i].productId+'</td>';
                let nameObj = new String(foodList[i].productName);
                let nameString = nameObj.substring(0,15);
                foodHtml += '<td>'+nameString+'</td>';
                foodHtml += '<td class="total">'+foodList[i].productStock+'</td>';
                foodHtml += '<td class="total">'+foodList[i].productSalesFigures+'</td>';
                let num = foodList[i].productSalesFigures;
                let price = foodList[i].productPrice
                let totalPrice = price*num;
                let total = totalPrice.toLocaleString('en-US');
                foodHtml += '<td class="total">'+total+'</td></tr>';
            }
            $("#foodList").html(foodHtml);
            //=========圖表區=========
            let ctx = $('#myChart');
            let myChart = new Chart(ctx, {
                type: 'bar', //圖表類型
                data: {
                    //標題
                    labels: [name1, name2, name3, name4, name5],
                    datasets: [{
                        label: '食材類TOP 5', //標籤
                        data: [data1, data2, data3, data4, data5], //資料
                        //圖表背景色
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                        ],
                        //圖表外框線色
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)'
                        ],
                        //外框線寬度
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true,

                            }
                        }]
                    }
                }

            });
        }
    })

    //=========餐廚區=========
    $.ajax({
        url:"/report/product/tool",
        type: "GET",
        success: function(tools){
            let toolList = tools;
            let data1 = toolList[0].productSalesFigures;
            let data2 = toolList[1].productSalesFigures;
            let data3 = toolList[2].productSalesFigures;
            let data4 = toolList[3].productSalesFigures;
            let data5 = toolList[4].productSalesFigures;

            let name1 = "商品編號："+toolList[0].productId;
            let name2 = toolList[1].productId;
            let name3 = toolList[2].productId;
            let name4 = toolList[3].productId;
            let name5 = toolList[4].productId;

            //=========統計數據=========
            let toolHtml="";
            for(let i=0; i<tools.length; i++){
                toolHtml +='<tr><th scope="row">'+(i+1)+'</th>';
                toolHtml += '<td>'+toolList[i].productId+'</td>';
                let nameObj = new String(toolList[i].productName);
                let nameString = nameObj.substring(0,15);
                toolHtml += '<td>'+nameString+'</td>';
                toolHtml += '<td class="total">'+toolList[i].productStock+'</td>';
                toolHtml += '<td class="total">'+toolList[i].productSalesFigures+'</td>';
                let num = toolList[i].productSalesFigures;
                let price = toolList[i].productPrice
                let totalPrice = price*num;
                let total = totalPrice.toLocaleString('en-US');
                toolHtml += '<td class="total">'+total+'</td></tr>';
            }
            $("#toolList").html(toolHtml);
            //=========圖表區=========
            let ctx2 = $('#myChart2');
            let myChart2 = new Chart(ctx2, {
                type: 'bar', //圖表類型
                data: {
                    //標題
                    labels: [name1, name2, name3, name4, name5],
                    datasets: [{
                        label: '餐廚類TOP 5', //標籤
                        data: [data1, data2, data3, data4, data5], //資料
                        //圖表背景色
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                        ],
                        //圖表外框線色
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)'
                        ],
                        //外框線寬度
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true,

                            }
                        }]
                    }
                }

            });
        }
    })
</script>

</body>
</html>
