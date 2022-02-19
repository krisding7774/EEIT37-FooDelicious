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
        會員列表
        <br>
        <span class="littleName">Member List</span>
    </h1>

    <section class="content">
        <div class="col-xs-12">
            <table id="" class='table table-striped table-hover'>
                <thead>
                <tr>
                    <th class="col col1 table-primary">編號</th>
                    <th class="col col2 table-primary">E-mail</th>
                    <th class="col col4 table-primary">帳號狀態</th>
                    <th class="col col5 table-primary">姓名</th>
                    <th class="col col6 table-primary">性別</th>
                    <th class="col col12 table-primary">生日</th>
                    <th class="col col10 table-primary">電話</th>
                    <th class="col col11 table-primary">地址</th>
                    <th class="col col8 table-primary">coin</th>
                    <th class="col col7 table-primary">折扣</th>
                    <th class="col col13 table-primary">註冊日期</th>
                    <th class="col col14 table-primary">更新</th>
                    <th class="col col15 table-primary">取消</th>
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
                                <select id="memberStatus" class="form-select upInput text-middle upInputBig">
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
                                <select id="memberGender" class="form-select upInput upInputBig">
                                    <option value="" id="gender" selected></option>
                                    <option value="MALE">MALE</option>
                                    <option value="FEMALE">FEMALE</option>
                                </select>
                            </td>
                            <td class='align-middle'>
                                <input class="upInput" type="text" value="" id="memberBirth">
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
                                <input class="upInput" type="text" value="" id="discount">
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
    let memberString = localStorage.getItem("memberData")
    //將字串json化
    let memberData = JSON.parse(memberString);
    //填入資料
    $("#memberId").val(memberData.memberId);
    $("#memberMail").val(memberData.memberMail);
    $("#status").text(memberData.memberStatus);
    $("#status").val(memberData.memberStatus);
    $("#memberName").val(memberData.memberName);
    $("#gender").val(memberData.memberGender);
    $("#gender").text(memberData.memberGender);
    $("#memberBirth").val(memberData.memberBirth);
    $("#memberPhone").val(memberData.memberPhone);
    $("#memberAddress").val(memberData.memberAddress);
    $("#memberCoin").val(memberData.memberCoin);
    $("#discount").val(memberData.discount);
    let newDate = new Date(memberData.registerDate);
    let register = newDate.toLocaleString();
    $("#registerDate").val(register);
</script>
<script>
    //=============跳回首頁=============
    function cancel(){
        window.location.href="/backend/member";
    }
</script>
<script>
    //=============更新資料=============
    $("#updateBtn").on("click",function(){
        let memberID = $("#memberId").val();
        let memberObj = {
            "memberStatus": $("#memberStatus").val(),
            "memberName": $("#memberName").val(),
            "memberGender": $("#memberGender").val(),
            "memberBirth": $("#memberBirth").val(),
            "memberPhone": $("#memberPhone").val(),
            "memberAddress": $("#memberAddress").val(),
            "memberCoin": $("#memberCoin").val(),
            "discount": $("#discount").val()
        };
        let memberString = JSON.stringify(memberObj);
        // alert(memberString);

        $.ajax({
            url:"http://localhost:8080/bkmembers/update/"+memberID,
            type:"PUT",
            contentType:'application/json; charset=UTF-8',
            data: memberString,
            success:function(msg){
                alert(msg)
                window.location.href="/backend/member";
            }
        })
    })
</script>
</body>

