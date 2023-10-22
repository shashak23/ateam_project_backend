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
    	
	    ClassicEditor.create( document.querySelector( '#editor' ), {
	       language: "ko"
	    } );
    	
    	// 모달 실행을 위한 문장
        $('.btn-primary').click(function() {
            $('.create_container, .overlay').addClass('active')
        })
        $('.btn-close, .overlay').click(function() {
            $('.create_container, .overlay').removeClass('active')
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
		grid-template-columns: 150px 1fr;
		grid-template-rows: 28px 28px 28px 28px 1fr 50px 28px 1fr 28px 320px;
		row-gap: 10px;
	}
	div.flex {
		display: flex;
		flex-direction: column;
		width: 600px;
	}
	div.grid > div.btn-group {
		display: grid;
		grid-column: 1/ 3;
	}
	div.grid div.right-align {
		text-align: right;
	}
	label {
		padding-left: 10px;
	}
	input, textarea {
		padding: 10px;
		margin: 10px;
	}
	
	.btn-text-right{
        text-align: right;
        }
	
	div.right-content {
	    display: flex;
	    flex-direction: row;
	}
	#result {
		margin-top: 10px;
		display: grid;
		grid-column: 1 / 3;
	}
	
	.btn-primary {
        margin: 30px 15px;
    }

    .create_wrapper {
        display: flex;
        flex-direction: column;
        padding-bottom: 15px;
        border: 1px solid #888;
        margin: 0 15px;
    }
    .anchor {
        display: flex;
    }

    .btn-primary, a {
        padding: 5px 8px;
        text-decoration: none;
        color: #4052f7;
        background-color: #d0eaff;
        margin-right: 15px;
        border-radius: 10px;
        border: 0px;
        font-weight: bold;
        cursor: pointer;
    }

    .create_container {
        visibility: hidden;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -80%);
        z-index: 10;
        box-shadow: 0 0 10px #19191948;
        border: 1px solid;
        width: 500px;
        padding: 30px;
        opacity: 0;
        border: none;
        border-radius: 5px;
        background-color: #ffffff;
        transition: 0.5s;
    }

    .create_container.active {
        visibility: visible;
        opacity: 1;
        transform: translate(-50%, -50%);
    }

    .create_container > * {
        margin-bottom: 10px;
    }

    .btn-close {
        position: absolute;
        top: 6px;
        right: 10px;
        background-color: transparent;
        font-size: 18px;
        color: #888;
        cursor: pointer;
    }

    .btn-close:hover {
        color: #191919;
    }

    .create_title {
        text-align: center;
    }

    #algorithmSolutionContent {
        border: 0px;
        background-color: #e9f3ff;
        width: 100%;
        height: 200px;
        padding: 15px 15px;
        outline: none;
        color: #333;
        resize: none;
    }
    
    #algorithmSolutionContent::placeholder {
        color: #bbb;
    }

    #algorithmSolutionContent:focus::placeholder {
        visibility: hidden;
    }

    .date_wrap {
        display: flex;
        justify-content: space-around;
        align-items: center;
    }

    .overlay {
        background-color: #47474754;
        position: fixed;
        width: 100%;
        height: 100vh;
        top: 0;
        left: 0;
        transition: 0.5s;
        opacity: 0;
        pointer-events: none;
    }

    .overlay.active {
        opacity: 1;
        pointer-events: all;
    }
    div.errors {
        background-color: #ff00004a;
        opacity: 0.8;
        padding: 10px;
        color: #333;
	}
	div.errors:last-child {
	    margin-bottom: 15px;
	}
</style>
<body>
    <jsp:include page="../../member/membermenu.jsp"></jsp:include>
	<h1>알고리즘 문제 내용 조회하기</h1>
	<div class="grid">
		
		<label for="algorithmCategoryId">카테고리</label>
		<div>${algorithmQuestionVO.commonCodeVO.codeContent}</div>
		
		<label for="algorithmTierId">난이도</label>
		<div>${algorithmQuestionVO.algorithmTierId}</div>
		
		<label for="algorithmTitle">제목</label>
		<div>${algorithmQuestionVO.algorithmTitle}</div>
		
		<label for="algorithmWriter">작성자</label>
		<div>${algorithmQuestionVO.memberVO.nickname}</div>
		
		<label for="algorithmContent">문제 내용</label>
		<div>${algorithmQuestionVO.algorithmContent}</div>
		
		<div class="flex">
		
			<div class="btn-text-right">
				<button class="btn btn-primary">문제풀이</button>
				<a href="/algorithm/explanation/list">알고리즘 해설 보러가기</a>
			</div>
			
			<form:form modelAttribute="myAlgorithmVO" method="post">	
			<div>
				<form:errors path="myAnswer" element="div" cssClass="errors" />
			</div>
			    <label for="myAnswer">답변</label> <!-- 웹IDE 테이블에 신규생성? -->
			    <textarea name="myAnswer" id="editor" placeholder="답변을 작성해주세요.">${myAlgorithmVO.myAnswer}</textarea>
			    <!-- 일반회원이 로그인 했을 시 -->
			    <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'GENERAL_MEMBER'}">
			        <input type="submit" id="submit" value="제출 후 채점하기" />
				</c:if>
			</form:form>
			
		</div>
	</div>
	<div class="grid">
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
				    
				</div>
		</div>
	</div>
	
	<div class="create_container">
        <div class="btn-close">&times;</div>
        <h1 class="create_title">문제 풀이</h1>
        <div>
            ${algorithmQuestionVO.algorithmSolution}
        </div>
    </div>
    <div class="overlay"></div>
	
		
</body>
</html>