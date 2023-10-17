<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>

	<style type= "text/css">
		div.grid {
			display: grid;
			grid-template-columns: 80px 1fr;
			grid-template-rows: 28px 28px 28px 320px 1fr;
			row-gap: 10px;
		}

		div.grid > div.btn-group {
			display: grid;
			grid-column: 1 / 3;
		}

		div.grid div.right-align {
			text-align: right;
		}

		label {
			padding-left: 10px;
		}

		button, input, textarea {
			padding:10px;
		}
		
		input[type=file] {
			padding: 0px;
		}
		
	</style>
	
</head>
<body>
	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1>게시글 수정_${generalPostVO.generalPostId}번글</h1>

	<form method="post" action="/freeboard/update" modelAttribute="generalPostVO" >
		<input type="hidden" name="generalPostId" value="${generalPostVO.generalPostId}"/>
		<div class="grid">
			<label for="postTitle">제목</label>
			<input id="postTitle" type="text" name="postTitle" value="${generalPostVO.postTitle}"/>
			
 			<label for="postWriterId">이메일</label>
			<input id="postWriterId" type="email" name="postWriterId" value="${generalPostVO.postWriterId}"/>
			
			<label for="viewCnt">조회수</label>
			<input id="viewCnt" type="number" name="viewCnt" value="${generalPostVO.viewCnt}"/>	
			
			<label for="postDate">등록일</label>
			<input id="postDate" type="text" name="postDate" value="${generalPostVO.postDate}"/>
	
			<label for="postContent">내용</label>
			<textarea id="postContent" name="postContent" style="height: 300px;">${generalPostVO.postContent}</textarea>
			<div class="btn-group">
				<div class="right-align">
					<input type="submit" value="저장" />
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>