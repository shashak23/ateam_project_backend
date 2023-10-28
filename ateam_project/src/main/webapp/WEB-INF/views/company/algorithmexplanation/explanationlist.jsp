<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
$().ready(function() {
	$.get("/code/알고리즘카테고리", function(response) {
		for (var i = 0; i < response.length; i++) {
			var code = response[i]
			var checkbox = $("<input type='checkbox' id='"+code.codeId+"' name='algorithmCategoryIdList' value='"+code.codeId+"' />");
			var label = $("<label for='"+code.codeId+"'>"+code.codeContent+"</label>");
			var space = $("<span class='checkbox-space'> </span>");
			$("#algorithm_category").append(checkbox);
			$("#algorithm_category").append(label);
			$("#algorithm_category").append(space);
		}
	});
	
	document.querySelectorAll('input[type="checkbox"]:checked')
	const ul = document.querySelector('ul')
	let selected = [];
	
	ul.addEventListener('change', event => {
		if(event.target.type == 'checkbox') {
			const checked = document.querySelectorAll('input[type="checkbox"]:checked')
			selected = Array.from(checked).map(x => x.value)
		}
	})
	
	$("#search_btn").click(function() {
		$("#search_form").attr({
			"method": "get",
			"action": "/algorithm/explanation/list"
		}).submit()
	});
	
})
</script>
</head>
<style>
	.checkbox-space {
    margin-right: 5px;
}
	#container{
		width: 800px;
		height:1000px;
		margin-top: 40px;
		margin:0 auto;
	}

	h3{
		margin-top: 30px;
	}

	#algorithm_category{
		margin-top: 10px;
		margin-bottom: 20px;
	}
	a:link, a:hover, a:active, a:visited {
		color: #333;
		text-decoration: none;
	}

	.search_area > #search_form > .type{
		width:50px;
		height:40px;
		transition: box-shadow 0.3s ease;
		border-radius: 4px;
	}

	.search_area > #search_form > .type:hover{
		border: 2px solid #1E90FF; 
	}

	.search_area > #search_form > #search_bar{
		width: 500px;
		height:40px;
		transition: box-shadow 0.3s ease;
		padding:6px;	
	}

	.search_area > #search_form > #search_bar:hover{
		border: 2px solid #1E90FF; 
	}

	.search_area > #search_form > #search_btn{
		width:50px;
		height:40px;
		border:0.5px;
		border-radius: 6px;
		transition: box-shadow 0.3s ease;
	}

	.search_area > #search_form > #search_btn:hover{
		border: 2px solid #1E90FF; 
	}

	.search_area > #search_form > .gohome > .reset{
		width:40px;
		height:40px;
		margin-top: 10px;
		
	}

	table.table {
		border-collapse: collapse;
		border: 1px solid #DDD;
		font-size: 14px;
		margin-top: 20px;
		width:800px;
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
	<div id="container">
		<div class="search_area">
			<form id="search_form"
				method="get"
				action="/algorithm/explanation/list">
				<label for="algorithmCategoryId" id="algorithmCategoryId">
					<h3>상세검색</h3>
				</label>

				<div id="algorithm_category"></div>	

				<select class="type" name="searchType">
					<option value="postTitle" ${searchAlgorithmExplanationVO.searchType eq 'postTitle' ? 'selected' : ''}>제목</option>
					<option value="postContent" ${searchAlgorithmExplanationVO.searchType eq 'postContent' ? 'selected' : ''}>내용</option>
					<option value="postWriter" ${searchAlgorithmExplanationVO.searchType eq 'postWriter' ? 'selected' : ''}>작성자</option>
				</select>

				<input id="search_bar" type="text" name="searchKeyword" value="${searchAlgorithmExplanationVO.searchKeyword}" />

				<button id="search_btn">검색</button>

				<a href="/algorithm/explanation/list" class="gohome">
					<img src="/images/reset.png" alt="검색초기화" class="reset">
				</a>
			</form>
			
		</div>	
	<div class="btn-group">
		<div class="right-align">
			<!-- 로그인 하지 않았을 때
		    <c:if test="${empty sessionScope._LOGIN_USER_}">
		        <a href="/member/auth">로그인하기</a>
		    </c:if> -->
			<!-- 기업회원에게만 보임 -->
			<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'COMPANY'}">
				<a href="/algorithm/explanation/create">게시글 등록</a>
			</c:if>
		</div>
	</div>
	<table class="table">
		<thead>
			<colgroup>
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>제목</th>
				<th>카테고리</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
		<c:choose>
			<c:when test="${not empty algorithmExplanationList.algorithmExplanationList}">
				<c:forEach items="${algorithmExplanationList.algorithmExplanationList}" var="algorithmexplanation">
					<tr>
						<td style="font-weight: bold;">
							<a href="/algorithm/explanation/view/${algorithmexplanation.companyAlgorithmExplanationId}">
								<c:out value="${algorithmexplanation.postTitle}" />
							</a>
						</td>
						<td>${algorithmexplanation.commonCodeVO.codeContent}</td>
						<td>${algorithmexplanation.memberVO.nickname}</td>
						<td>${algorithmexplanation.postDate}</td>
						<td>${algorithmexplanation.viewCnt}</td>
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
	</div>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>