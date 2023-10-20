<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 문제 게시판</title>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$.get("/code/알고리즘카테고리", function(response) {
			for (var i = 0; i < response.length; i++) {
				var code = response[i]
				var checkbox = $("<input type='checkbox' id='"+code.codeId+"' name='algorithmCategoryIdList' value='"+code.codeId+"' />");
				var label = $("<label for='"+code.codeId+"'>"+code.codeContent+"</label>");
				$("#algorithm_category").append(checkbox);
				$("#algorithm_category").append(label);
			}
		});
		
		$.get("/member/COMPANY", function(response) {
			for (var i = 0; i < response.length; i++) {
				var member = response[i]
				var option = $("<option value='"+member.nickname+"'></option>");
				$("#nicList").append(option);
			}
		});
		
		$("#search-btn").click(function() {
			$("#search-form").attr({
				"method": "get",
				"action": "/algorithm/question/list"
			}).submit()
		});
		
	})
</script>
</head>
<style>
	a:link, a:hover, a:active, a:visited {
		color: #333;
		text-decoration: none;
	}

	table.table {
		border-collapse: collapse;
		border: 1px solid #DDD;
		font-size: 14px;
	}
	table.table > thead > tr {
		background-color: #FFF;
	}
	table.table > thead th {
		padding: 10px;
		color:#333;
	}
	table.table th, table.table td {
		border-right: 1px solid #F0F0F0;
	}
	table.table th:last-child, table.table td:last-child {
		border-right: none;
	}
	table.table > tbody tr:nth-child(odd) {
		background-color: #f5f5f5;
	}
	table.table > tbody tr:hover {
		background-color: #FAFAFA;
	}
	table.table > tbody td {
		padding: 10px;
		color: #333;
	}
	
</style>
<body>
    <jsp:include page="../../member/membermenu.jsp"></jsp:include>
    <label for="algorithmCategoryId">알고리즘 카테고리</label>
	<div id="algorithm_category"></div>
    
    <label for="algorithmTier">문제 난이도</label>
    <div>
        <input type="checkbox" name="algorithmTier" value="Lv.1"/>Lv.1
        <input type="checkbox" name="algorithmTier" value="Lv.2"/>Lv.2
        <input type="checkbox" name="algorithmTier" value="Lv.3"/>Lv.3
        <input type="checkbox" name="algorithmTier" value="Lv.4"/>Lv.4
        <input type="checkbox" name="algorithmTier" value="Lv.5"/>Lv.5
    </div>
    
    <label for="company">기업명</label>
    <form id="search-form"
	      method="get"
	      action="/algorithm/question/list">
	      <div>
		      <input autocomplete="off" type="text" name="searchKeyword" list="nicList" />
		      <datalist id="nicList"></datalist>
		      <button id="search-btn">검색</button>
	      </div>
	</form>
	
	<div class="btn-group">
		<div class="right-align">
			<!-- 로그인 하지 않았을 때 -->
		    <c:if test="${empty sessionScope._LOGIN_USER_}">
		        <a href="/member/auth">로그인하기</a>
		    </c:if>
			<!-- 기업회원에게만 보임  -->
			<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'COMPANY'}">
				<a href="/algorithm/question/create">게시글 등록</a>
			</c:if>
		</div>
	</div>
	
	<table class="table">
		<thead>
			<colgroup>
				<col width="190px" />
				<col width="100px" />
				<col width="200px" />
				<col width="500px" />
				<col width="70px" />
				<col width="80px" />
			</colgroup>
			<tr>
				<th>카테고리</th>
				<th>작성자</th>
				<th>문제 제목</th>
				<th>문제 내용 미리보기</th>
				<th>난이도</th>
				<th>정답률</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${not empty algorithmQuestionList.algorithmQuestionList}">
				<c:forEach items="${algorithmQuestionList.algorithmQuestionList}" var="algorithmquestion">
					<tr>
						<td>${algorithmquestion.commonCodeVO.codeContent}</td>
						<td>${algorithmquestion.memberVO.nickname}</td>
						<td style="font-weight: bold;">
							<a href="/algorithm/question/view/${algorithmquestion.companyAlgorithmQuestionId}">
								<c:out value="${algorithmquestion.algorithmTitle}" />
							</a>
						</td>
						<td>${algorithmquestion.algorithmContent}</td>
						<td>${algorithmquestion.algorithmTierId}</td>
						<td>정답률</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">등록된 게시글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	


</body>
</html>