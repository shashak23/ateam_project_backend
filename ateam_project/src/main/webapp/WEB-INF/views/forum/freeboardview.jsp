<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>

	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1>게시글 작성</h1>
	<div class="grid">
		<label for="postTitle">제목</label>
		<div>${generalPostVO.postTitle}</div>
		
		<label for="postWriterId">이메일</label>
		<div>${generalPostVO.postWriterId}</div>
		
		<label for="viewCnt">조회수</label>
		<div>${generalPostVO.viewCnt}</div>
		
		<label for="postDate">등록일</label>
		<div>${generalPostVO.postDate}</div>

		<label for="postContent">내용</label> 
		<div>${generalPostVO.postContent}</div> 

		<div class="btn-group">
		<div class="right-align">
 			<!-- <a href="/freeboard/update/${generalPostVO.generalPostId}">수정</a> -->
			 <form method="post" action="/freeboard/update">
				<div class="update_btn">
					<div class="btn">
						<input type="submit" value="수정">
					</div>
				</div>
			</form>
			<!-- <a href="/freeboard/delete/${generalPostVO.generalPostId}">삭제</a> -->
			<form method="post" action="/freeboard/delete">
				<div class="delete_btn">
					<div class="btn">
						<input type="submit" value="삭제">
					</div>
				</div>
			</form>
		</div> 
	</div>
</body>
</html>