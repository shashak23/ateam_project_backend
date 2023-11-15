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
	table.table th:last-child, table.table td:last-child {
		border-right: none;
	}
</style>
<body> 

<div id="content_wrapper">
	<div class="flex_button">
			<button id="myprofile">마이페이지</button>
			<button id="bookmark">북마크</button>
			<button id="modify_info">정보 수정</button> 
			<button id="mypost">내가 쓴 게시글</button>
			<button id="solve">내가 푼 문제</button>
			<button>탈퇴</button>
	</div>
  <div id="container">   
		<table class="grid">
			<caption>질답게시판</caption>
			<thead>
				<colgroup>
					<col width="10%" />
					<col width="45%" />
					<col width="15%" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty qnaPostList}">
					<c:forEach items="${qnaPostList}" var="qnaboard" varStatus="index">
						<tr>
							<td>${index.index + 1}</td>
							<td>
								<a href="/qnaboard/view/${qnaboard.generalPostId}">
									<c:out value="${qnaboard.postTitle}" />
								</a>
							</td>
							<td>${qnaboard.memberVO.nickname}</td>
							<td>${qnaboard.postDate}</td>
							<td>${qnaboard.viewCnt}</td>
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
			<caption>자유게시판</caption>
			<thead>
				<colgroup>
					<col width="10%" />
					<col width="45%" />
					<col width="15%" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty freePostList}">
					<c:forEach items="${freePostList}" var="freeboard" varStatus="index">
						<tr>
							<td>${index.index + 1}</td>
							<td>
								<a href="/freeboard/view/${freeboard.generalPostId}">
									<c:out value="${freeboard.postTitle}" />
								</a>
							</td>
							<td>${freeboard.memberVO.nickname}</td>
							<td>${freeboard.postDate}</td>
							<td>${freeboard.viewCnt}</td>
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
</script>
</html>