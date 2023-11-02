<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원가입 승인/거절</title>
</head>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
    $().ready(function() {
        $(".approval").click(function(){
        // $(".approval").click(function(e){
            let val= "approval"
            let companyEmail = $(this).closest('tr').data('id')
            console.log(companyEmail)
            // console.log(e.target)
            $.post("/admin/companymember", {val: val, companyEmail: companyEmail}, function(response) {
                alert("처리 완료")
                location.reload()
            });
            // $(document).on("click", function(){
            //     window.location.href = "http://localhost:8080/admin/companymember";
            // })
        });
        $(".refuse").click(function(){
        // $(".approval").click(function(e){
            let val= "refuse"
            let companyEmail = $(this).closest('tr').data('id')
            console.log(companyEmail)
            // console.log(e.target)
            $.post("/admin/companymember", {val: val, companyEmail: companyEmail}, function(response) {
                alert("처리 완료")
                location.reload()
            })
            // $(document).on("click", function(){
            //     window.location.href = "http://localhost:8080/admin/companymember";
            // })
        });
        $(".download").click(function(){
            let companyEmail = $(this).closest('tr').data('id')
            // window.open("/admin/companymember/"+companyEmail, "다운로드", "width=600px, height=400px")
            $.get("/admin/companymember/"+companyEmail, function(response) {
                console.log("test")
            })
        })
});
</script>
<body>
    <div class="company_list">
        <table>
            <thead>
                <tr>
                    <th>이메일</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>사업자등록증</th>
                    <th>가입처리</th>
                    <th>가입승인여부</th>             
                </tr>
            </thead>
            <tbody id="companyMemberListArea">
                <c:forEach items="${companyListVO.companyList}" var="company">
                    <tr class="allCompanyList" data-id="${company.companyEmail}">
                        <td>${company.companyEmail}</a></td>
                        <td>${company.contactName}</td>
                        <td>${company.contactNumber}</td>
                        <td><button class="download" value="download">다운로드</button></td>
                        <td><button class="approval" value="approval">승인</button>
                            <button class="refuse" value="refuse">거절</button>
                        </td>
                        <td>${company.confirmYn}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>