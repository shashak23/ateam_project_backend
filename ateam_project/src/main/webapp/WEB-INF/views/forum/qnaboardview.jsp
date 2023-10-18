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

		<div class="btn-group">
			<div class="right-align">
 			<!-- <a href="/freeboard/update/${generalPostVO.generalPostId}">수정</a> -->
				<div class="update_btn">
					<div class="btn">
						<a href="/qnaboard/update/${generalPostVO.generalPostId}">수정</a>
			            <a href="/qnaboard/delete/${generalPostVO.generalPostId}">삭제</a>	
					</div>
				</div>
			</div> 
		</div>
	</div>
	</form>
</body>
</html>