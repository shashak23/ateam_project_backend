<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>힘들다...</title>
</head>
<body>
    <div>로그인 정보: ${sessionScope._LOGIN_USER_.email}</div>
    <div>개수: ${myAlgorithmList.myAlgotirhmListCnt}</div>
    <div>힝구: ${myAlgorithmList.myAlgorithmList.size()}</div>
    <div>ㅎㅇ: ${myAlgorithmList.myAlgorithmList[0].myAnswer}123</div>

</body>
</html>