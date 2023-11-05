<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>devGround</title>
</head>
<body>
    	<jsp:include page="../member/membermenu.jsp"></jsp:include>
    <h3>정말 삭제하시겠습니까?</h3>
    <h3>${generalPostVO.generalPostId}번 글을 지웁니다!</h3>

    <form method="post" action="/freeboard/delete/${generalPostVO.generalPostId}"  modelAttribute="generalPostVO"  >
    <input type="hidden" name="generalPostId" value="${generalPostVO.generalPostId}"/>
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