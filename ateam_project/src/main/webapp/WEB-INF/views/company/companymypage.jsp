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
<link rel="stylesheet" type="text/css" href="/css/myProfile.css" />
<!-- 자바스크립트 시작 -->
<jsp:include page="../layout/header.jsp" />
</head>
<body>
	<div id="container">
		<div class="flex_button">
			<button>마이페이지</button>
			<button>스크랩</button>
			<button id="modify_info">정보 수정</button>
			<button>내가 푼 문제</button>
			<button>마이 팀</button>
		</div>
		<div class="flex_main">
			<div class="follow_chat">
				<!-- <button class="follow_icon">
						<img src="https://cdn-icons-png.flaticon.com/512/907/907873.png">
						팔로우
					 </button> 일단 보류 -->
				<div>
					<c:choose>
						<c:when test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
       						<button id="reportUser" value="5" class="report-btn" style="display: none;">신고</button>
						</c:when>
						<c:otherwise>
							<button id="reportUser" value="5" class="report-btn">신고</button>	
						</c:otherwise>
					</c:choose>
				</div>
				<!-- 모달 창 -->
				<div class="report-modal" id="report-modal">
				<h2>신고 내용</h2>
				<form name="reportVO" method="post" action="/report/view/5">
					<div>
						<label for="reportReason">신고사유${reportVO.reportReason} <select
							name="reportReason">
								<option value="CC-20231018-000200">영리 및 홍보 목적</option>
                                <option value="CC-20231018-000201">개인정보노출</option>
                                <option value="CC-20231018-000202">음란성/선정성</option>
                                <option value="CC-20231018-000203">같은 내용 반복(도배)</option>
                                <option value="CC-20231018-000204">이용규칙위반</option>
                                <option value="CC-20231018-000205">기타</option>
						</select>
						</label> <label for="reportReasonContent">신고 상세내용 <textarea
								name="reportReasonContent" id="reportReasonContent">${reportVO.reportReasonContent}</textarea></label>

						<label for="attachedImg">첨부파일${reportVO.attachedImg}</label> <input
							id="attachedImg" type="file" name="attachedImg" /> <label
							for="reportTypeId">${reportVO.reportTypeId}</label> <input
							id="reportTypeId" type="hidden" name="reportTypeId" value="1" />

						<label for="reportMemberEmail">${reportVO.reportMemberEmail}</label>
						<input id="reportMemberEmail" type="hidden" name="reportMember"
							value="${reportVO.reportMember}" /> <label
							for="receivedReportMemberEmail">${reportVO.receivedReportMemberEmail}</label>
						<input id="receivedReportMemberEmail" type="hidden"
							name="receivedReportMember" value="${memberVO.email}" />

						<label for="reportContentId">${reportVO.reportContentId}</label> <input
							id="reportContentId" type="hidden" name="reportContentId"
							value="${careerVO.generalMemberEmail}" />
					</div>
					<div class="btn-group">
						<div class="right-align">
							<input type="submit" value="완료" />

						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
		<button class="message_icon">✉ 메시지</button>
	</div>
	<div class="profile">
		<c:choose>
			<c:when
				test="${memberVO.profilePic eq 'https://w7.pngwing.com/pngs/384/868/png-transparent-person-profile-avatar-user-basic-ui-icon.png'}">
				<img src="${memberVO.profilePic}" />
			</c:when>
			<c:otherwise>
				<img src="/member/file/download/${memberVO.email}" />
			</c:otherwise>
		</c:choose>
		<div>
			<c:if
				test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
				<button data-pic-id="${sessionScope._LOGIN_USER_.email }" class="profile-modify">프사수정</button>
			</c:if>
			<div>
				<ul class="introduction_list">
					<li class="list_name">
						<h2>${memberVO.nickname}</h2>
					</li>
					<c:choose>
						<c:when test="${not empty generalMemberVO.selfIntro}">
							<li class="list_intro">${generalMemberVO.selfIntro}<c:if
									test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
									<button data-introduce-id="${sessionScope._LOGIN_USER_.email }" class="introduce-modify">수정</button>
								</c:if>
							</li>
						</c:when>
						<c:otherwise>
							<li class="list_intro"><c:if
									test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
									<button data-introduce-id="${sessionScope._LOGIN_USER_.email }" class="introduce-create">
									자기소개 추가하기
									</button>
								</c:if></li>
						</c:otherwise>

					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	<div class="follow">
		<a href="#">팔로워</a> <a href="#">팔로잉</a>
		<p></p>
	</div>
	<div class="related_link">
		<a href="${generalMemberVO.githubUrl}"><img
			src="https://cdn-icons-png.flaticon.com/512/25/25231.png"
			alt="Icon 1"></a> <a href="${generalMemberVO.additionalEmail}"><img
			src="https://w7.pngwing.com/pngs/863/247/png-transparent-email-computer-icons-email-miscellaneous-angle-text.png"
			alt="Icon 2"> </a> <a href="${generalMemberVO.blogUrl}"><img
			src="https://i.pinimg.com/originals/f8/0b/dd/f80bdd79a51358da6ee41a0fda520394.png"
			alt="Icon 3"></a>
		<c:if
			test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
			<button data-sns="${sessionScope._LOGIN_USER_.email }" id="edit_button1"> 
				<img
					src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png" />
			</button>
		</c:if>
	</div>
	<div class="show_pwf">
		<p></p>
		<button>
			<h2>프로필</h2>
		</button>
		<button>
			<h2>글</h2>
		</button>
		<button>
			<h2>팔로잉</h2>
		</button>
		<p></p>
	</div>
	<div id="technology_stack">
		<p>기술스택</p>
		<ul>
			<c:choose>
				<c:when test="${not empty commonCodeList}">
					<c:forEach items="${commonCodeList}" var="commonCode">
						<li>#${commonCode.codeContent}</li>
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button data-teach="${sessionScope._LOGIN_USER_.email }" id="edit_button2"> 
						수정
						</button>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
							test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
							<button id="insert_techstack">추가하기</button>
						</c:if></li>
				</c:otherwise>

			</c:choose>
		</ul>
	</div>
	<div class="education">
		<p>학력</p>
		<ul>
			<c:choose>
				<c:when test="${not empty educationList}">
					<c:forEach items="${educationList}" var="education">
						<li>${education.schoolName}-${education.schoolDepartment }
							${education.degrees } <c:if
								test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
								<button data-education-id="${education.educationId}" class="education-modify">수정</button>
							</c:if>
						</li>

					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button id="addEducationButton">추가하기</button>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button id="addEducationButton">추가하기</button>
					</c:if></li>
				</c:otherwise>

			</c:choose>
		</ul>
	</div>
	<div class="career">
		<p>경력</p>
		<ul>
			<c:choose>
				<c:when test="${not empty careerList}">
					<c:forEach items="${careerList}" var="career">
						<li>${career.previousCompanyName}-${career.jobTitle }
						<li class="career_list_year">${career.hireDate}~
							${career.resignDate} <c:if
								test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
								<button data-career="${career.careerId}" class="career-modify">수정</button>
								
							</c:if>
						</li>
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button class="addCareer">추가하기</button>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
							test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
							<button class="addCareer">추가하기</button>
						</c:if></li>
				</c:otherwise>

			</c:choose>
		</ul>
	</div>
	<div class="education">
		<p>
			주소
			<button id="edit_button5">
				<img
					src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png">
			</button>
		</p>

		<ul>
			<c:choose>
				<c:when test="${not empty generalMemberVO.region}">
					<li>${generalMemberVO.region}</li>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button data-region="${sessionScope._LOGIN_USER_.email }" class="region_modify"> 
						수정
						</button>
					</c:if>
				</c:when>
				<c:otherwise>
					<li>
					<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button data-region-id="${sessionScope._LOGIN_USER_.email }" class="region_create"> 
						추가하기
						</button>
						</c:if></li>
				</c:otherwise>
			</c:choose>
		</ul>
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