<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업정보수정</title>
<style>
	header {
	    background-color: #333;
	    color: white; 
	    padding: 45px; 
	    margin: 20px 0;
	    font-size: 25px; /* 글자 크기 설정 */
	}
	
	#container {
	    display: grid;
	    grid-gap: 30px;
	    grid-template-columns: 300px 1fr;
	}
	
	.flex_button {
	    display: flex;
	    flex-direction: column;
	    margin-left: 120px;
	    justify-content: flex-end; 
	}
	
	.flex_button button {
	    width: 120px;
	    margin-bottom: 10px; 
	}
	
	p {
	    border-bottom: 1px solid #ccc;
	    margin: 0;
	    padding: 8px 0;
	}
</style>
</head>
<body>
<header></header>

<div id="container">
    <div class="flex_button">
        <button>마이페이지</br>겸</br>정보 수정</button>
        <button>기업이 쓴 글</button>
    </div>

    <div class="companyInfo_update_table">
        기업정보수정
	<form:form modelAttribute="companyVO" method="post">
        <p>
            <label for="contactName">담당자 이름 변경</label><br>
            <input type="text" name="contactName" id="contactName" value="${companyVO.contactName}">
            <input type="submit" value="변경완료" />
        </p>
        </form:form>
        	<form:form modelAttribute="companyVO" method="post">
        <p>
            <label for="contactNumber">담당자 연락처 변경</label><br>
            <input type="text" name="contactNumber" id="contactNumber" value="${companyVO.contactNumber}">
            <input type="submit" value="변경완료" />
        </p>
    </form:form>
    <form:form modelAttribute="memberVO" method="post">    
        <p>
            <label for="pw">기업회원 비밀번호 변경</label><br>
            <input type="text" name="pw" id="pw" value="${memberVO.pw}" />
            <input type="submit" value="변경완료" />
        </p>
     </form:form>
    </div>
</div>
</body>
</html>