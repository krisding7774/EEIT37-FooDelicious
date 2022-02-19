<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <link rel="stylesheet" href="../../../css/BackendMemberUpdate.css">
</head>
<body>
<div>
    <h1 class="tableName titleName2">
        管理員列表
        <br>
        <span class="littleName">Manager List</span>
    </h1>

    <section class="content">
        <div class="col-xs-12">
            <table id="" class='table table-striped table-hover'>
                <thead>
                <tr>
                    <th class="col col1 table-danger">管理員編號</th>
                    <th class="col col2 table-danger">帳號Email</th>
                    <th class="col col4 table-danger">權限狀態</th>
                    <th class="col col5 table-danger">管理員姓名</th>
                    <th class="col col10 table-danger">管理員電話</th>
                    <th class="col col11 table-danger">管理員地址</th>
                    <th class="col col8 table-danger">管理員coin</th>
                    <th class="col col13 table-danger">註冊日期</th>
                    <th class="col col14 table-danger">更新</th>
                    <th class="col col15 table-danger">取消</th>
                </tr>
                </thead>
                <tbody>
                    <form>
                        <tr>
                            <td class='align-middle'>
                                <input class="upInput readonly text-middle upInputSm" type="text" value="" readonly id="memberId">
                            </td>
                            <td class='align-middle'>
                                <input class="upInput upInputBig readonly" type="text" value="" readonly id="memberMail">
                            </td>
                            <td class='align-middle'>
                                <select id="memberStatus" class="form-select upInput text-middle upInputMd">
                                    <option value="" id="status" selected></option>
                                    <option value="admin">admin</option>
                                    <option value="company">company</option>
                                    <option value="customer">customer</option>
                                </select>
                            </td>
                            <td class='align-middle'>
                                <input class="upInput" type="text" value="" id="memberName">
                            </td>
                            <td class='align-middle'>
                                <input class="upInput" type="text" value="" id="memberPhone">
                            </td>
                            <td class='align-middle'>
                                <input class="upInput" type="text" value="" id="memberAddress">
                            </td>
                            <td class='align-middle'>
                                <input class="upInput" type="text" value="" id="memberCoin">
                            </td>
                            <td class='align-middle'>
                                <input class="upInput upInputBig readonly" type="text" value="" readonly id="registerDate">
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
    let managerString = localStorage.getItem("managerData")
    //將字串json化
    let managerData = JSON.parse(managerString);
    //填入資料
    $("#memberId").val(managerData.memberId);
    $("#memberMail").val(managerData.memberMail);
    $("#status").text(managerData.memberStatus);
    $("#status").val(managerData.memberStatus);
    $("#memberName").val(managerData.memberName);
    $("#memberPhone").val(managerData.memberPhone);
    $("#memberAddress").val(managerData.memberAddress);
    $("#memberCoin").val(managerData.memberCoin);
    let newDate = new Date(managerData.registerDate);
    let register = newDate.toLocaleString();
    $("#registerDate").val(register);
</script>
<script>
    //=============跳回首頁=============
    function cancel(){
        window.location.href="/backend/manager";
    }
</script>
<script>
    //=============更新資料=============
    $("#updateBtn").on("click",function(){
        let managerID = $("#memberId").val();
        let managerObj = {
            "memberStatus": $("#memberStatus").val(),
            "memberName": $("#memberName").val(),
            "memberPhone": $("#memberPhone").val(),
            "memberAddress": $("#memberAddress").val(),
            "memberCoin": $("#memberCoin").val(),
        };
        let managerString = JSON.stringify(managerObj);
        // alert(memberString);

        $.ajax({
            url:"http://localhost:8080/bkmanagers/update/"+managerID,
            type:"PUT",
            contentType:'application/json; charset=UTF-8',
            data: managerString,
            success:function(msg){
                alert(msg)
                window.location.href="/backend/manager";
            }
        })
    })
</script>
</body>

