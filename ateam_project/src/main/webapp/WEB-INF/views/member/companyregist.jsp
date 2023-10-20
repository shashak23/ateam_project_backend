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
    
    input[type=file] {
		padding: 0px;
	}
    
</style>
</head>

<body>	
    <h1>기업회원가입</h1>
    <form:form modelAttribute="companyVO" method="post" enctype="multipart/form-data">
    	<div>
    		<form:errors path="companyEmail" element="div" cssClass="errors" />
    		<form:errors path="contactName" element="div" cssClass="errors" />
    		<form:errors path="contactNumber" element="div" cssClass="errors" />
    		<form:errors path="file" element="div" cssClass="errors" />
    	</div>
    	
        <div class="grid">
            <label for="companyEmail">담당자 이메일</label>
            <input id="companyEmail" type="email" name="companyEmail" value="${comapnyVO.companyEmail}" />
      
            <label for="contactName">담당자 이름</label>
            <input id="contactName" type="text" name="contactName" value="${companyVO.contactName}" />

            <label for="contactNumber">담당자 연락처</label>
            <input id="contactNumber" type="text" name="contactNumber" value="${companyVO.contactNumber}" />
       
       		<label for="file">사업자등록증</label>
			<input id="file" type="file" name="file"/>
                        
            <div class="btn-group">
                <div class="right-align">
                    <input type="submit" value="등록" />
                </div>
            </div>
        </div>

    </form:form>
</body>
</html>