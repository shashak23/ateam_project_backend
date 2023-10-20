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
		});
		
		
      
	})
</script>
<body>
<form method="post">
			<h1>기술스택</h1>
		    <label class="label" for="hashtagId">알고리즘 카테고리</label>
		    <div id="techstack_category"></div>
                    <input type="submit" value="저장" />
	</form>
</body>
</html>