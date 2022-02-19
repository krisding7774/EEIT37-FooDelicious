<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <link rel="stylesheet" href="../../../css/backendOrderUpdate.css">
</head>
<body>
<div>
    <h1 class="tableName titleName2">
        訂單列表
        <br>
        <span class="littleName">Order List</span>
    </h1>

    <section class="content">
        <div class="col-xs-12">
            <table id="" class='table table-striped table-hover'>
                <thead>
                <tr>
                    <th class="col table-warning smalW">編號</th>
                    <th class="col table-warning midW">會員帳號</th>
                    <th class="col table-warning midW">收件人姓名</th>
                    <th class="col table-warning midW">收件人電話</th>
                    <th class="col table-warning large">收件人地址</th>
                    <th class="col table-warning smalW">訂單狀態</th>
                    <th class="col table-warning smalW">訂單金額</th>
                    <th class="col table-warning midW">新增日期</th>
                    <th class="col table-warning smalW">更新</th>
                    <th class="col table-warning smalW">取消</th>
                </tr>
                </thead>
                <tbody>
                    <form>
                        <tr>
                            <td class='align-middle'>
                                <input class="upInput readonly text-middle smalW" type="text" value="" readonly id="ordersId">
                            </td>

                            <td class='align-middle'>
                                <input class="upInput readonly midW" type="text" value="" id="memberMail" readonly>
                            </td>

                            <td class='align-middle'>
                                <input class="smalW" type="text" value="" id="ordersName">
                            </td>
                            <td class='align-middle'>
                                <input class="smalW" type="text" value="" id="ordersPhone">
                            </td>
                            <td class='align-middle'>
                                <input class="larW" type="text" value="" id="ordersAddress">
                            </td>
                            <td class='align-middle'>
                                <select id="ordersState" class="form-select upInput midW">
                                    <option value="" id="type" selected></option>
                                    <option value="完成">完成</option>
                                    <option value="訂單處理中">訂單處理中</option>
                                    <option value="待出貨">待出貨</option>
                                    <option value="運送中">運送中</option>
                                    <option value="失敗">失敗</option>
                                </select>
                            </td>
                            <td class='align-middle'>
                                <input class="smalW" type="text" value="" id="ordersTotal">
                            </td>

                            <td class='align-middle'>
                                <input class="upInput midW readonly" type="text" value="" readonly id="ordersDate">
                            </td>
                            <td class="align-middle">
                                    <input id="updateBtn" class="btn btn-outline-primary" type="button" value="更新">
                            </td>
                            <td class="">
                                <input id="delBtn" class="btn btn-outline-danger" type="button" value="取消" onclick="cancel()">
                            </td></tr>
                    </form>
                </tbody>
            </table>
        </div>
    </section>
</div>
<script>
    //=============抓取另一頁傳來的資料=============
    let orderString = localStorage.getItem("orderData")
    //將字串json化
    let orderData = JSON.parse(orderString);
    //填入資料
    $("#ordersId").val(orderData.ordersId);
    $("#memberMail").val(orderData.bkMember.memberMail);
    $("#ordersName").val(orderData.ordersName);
    $("#ordersPhone").val(orderData.ordersPhone);
    $("#ordersAddress").val(orderData.ordersAddress);
    $("#type").val(orderData.ordersState);
    $("#type").text(orderData.ordersState);
    $("#ordersTotal").val(orderData.ordersTotal);
    let newDate = new Date(orderData.ordersDate);
    let register = newDate.toLocaleString();
    $("#ordersDate").val(register);
</script>
<script>
    //=============跳回首頁=============
    function cancel(){
        window.location.href="/backend/order";
    }
</script>
<script>
    //=============更新資料=============
    $("#updateBtn").on("click",function(){
        let orderId = $("#ordersId").val();
        let orderObj = {
            "ordersName": $("#ordersName").val(),
            "ordersPhone": $("#ordersPhone").val(),
            "ordersAddress": $("#ordersAddress").val(),
            "ordersState": $("#ordersState").val(),
            "ordersTotal": $("#ordersTotal").val(),
        };
        let orderString = JSON.stringify(orderObj);

        $.ajax({
            url:"/bkorders/update/"+orderId,
            type:"PUT",
            contentType:'application/json; charset=UTF-8',
            data: orderString,
            success:function(msg){
                alert(msg)
                window.location.href="/backend/order";
            }
        })
    })
</script>
</body>

