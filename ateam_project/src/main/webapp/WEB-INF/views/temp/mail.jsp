<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원가입 승인/거절 메일 발송</title>
</head>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
    $().ready(function() {
        $("#ok").click(function() {
            var val = $(this).val()
            console.log(typeof val)
            $.post("/admin/member", {val: val}, function(response) {
                    // alert(response.data)
                    // alert(response.result)
            })
        })
});
</script>
<body>
    <h1>기업회원가입 승인/거절 메일 발송</h1>

        <button id="accept" value="accept">승인</button>
        <button id="refuse" value="refuse">거절</button>
        
</body>
</html>