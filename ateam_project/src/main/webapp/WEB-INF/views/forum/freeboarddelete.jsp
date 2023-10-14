<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h3>정말 삭제하시겠습니까?</h3>
    
    <form method="post" action="/freeboard/delete">
        <div class="delete_btn">
            <div class="btn">
                <input type="submit" value="삭제">
            </div>
        </div>
    </form>

    <form method="get" action="/freeboard/list">
        <div class="back_btn">
            <div class="btn">
                <button>게시판으로 돌아가기</button>
            </div>
        </div>
    </form>
</body>

</html>