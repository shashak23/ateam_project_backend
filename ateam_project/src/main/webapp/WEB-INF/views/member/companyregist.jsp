<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원가입</title>
<style type="text/css">
    div.grid {
        display: grid;
        grid-template-columns: 120px 1fr;
        grid-template-rows: 28px 28px 28px 28px 1fr;
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

    button, input {
        padding: 10px;
        border: 1px solid #CCC;
    }
    
    div.errors {
    	background-color: #FF00004A;
    	opacity: 0.8;
    	padding: 10px;
    	color: #333;
    }
    
    div.errors:last-child {
    	margin-bottom: 15px;
    }

    .available {
        background-color: #0F03;
    }

    .unusable {
        background-color: #F003;
    }
</style>
</head>

<body>	
    <h1>기업회원가입</h1>
    <form:form modelAttribute="companyVO" method="post">
    	<div>
    		<form:errors path="email" element="div" cssClass="errors" />
    	</div>
    	
        <div class="grid">
            <label for="email">담당자 이메일</label>
            <input id="email" type="email" name="email" value="${comapnyVO.companyEmail}" />
      
            <label for="name">담당자 이름</label>
            <input id="name" type="text" name="name" value="${companyVO.contactName}" />

            <label for="contact">담당자 연락처</label>
            <input id="contact" type="text" name="contact" value="${companyVO.contactNumber}" />
       
       		<!-- 사업자 등록증 -->
                        
            <div class="btn-group">
                <div class="right-align">
                    <input type="submit" value="등록" />
                </div>
            </div>
        </div>

    </form:form>
</body>
</html>