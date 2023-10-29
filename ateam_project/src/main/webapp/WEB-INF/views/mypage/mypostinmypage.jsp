<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>
<!--브라우저에게 현재 페이지를 가장 최신 버전으로 렌더링-->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--뷰포트는 화면에 표시되는 웹영역 표시, 모바일 등에서 상호작용 할 수있는지 제어-->
<meta name="viewport" id="viewport"
	content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width" />
<!--스타일,폰트 지정-->
<!--스와이퍼 기능 지정-->
<!--스타일 입히기-->
<style>
/* 수정버튼  */
.introduce-modify,#edit_button1,#edit_button2,#delete_tech,
.education-modify,.career-modify,.region_modify
,.profile-modify{
	background-color: var(--gray);
	border: none;
    color: var(--white);
    border-radius: 10px;
    cursor: pointer;
    text-align: center;
    width: 36px;
    height: 26px;
}
.introduce-modify:hover
,#edit_button1:hover
,#edit_button2:hover
,#delete_tech:hover
,.education-modify:hover
,.career-modify:hover
,.region_modify:hover
, .introduce-create:hover 
, #insert_techstack:hover
,#addEducationButton:hover
,.addCareer:hover
,.region_create:hover
,.profile-modify:hover{
  background-color: var(--light-blue);
  color: white;
}
.introduce-create{
background-color: var(--gray);
	border: none;
    color: var(--white);
    border-radius: 10px;
    cursor: pointer;
    text-align: center;
    width: 118px;
    height: 27px;
}
/* 추가하기 */
#insert_techstack, #addEducationButton,.addCareer,.region_create{
	background-color: var(--gray);
    border: none;
    color: var(--white);
    border-radius: 10px;
    cursor: pointer;
    text-align: center;
    width: 67px;
    height: 24px;
}
.flex_button button { 
   background-color:var(--gray); 
   width: 150px; 
   height: 40px; 
  margin-bottom: 15px; 
   cursor: pointer; 
   color: white; 
 } 
table.table {
		border-collapse: collapse;
		margin-top: 30px;
		width:800px;
		margin: 0 auto;
	}

	table th{
		background-color: var(--light-gray);
		border-bottom: 1px solid var(--dark-gray);
		height:35px;
		color: var(--dark-gray);
	}

	table td{
		border-bottom: 1px solid #D3D3D3;
		color: var(--dark-gray);
	}
	table.table th:last-child, table.table td:last-child {
		border-right: none;
	}
	
	table.table > tbody td {
		padding: 10px;
		color: #333;
		text-align: center;
		color: var(--dark-gray);
	}
	caption {
		margin-bottom: 10px;
		margin-top: 10px;
		text-align: left;
	}
	.flex_main {
		display: flex;
		align-items: stretch;
		margin-top: 50px;
	}
</style>
<link rel="stylesheet" type="text/css" href="/css/myProfile.css" />
<!-- 자바스크립트 시작 -->
<jsp:include page="../layout/header.jsp" />
<script type="text/javascript">
	$("#modify_info").click(function() {
	    redirectToURL(`/member/selectmember/${memberVO.email}`);
	});
	$("#myprofile").click(function() {
		redirectToURL(`/memberinfo/view/${memberVO.email}`);
	});
	$("#mypost").click(function() {
        redirectToURL(`/member/mypost`);
    });
</script>
</head>
<body>
	<div id="container">
		<div class="flex_button">
				<button id="myprofile">마이페이지</button>
				<button>북마크</button>
				<button id="modify_info">정보 수정</button>
				<button id="mypost">내가 쓴 게시글</button>
				<button>내가 푼 문제</button>
				<button>탈퇴</button>
		</div>
		<div class="flex_main">
			<table class="table">
				<caption class="qnaboard">QnA 게시판</caption>
				<thead>
					<colgroup>
						<col width="10%" />
						<col width="50%" />
						<col width="20%" />
						<col width="10%" />
					</colgroup>
					<tr id="table-tr">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty qnaPostList}">
						<c:forEach items="${qnaPostList}" var="myqnapost" varStatus="index">
							<tr>
								<td>${index.index + 1}</td>
								<td style="font-weight: bold;">
									<a href="/qnaboard/view/${myqnapost.generalPostId}">
										<c:out value="${myqnapost.postTitle}" />
									</a>
								</td>
								<td>${myqnapost.postDate}</td>
								<td>${myqnapost.viewCnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">등록된 게시글이 없습니다.</td>
						</tr>
						
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<table class="table">
				<caption class="freepost">자유 게시판</caption>
				<thead>
					<colgroup>
						<col width="10%" />
						<col width="50" />
						<col width="20%" />
						<col width="10%" />
					</colgroup>
					<tr id="table-tr">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty freePostList}">
						<c:forEach items="${freePostList}" var="myfreepost" varStatus="index">
							<tr>
								<td>${index.index + 1}</td>
								<td style="font-weight: bold;">
									<a href="/freeboard/view/${myfreepost.generalPostId}">
										<c:out value="${myfreepost.postTitle}" />
									</a>
									
								</td>
								<td>${myfreepost.postDate}</td>
								<td>${myfreepost.viewCnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">등록된 게시글이 없습니다.</td>
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
	//미완성된 기능을 알려주는 모달창
	$('.incomplete').click(function() {
	  $('.modal, .overlay').addClass('modal_active')
	})
	$('.overlay').click(function() {
	  $('.modal, .overlay').removeClass('modal_active')
	})	
	
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