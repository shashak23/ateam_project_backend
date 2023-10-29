<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>

<style type="text/css">
	* {
		color: #333;
		
	}

	#container{
		display:flex;
		flex-direction: column;
	}

	#postTitle{
		font-size:50px;
	}

	div.grid {
		display: grid;
		grid-template-columns: 120px 1fr;
		grid-template-rows: 28px 28px 28px 28px 28px 28px 28px 28px;
		row-gap: 10px;
	}
	div.btn-group {
		display: grid;
		grid-column: 1 / 3;
	}
	div.right-align {
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
	<div id="container">
	<div id="postTitle">${algorithmExplanationVO.postTitle} 해설</div>
	<div class="grid">
		
		<label for="grid1">
			
		</label>
		
		
		<label for="algorithmWriter">작성자</label>
		<div>${algorithmExplanationVO.memberVO.nickname}</div>
		
		<label for="algorithmCategoryId">카테고리</label>
		<div>${algorithmExplanationVO.commonCodeVO.codeContent}</div>
		
		<label for="viewCnt">조회수</label>
		<div>${algorithmExplanationVO.viewCnt}</div>
		
		<label for="postDate">작성일</label>
		<div>${algorithmExplanationVO.postDate}</div>
		
		<label for="postContent">내용</label>
		<div>${algorithmExplanationVO.postContent}</div>
		
		<div class="btn-group">
		    <!-- 로그인 하지 않았을 때 -->
		    <c:if test="${empty sessionScope._LOGIN_USER_}">
		        <a href="/member/auth">로그인하기</a>
		    </c:if>
		    <!-- 해당 게시글을 작성한 기업회원이 로그인 했을 시 -->
		    <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq algorithmExplanationVO.postWriter}">
			    <a href="/algorithm/explanation/update/${algorithmExplanationVO.companyAlgorithmExplanationId}">수정</a>
			    <a href="/algorithm/explanation/delete/${algorithmExplanationVO.companyAlgorithmExplanationId}">삭제</a>
		    </c:if>
		</div>
	</div>
</div>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>