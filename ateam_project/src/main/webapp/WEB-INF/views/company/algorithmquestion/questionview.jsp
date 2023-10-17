<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 문제 내용 조회</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
    $().ready(function() {
    	
    	var result = 'aaa'
    	
    	// 제출버튼 클릭
    	$("#submit").click(function() {
    		$("#result").val(result)
    	})
    })
</script>
</head>
<style>
    .ck-editor__editable { 
        height: 400px;
    }
    .ck-content { 
        font-size: 12px; 
    }
    
	* {
		color: #333;
		font-size: 17px;
	}

	div.grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		grid-template-rows: 28px 28px 28px 28px 1fr 1fr 320px 1fr;
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
		padding: 10px;
	}
	
	div.right-content {
	    display: flex;
	    flex-direction: row;
	}
	
</style>
<body>
    <jsp:include page="../../member/membermenu.jsp"></jsp:include>
	<h1>알고리즘 문제 내용 조회하기</h1>
	<div class="grid">
		
		<label for="algorithmCategoryId">카테고리</label>
		<div>${algorithmQuestionVO.algorithmCategoryId}</div>
		
		<label for="algorithmTierId">난이도</label>
		<div>${algorithmQuestionVO.algorithmTierId}</div>
		
		<label for="algorithmTitle">제목</label>
		<div>${algorithmQuestionVO.algorithmTitle}</div>
		
		<label for="algorithmWriter">작성자</label>
		<div>${algorithmQuestionVO.memberVO.nickname}</div>
		
		<label for="algorithmContent">문제 내용</label>
		<div>${algorithmQuestionVO.algorithmContent}</div>
		
		<form:form modelAttrivute="myAlgorithmVO" method="post">
		    <input type="hidden" name="myAlgorithmQuestionId" value="myAlgorithmVO.myAlgorithmQuestionId" />
		
		    <label for="myAnswer">답변</label> <!-- 웹IDE 테이블에 신규생성? -->
		    <textarea name="myAnswer" id="editor" placeholder="답변을 작성해주세요." value="${myAlgorithmVO.myAnswer}"></textarea>
            <script>
			    ClassicEditor.create( document.querySelector( '#editor' ), {
			       language: "ko"
			    } );
			</script>
		</form:form>
		
		<!-- 추후 작업 -->
		<label for="result" id="result" >실행결과</label>
		<textarea name="result">${result}</textarea>
		
		
		<div class="btn-group">
				<div class="right-align">
				    <!-- 로그인 하지 않았을 때 -->
				    <c:if test="${empty sessionScope._LOGIN_USER_}">
				        <a href="/member/auth">로그인하기</a>
				    </c:if>
				    <!-- 해당 게시글을 작성한 기업회원이 로그인 했을 시 -->
				    <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq algorithmQuestionVO.algorithmWriter}">
					    <a href="/algorithm/question/update/${algorithmQuestionVO.companyAlgorithmQuestionId}">수정</a>
					    <a href="/algorithm/question/delete/${algorithmQuestionVO.companyAlgorithmQuestionId}">삭제</a>
				    </c:if>
				    <!-- 일반회원이 로그인 했을 시 -->
				    <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'GENERAL_MEMBER'}">
				        <input type="submit" id="submit" value="제출 후 채점하기" />
				    </c:if>
				</div>
		</div>
	</div>
	
	
	
		
</body>
</html>