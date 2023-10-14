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

	<h1>게시글 수정</h1>
	<form method="post" action="/update/freeboard/${generalPostVO.generalPostId}" enctype="multipart/form-data">
		<input type="hidden" name="generalPostId" value="${generalPostVO.generalPostId}"/>
		<div class="grid">
			<label for="postTitle">제목</label>
			<input id="postTitle" type="text" name="postTitle" value="${generalPostVO.postTitle}"/>
	
			<label for="postWriterId">이메일</label>
			<input id="postWriterId" type="email" name="postWriterId" value="${generalPostVO.postWriterId}"/>
	
<!-- 			<label for="file">첨부파일</label> -->
<!-- 			<div> -->
<!-- 				<input type="file" id="file" name="file"> -->
<%-- 				현재 업로드 된 파일: ${generalPostVO.originFileName} --%>
<!-- 			</div> -->

	
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