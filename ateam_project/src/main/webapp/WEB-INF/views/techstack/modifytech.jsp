<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(function() {
		
		$.get("/code/해시태그", function(response) {
			for (var i = 0; i < response.length; i++) {
				var code = response[i]
				var label = $("<label for='"+code.codeId+"'>"+code.codeContent+"</label>");
				var checkbox = $("<input type='checkbox' id='"+code.codeId+"' name='hashtagList' value='"+code.codeId+"' />");
				$("#techstack_category").append(checkbox);
				$("#techstack_category").append(label);
			}
			$.get("/techstack/category/${sessionScope._LOGIN_USER_.email}", function(techstackResponse) {
				console.log(techstackResponse)
				
				for (var i = 0; i < techstackResponse.length; i++) {
					var code = techstackResponse[i]
					$("input[name=hashtagList][value="+code.hashtagId+"]").prop("checked", true);
				}
			});
		});
		$("form").submit(function(event) {
            var checkedCount = $("input[name='hashtagList']:checked").length;
            if (checkedCount < 1) {
                alert("적어도 하나 이상의 항목을 선택하세요.");
                event.preventDefault();
            }
        });
})
</script>
<body>
 <form method="post" action="/memberInfo/modify/update-tech">
        <input type="hidden" name="email" value="${sessionScope._LOGIN_USER_.email}" />
        <h1>기술스택</h1>
		    <label class="label" for="hashtagId">알고리즘 카테고리</label>
		    <div id="techstack_category"></div>
        <input type="submit" value="수정">
        <button class="modalCloseTech">닫기</button>
    </form>
</body>
</html>