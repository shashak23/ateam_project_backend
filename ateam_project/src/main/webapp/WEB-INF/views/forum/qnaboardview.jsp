<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	a:link, a:hover, a:visited, a:active { 
		color: #333;
		text-decoration: none; 
	}
	div.grid { 
		display: grid;
		grid-template-columns: 80px 1fr;
		grid-template-rows: 28px 28px 28px 28px 28px 320px 1fr; 
		row-gap: 10px;
	}
	div.grid > div.btn-group { 
		display: grid; 
		grid-column: 1 / 3;
	}
	div.grid div.right-align{ 
		text-align: right;
	} 
	label {
		padding-left: 10px; 
	}
	button, input, textarea { 
		padding: 10px;
	}

	/* 신고버튼 */
    .report-button {
        
        padding: 10px 20px;
        background-color: #EEE; 
        color: red; 
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        border: 1px solid black;
        border-radius: 5px; /* 모서리 둥글게 */
        cursor: pointer;
        width: 50px;
        height: 50px;
    }

    /* 버튼에 호버(마우스를 올릴 때) 스타일 추가 */
    .report-button:hover {
        background-color: #d32f2f; /* 호버 시 배경색 변경 */
    }
</style>

</head>
<body>

	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1>게시글 조회</h1>
	
	<form name="generalPostVO" method="post" ModelAttribute="generalPostVO" >
	<div class="grid">
		<label for="postTitle">제목</label>
		<div>${generalPostVO.postTitle}</div>
		
		<label for="postWriter">이메일</label>
		<div>${generalPostVO.postWriter}</div>
		
		<label for="viewCnt">조회수</label>
		<div>${generalPostVO.viewCnt}</div>
		
		<label for="postDate">등록일</label>
		<div>${generalPostVO.postDate}</div>

		<label for="postContent">내용</label> 
		<div>${generalPostVO.postContent}</div>

	<button class="report-button">신고</button>
		<div class="btn-group">
			<div class="right-align">
 				<c:if test="${sessionScope._LOGIN_USER_.email eq generalPostVO.postWriter}">
				<div class="update_btn">
					<div class="btn"> 
						<a href="/qnaboard/update/${generalPostVO.generalPostId}">수정</a>
			            <a href="/qnaboard/delete/${generalPostVO.generalPostId}">삭제</a>	
					</div>
				</div>
			</div> 
		</div>
	</div>
	</c:if>
	</form>
</body>
</html>