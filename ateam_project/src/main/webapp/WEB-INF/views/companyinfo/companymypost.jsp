<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../layout/header.jsp" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<style>
  /* 메인 컨텐츠 영역 */

	#content_wrapper{
		display: flex;
		justify-content: center;
	}
	#container{
		width: 1100px;
		display: flex; 
		flex-direction: column;
		justify-content: center;
	}

	.flex_button {	
		margin: 100px 50px 0px 0px;
		display: flex;
		flex-direction: column;
	}

	.flex_button button {
	  color: white;	
    background-color: var(--gray);
    width: 150px;
    height: 40px;
    margin-bottom: 15px;
    cursor: pointer;
    border: 2px;
	}
	.flex_button button:hover {
	background-color: var(--light-blue);
  	color: white;
	}

	table th{
		background-color: var(--light-gray);
		height:35px;
		color: var(--dark-gray);
	}
	
	table td{
		border-bottom: 1px solid #D3D3D3;
		color: var(--dark-gray);
		text-align: center;
	}
</style>
<body> 
<div id="content_wrapper">
	<div class="flex_button">
		<button id="myprofile">마이페이지</button>			
		<button id="modify_info">정보 수정</button> 
		<button id="mypost">내가 쓴 게시글</button>
		<button id="quit">탈퇴</button>
	</div>
	<div id="container">
		<table class="grid">
			<caption>알고리즘 문제 게시판</caption>
			<thead>
				<colgroup>
					<col width="5%" />
					<col width="10%" />
					<col width="10%" />
					<col width="30%" />
					<col width="20%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">카테고리</th>
					<th scope="col">난이도</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty algorithmQuestionList.algorithmQuestionList}">
					<c:forEach items="${algorithmQuestionList.algorithmQuestionList}" var="algorithmquestion" varStatus="index">
						<tr>
							<td>${index.index + 1}</td>
							<td>${algorithmquestion.commonCodeVO.codeContent}</td>
							<td>${algorithmquestion.algorithmTierId}</td>
							<td>
								<a href="/algorithm/question/view/${algorithmquestion.companyAlgorithmQuestionId}">
									<c:out value="${algorithmquestion.algorithmTitle}" />
								</a>
							</td>
							<td>${algorithmquestion.memberVO.nickname}</td>
							<td>${algorithmquestion.postDate}</td>
							<td>${algorithmquestion.viewCnt}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">조회된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<table class="grid">
			<caption>알고리즘 해설 게시판</caption>
			<thead>
				<colgroup>
					<col width="5%" />
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty algorithmExplanationList.algorithmExplanationList}">
					<c:forEach items="${algorithmExplanationList.algorithmExplanationList}" var="algorithmexplanation" varStatus="index">
						<tr>
							<td>${index.index + 1}</td>
							<td>${algorithmexplanation.commonCodeVO.codeContent}</td>
							<td>
								<a href="/algorithm/explanation/view/${algorithmexplanation.companyAlgorithmExplanationId}">
									<c:out value="${algorithmexplanation.postTitle}" />
								</a>
							</td>
							<td>${algorithmexplanation.memberVO.nickname}</td>
							<td>${algorithmexplanation.postDate}</td>
							<td>${algorithmexplanation.viewCnt}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">조회된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="../layout/footer.jsp" />
</body>
<script>
  // 스크롤 버튼, IDE
  let calcScrollValue = () => {
  let scrollProgress = document.getElementById('progress')
  let progressValue = document.getElementById('progress-value')
  let pos = document.documentElement.scrollTop
  let calcHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight
  let scrollValue = Math.round((pos * 100) / calcHeight)

  scrollProgress.addEventListener('click', () => {
    document.documentElement.scrollTop = 0
  })
  }
  
  window.onscroll = calcScrollValue

  // 서브 리스트가 있다면? 아래로 떨군다.
  $('.visible').hide()
  $('.list_company').mouseover(function() {
    $('.visible').show()
    $(this).find('a').css({'background-color': 'var(--blue)',
                           'color': 'white',
                           'box-shadow': '0 0 5px var(--gray)'})
  })
  $('.list_company').mouseleave(function() {
    $('.visible').hide()
    $(this).find('a').css({'background-color': 'white',
                           'color': 'var(--blue)',
                           'box-shadow': 'none'})
  })
  
  function redirectToURL(url) {
	window.location.href = url;
  }
  /* 비밀번호, 닉네임 수정 버튼 */
  $("#myprofile").click(function() {
	redirectToURL(`/companyinfo/view`);
  });
  $("#mypost").click(function() {
	redirectToURL(`/companyinfo/mypost`);
  });
  $("#modify_info").click(function() {
	redirectToURL(`/companyinfo/modify`);
  });
  $("#quit").click(function() {
	redirectToURL(`/member/logout`);
  });
</script>
</html>