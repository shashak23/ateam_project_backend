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
.techstack-font, .education-font, .career-font, .region-font{
    font-family: 'Noto Sans KR', sans-serif;
    margin-top: 10px;
    margin-bottom: 10px;
}
.profile-fix{
    position: relative;
}
.profile-modify{
position: absolute;
    top: 6%;
    left: 83%;
    transform: translate(-50%, -50%);
}

</style>
<link rel="stylesheet" type="text/css" href="/css/myProfile.css" />
<!-- 자바스크립트 시작 -->
<jsp:include page="../layout/header.jsp" />
<script type="text/javascript">
//신고버튼
	$().ready(function() {
	    // "신고" 버튼 클릭 시 모달 열기
	    $(".report-btn").click(function() {
	       let reportType = $("#reportUser").val()
	       console.log(reportType);
	        $("#report-modal").css({
	           "visibility": "visible",
	           "opacity": "1"
	        });
	    
	       // 모달 내부 "취소" 버튼 클릭 시 모달 닫기
	       $(".close").click(function() {
	          /* console.log("!") */
	           $("#report-modal").css({
	              "visibility": "hidden",
	              "opacity": "0"
	           });
	         });
	    });
	    
	    function redirectToURL(url) {
	        window.location.href = url;
	    }
	    /* 비밀번호, 닉네임 수정 버튼 */
	    $("#modify_info").click(function() {
	        redirectToURL(`/member/selectmember/${memberVO.email}`);
	    });
	    /* 프로필 사진 수정 */ 
	  	$('.profile-modify').click(function() {
	        var email = $(this).data('pic-id');
	        var url = '/memberInfo/modify/modify-profile-pic/' + email;
       		window.location.href = url;
   		 });
	    /* 자기소개 수정*/
	  	$('.introduce-modify').click(function() {
	        var email = $(this).data('introduce-id');
	        var url = '/memberInfo/modify/update-introduction/' + email;
       		window.location.href = url;
   		 });
	    /* 자기소개 추가 */
	    $(".introduce-create").click(function() {
	    	 var email = $(this).data('introduce-id');
		     var url = '/memberInfo/modify/update-introduction/' + email;
	       	 window.location.href = url;
	    });
	    /* git, email, blog 새창으로 열기 */
	    $("#githubIcon").click(function() {
        	 var githubUrl = "${generalMemberVO.githubUrl}";
        	 if (githubUrl) {
        		 window.open(githubUrl, "_blank");
        		 }
    	});
    	$("#emailIcon").click(function() {
        	 var emailUrl = "${generalMemberVO.additionalEmail}";
        	 if (emailUrl) {
            	window.open(emailUrl, "_blank");
        		}
    	});
    	$("#blogIcon").click(function() {
        	 var blogUrl = "${generalMemberVO.blogUrl}";
        	 if (blogUrl) {
                window.open(blogUrl, "_blank");
        		}
   		});
		
	     /* git,email,blog 수정버튼 */
	 	 $("#edit_button1").click(function() {
	    	 var email = $(this).data('sns');
		     var url = '/memberInfo/modify/update-sns-link/' + email;
	       	 window.location.href = url;
	    });
	    /* 기술스택 수정버튼 */
	     $("#edit_button2").click(function() {
	    	 var email = $(this).data('teach');
		     var url = '/memberInfo/modify/update-tech/' + email;
	       	 window.location.href = url;
	    });
	    /* 기술스택 삭제버튼 */
	     $("#delete_tech").click(function() {
	    	 var email = $(this).data('deleteteach');
		     var url = '/memberInfo/modify/delete-tech/' + email;
	       	 window.location.href = url;
	    });
	    
	    /* 기술스택 추가버튼 */
	    $("#insert_techstack").click(function() {
	        redirectToURL(`/memberInfo/modify/create-tech-stack`);
	    });
	    /* 채팅 */
	    $(".message_icon").click(function() {
	    	inviteUser(send, userName, email, "${memberVO.email}");
	    });
	    /* 학력 수정*/
	    $('.education-modify').click(function() {
	        var educationId = $(this).data('education-id');
	        var url = '/memberInfo/modify/update-education/' + educationId;
	        window.location.href = url;
    	});
	    /* 학력 추가 */
	    $('#addEducationButton').click(function() {
	        window.location.href = '/memberInfo/modify/create-education';
	    });
	    /* 경력 수정*/
	    $('.career-modify').click(function() {
	        var careerId = $(this).data('career');
	        var url = '/memberInfo/modify/update-career/' + careerId;
	        window.location.href = url;
    	});
	    /* 경력추가*/
	    $('.addCareer').click(function() {
	        window.location.href = '/memberInfo/modify/create-career';
	    });
	    /* 주소 수정*/
	    $('.region_modify').click(function() {
	        var email = $(this).data('region');
	        var url = '/memberInfo/modify/update-location/' + email;
	        window.location.href = url;
    	});
	    /* 주소 추가 */ 
	  	$('.region_create').click(function() {
	        var email = $(this).data('region-id');
	        var url = '/memberInfo/modify/create-location/' + email;
       		window.location.href = url;
   		 });
	});
</script>
</head>
<body>
	<div id="container">
		<div class="flex_button">
			<c:if
				test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
				<button>마이페이지</button>
				<button>북마크</button>
				<button id="modify_info">정보 수정</button>
				<button>내가 쓴 게시글</button>
				<button>내가 푼 문제</button>
				<button>탈퇴</button>
			</c:if>
		</div>
		<div class="flex_main">
			<div class="follow_chat">
				<button class="follow_icon">
						<img src="https://cdn-icons-png.flaticon.com/512/907/907873.png">
						팔로우
					 </button> 
				<%-- <c:choose>
					<c:when
						test="${not empty emptysessionScope._LOGIN_USER_.email eq memberVO.email}">
						<!-- a유저가 로그인한 경우에만 신고 버튼을 표시합니다. -->
						<form action="/reportUser" method="post">
							<input type="hidden" id="reportUser"
								value="${empty sessionScope._LOGIN_USER}">
							<button type="submit" class="report-btn" value="5">신고</button>
						</form>
					</c:when>
					<c:otherwise>
						<!-- a유저가 로그인하지 않은 경우에는 신고 버튼을 표시하지 않습니다. -->
					</c:otherwise>
				</c:choose>
				<button id="reportUser" value="5" class="report-btn">신고</button> --%>
				<!-- 모달 창 -->
				<%-- <h2>신고 내용</h2>
				<form name="reportVO" method="post" action="/report/view/5">
					<div>
						<label for="reportReason">신고사유${reportVO.reportReason} <select
							name="reportReason">
								<option value="6">영리 및 홍보 목적</option>
								<option value="7">개인정보노출</option>
								<option value="8">음란성/선정성</option>
								<option value="9">같은 내용 반복(도배)</option>
								<option value="10">이용규칙위반</option>
								<option value="11">기타</option>
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
							name="receivedReportMember" value="${generalPostVO.postWriter}" />

						<label for="reportContentId">${reportVO.reportContentId}</label> <input
							id="reportContentId" type="hidden" name="reportContentId"
							value="${generalPostVO.generalPostId}" />
					</div>
					<div class="btn-group">
						<div class="right-align">
							<input type="submit" value="완료" />

						</div>
					</div>
				</form>  --%>
				<button class="message_icon">✉ 메시지</button>
			</div>
	
	<div class="profile">
	<div class="profile-fix">
		<c:choose>
			<c:when
				test="${memberVO.profilePic eq 'https://w7.pngwing.com/pngs/384/868/png-transparent-person-profile-avatar-user-basic-ui-icon.png'}">
				<img src="${memberVO.profilePic}" />
			</c:when>
			<c:otherwise>
				<img src="/member/file/download/${memberVO.email}" />
			</c:otherwise>
		</c:choose>
		<c:if
				test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
				<button data-pic-id="${sessionScope._LOGIN_USER_.email }" class="profile-modify">
				수정
				</button>
		 </c:if>
	</div>
		<div>
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
									<button data-introduce-id="${sessionScope._LOGIN_USER_.email }" class="introduce-create" ">
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
		<img src="https://cdn-icons-png.flaticon.com/512/25/25231.png" alt="Icon 1" id="githubIcon">
        <img src="https://w7.pngwing.com/pngs/863/247/png-transparent-email-computer-icons-email-miscellaneous-angle-text.png" alt="Icon 2" id="emailIcon">
        <img src="https://i.pinimg.com/originals/f8/0b/dd/f80bdd79a51358da6ee41a0fda520394.png" alt="Icon 3" id="blogIcon">
		<c:if
			test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
			<button data-sns="${sessionScope._LOGIN_USER_.email }" id="edit_button1"> 
				수정
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
		<h3 class="techstack-font">기술스택</h3>
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
						<button data-deleteteach="${sessionScope._LOGIN_USER_.email }" id="delete_tech"> 
						삭제
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
		<h3 class="education-font">학력</h3>
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
		<h3 class="career-font">경력</h3>
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
	<div class="region">
		<h3 class="region-font">주소</h3>

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