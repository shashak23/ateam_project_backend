<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <jsp:include page="../../member/membermenu.jsp"></jsp:include>
    <form id="search-form"
	      method="get"
	      action="/companymypost/list">
	      	<div>
			    <select name="searchType">
			        <option value="myPostTitle" ${searchCompanyMyPostVO.searchType eq 'algorithmTitle' ? 'selected':''}>제목</option>
			        <option value="myPostContent" ${searchAlgorithmQuestionVO.searchType eq 'algorithmContent' ? 'selected':''}>내용</option>
			      
			    </select>
			    <input type="text" name="searchKeyword" value="${searchAlgorithmQuestionVO.searchKeyword}"/>
			    <button id="search-btn">검색</button>
	      </div>
	</form>
</body>
</html>