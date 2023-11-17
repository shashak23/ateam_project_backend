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
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<style>
@charset "utf-8";
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');/*글꼴을 가져오는 페이지*/

.flex_button {
  display: flex;
  flex-direction: column;
  margin-right: 120px;
  
}
.flex_button button {
	background-color:var(--gray);
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

.flex_button button:first-child {
  margin-top: 51px;
}

.follow_chat {
  text-align: right;
}
.follow_icon{
	height: 30px;
    border: none;
    border-radius: 5px;
	cursor: pointer;
	width: 70px;
}
.follow_icon>img ,.message_icon>img{
  width: 15px;
}
.message_icon{
	width: 70px;
	height: 30px;
	background-color:  rgb(231,231,231);
	justify-content: center;
	border-radius: 5px;
	display: flex;
	padding: 5px;
	border: none;
	font-weight: bold;
	cursor: pointer;
}


.profile {
  position: relative;
  display: grid;
  grid-template-columns: 170px 20px 1fr;
  margin: 20px;
}

#profile-img,
#nomal-img {
  width: 150px;
  height: 150px;
  border-radius: 50%;
}

.follow>p {
  padding-bottom: 5px;
}

.introduction_list {
	margin-top: 62px;
  padding: 0px;
  list-style: none;
  grid-gap: 20px;
  width: 1200px;
}

.follow a {
  text-decoration: none;
  color: #000;
}
.follow a:first-child{
  margin-left: 50px;
}

.related_link img {
  width: 30px;
  margin-right:7px;
}

.related_link a {
  text-decoration: none;
  color: #333;
  margin-right: 10px;

}

.show_pwf {
  display: grid;
  grid-template-columns: 1fr 250px 250px 250px 1fr;
}

.show_pwf button {
  background-color: transparent;
  border: none;
  cursor: pointer;
  padding-top: 30px;
  text-decoration: none;
  color: #575555;
  position: relative;
}

.show_pwf button>h2 {
  margin-bottom: 0px;
}

.show_pwf button:hover::after {
  content: "";
  position: absolute;
  bottom: -5px;
  left: 0;
  right: 0;
  height: 4px;
  background-color: orange;
  transform: scaleX(0.55);
}

#technology_stack {
  margin-top: 70px;
  border-bottom: 0.0625rem solid rgb(231,231,231);
  display: flex;
  flex-direction: column;
  width: 940px;
}

#technology_stack ul {
  list-style: none;
  padding: 0;
  display: flex;
  margin-bottom: 40px;
}

#technology_stack li {
    margin-right: 10px;
    font-size: 10pt;
    height: 29px;
}
.techList{
	background-color: rgb(243 243 243);
    border-radius: 5px;
    color: gray;
    padding: 5px;
}

.education{
  border-bottom: 0.0625rem solid rgb(231,231,231);
  display: flex;
  flex-direction: column;
  width: 940px;
}
.career{
  border-bottom: 0.0625rem solid rgb(231,231,231);
  display: flex;
  flex-direction: column;
  width: 940px;
}
.education>ul,
.career>ul,
.region>ul {
  padding: 0px;
  margin-bottom: 40px;
}

.education>ul>li 
,.region>ul>li{
  list-style: none;
  margin-bottom: 10px;
}

.career>ul>li {
  list-style: none;
}

.career_list_year {
  font-size: 10pt;
  margin-bottom: 15px;
}

/*신고 모달*/
.report-modal {
	visibility: hidden;
    position: fixed;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 1;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* 모달 내용 스타일 */
.report-modal-content {
    position: relative;
    padding: 20px;
    width: 60%;
    background-color: #fff;
    border-radius: 5px;
}

/* 모달 닫기 버튼 스타일 */
.close {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 20px;
    cursor: pointer;
    color: #888;
}

/* 수정버튼  */
.introduce-modify,#edit_button1,#edit_button2,#delete_tech,
.education-modify,.career-modify,.region_modify
,.profile-modify
,#edit-sns{
	background-color: white;
    border: none;
}
.education-modify>img ,
.career-modify>img,
.region_modify>img,
.introduce-modify>img,
#edit-sns,
#edit-profilepic{
	width: 20px;
	opacity: 53%
}
#edit-profilepic{
    margin-right: 12px;
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
  color: gray;
  cursor: pointer;
}

#delete_tech{
	margin-left: 10px;
}
.introduce-create{
    border: 1px solid #dcdcdc;
    border-radius: 5px;
    background-color: #ffffff;
    width: 103px;
    height: 23px;
    font-size: 8pt;
    margin-top: 5px;
}

#content_wrapper{
	display: flex;
	justify-content: center;
}

#content {
  display: flex;
  justify-content: center;
  
}
/* 추가하기 */
 #insert_techstack, #addEducationButton,.addCareer,.region_create,#edit_button2{
	cursor: pointer;
    border: 1px solid #dcdcdc;
    border-radius: 5px;
    background-color: #ffffff;
    color: black;
    width: 60px;
    height: 21px;
    font-size: 8pt;
    margin-top: 5px;
} 

.follow{
	display: flex;
	justify-content: space-evenly;
}

#add{
	width: 15px;
    height: 15px;
	/* background-color: var(--gray); */
	margin-left: 8px;
	cursor: pointer;
}

.related_link{
	display: flex;
	margin: 20px;
}

#SNS{
	display: flex;
	margin-top: 10px;
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
    top: 84%;
    left: 83%;
    transform: translate(-50%, -50%);
}
    .btn-primary, .anchor {
        padding: 5px 8px;
        text-decoration: none;
        color: #4052f7;
        background-color: #d0eaff;
        margin-right: 15px;
        border-radius: 10px;
        border: 0px;
        font-weight: bold;
        cursor: pointer;
    }

    .create_content, .create_content2 {
        visibility: hidden;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -80%);
        z-index: 10;
        box-shadow: 0 0 10px #19191948;
        border: 1px solid;
        width: 500px;
        padding: 30px;
        opacity: 0;
        border: none;
        border-radius: 5px;
        background-color: #ffffff;
        transition: 0.5s;
    }

    .create_content.active, .create_content2.active {
        visibility: visible;
        opacity: 1;
        transform: translate(-50%, -50%);
    }

    .create_content > *, .create_content2 > * {
        margin-bottom: 10px;
    }

    .btn-close {
        position: absolute;
        top: 6px;
        right: 10px;
        background-color: transparent;
        font-size: 18px;
        color: #888;
        cursor: pointer;
    }

    .btn-close:hover {
        color: #191919;
    }
    
    .create_title {
        text-align: center;
    }

	.follow {
		display: grid;
		grid-template-columns: 27px 50px 30px 50px 30px 1fr 70px 10px 70px;
		border-bottom: 1px solid #333;
		font-weight: bold;
		width: 940px;
		padding-bottom: 10px;
		align-items: center;
	}

	.follow div {
		cursor: pointer;
	}
	
	#arrow{
		width: 8px;
		height: 8px;
		margin: 7px;
	}

	/* 모달 */
#edit_button2, #modalCloseButton, .addCareer {
  cursor: pointer;
}

#modalContainerProfile {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContainerIntroduction {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContainerSNS {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContainerTech {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContainerCareer {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContainerEducation {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContainerAddress {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContentProfile {
  position: absolute;
  /* background-color: #ffffff; */
  width: 500px;
  height: 200px;
  padding: 15px;
}

#modalContentIntroduction {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 200px;
  padding: 15px;
}

#modalContentSNS {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 200px;
  padding: 15px;
}

#modalContentTech {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 200px;
  padding: 15px;
}

#modalContentCareer {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 300px;
  padding: 15px;
}

#modalContentEducation {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 300px;
  padding: 15px;
}

#modalContentAddress {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 300px;
  padding: 15px;
}

#modalContainerProfile.hidden {
  display: none;
}

#modalContainerIntroduction.hidden {
  display: none;
}

#modalContainerSNS.hidden {
  display: none;
}

#modalContainerTech.hidden {
  display: none;
}

#modalContainerCareer.hidden {
  display: none;
}

#modalContainerEducation.hidden {
  display: none;
}

#modalContainerAddress.hidden {
  display: none;
}

#techstack_category{
	border: 1px solid;
	padding: 6px;
	margin: 5px 0px 10px 0px ;
	border-radius: 6px;
}
.profile {
  display: grid;
  grid-template-columns: 170px 20px 1fr;
  margin: 20px;
}

#profile-img,
#nomal-img {
  width: 150px;
  height: 150px;
  border-radius: 50%;
}

.related_link a {
  text-decoration: none;
  color: #333;
  margin-right: 10px;

}
#report{
	width: 70px;
    position: absolute;
    height: 30px;
    top: 12%;
    left: 85%;
    transform: translate(-50%, -50%);
	cursor: pointer;
}
</style>
<!-- 자바스크립트 시작 -->
<jsp:include page="../layout/header.jsp" />
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	//신고버튼
	$().ready(function() {
		function redirectToURL(url) {
	        window.location.href = url;
	    }
	    /* 비밀번호, 닉네임 수정 버튼 */
	    $("#myprofile").click(function() {
			redirectToURL(`/memberinfo/view/${sessionScope._LOGIN_USER_.email}`);
		});
	    $("#mypost").click(function() {
	        redirectToURL(`/member/mypost`);
	    });
	    $("#modify_info").click(function() {
	        redirectToURL(`/member/selectmember/${sessionScope._LOGIN_USER_.email}`);
	    });
		$("#quit").click(function() {
	        redirectToURL(`/member/logout`);
	    });
		$("#solve").click(function(){
			redirectToURL(`/codingtest/mylist`);
			
		});
		$("#bookmark").click(function(){
			redirectToURL(`/member/bookmark`);
			
		});

	    /* 채팅 */
	    $(".message_icon").click(function() {
	    	inviteUser(send, "${sessionScope._LOGIN_USER_.nickname}", "${sessionScope._LOGIN_USER_.email}", "${memberVO.email}");
	    });

		 $(".profile-modify").click(function() {
			var email = $(this).data('pic-id');
			$("#modalContainerProfile").removeClass("hidden")
			$('#modalContentProfile').load('/memberInfo/modify/modify-profile-pic/' + email)
			
		 })

		function openIntro(){
			$('#modalContainer .modalContent').load("'/memberInfo/modify/update-introduction/' + email");
			$('#modalContainerIntroduction').removeClass('hidden');
		}

		$(".introduce-modify").on('click',function(){
			openIntro();
			
		})
		
		$(".introduce-create").on('click',function(){
			openIntro();
			
		})
		
		 $("#edit_button1").click(function() {
			$("#modalContainerSNS").removeClass("hidden")
		 })
		 $("#edit_button2").click(function() {
			$("#modalContainerTech").removeClass("hidden");
			$('#modalContentTech').load("/memberInfo/modify/update-tech/{email}");
         });
		 $("#insert_techstack").click(function() {
			$("#modalContainerTech").removeClass("hidden");
			$('#modalContentTech').load("/memberInfo/modify/create-tech-stack");
         });

		 $("#addEducationButton").click(function() {
			var educationId = $(this).data('education-id');
			$("#modalContainerEducation").removeClass("hidden");
			$('#modalContentEducation').load("/memberInfo/modify/create-education");
		 });
		 $(".education-modify").click(function() {
			var educationId = $(this).data('education-id');
			$("#modalContainerEducation").removeClass("hidden");
			$('#modalContentEducation').load("/memberInfo/modify/update-education/"+educationId);
		 });

		 $(".addCareer").click(function() {
			$("#modalContainerCareer").removeClass("hidden");
			$('#modalContentCareer').load("/memberInfo/modify/create-career");
			console.log("modalCloseCareer 클릭됨");
		 });

		 $(".career-modify").click(function() {
			var careerId = $(this).data('career');
			$("#modalContainerCareer").removeClass("hidden");
			$('#modalContentCareer').load("/memberInfo/modify/update-career/"+careerId);
			console.log("modalCloseCareer 클릭됨");
		 });
		

		 $(".region_modify").click(function(){
			$("#modalContainerAddress").removeClass("hidden")
		 })

		 $(".region_create").click(function(){
			$("#modalContainerAddress").removeClass("hidden")
		 })

		 $("#modalCloseProfile").on('click',function(){
				$("#modalContainerProfile").addClass("hidden");
			})

			$("#modalCloseIntro").on('click',function(){
				$("#modalContainerIntro").addClass("hidden");
			})
		    
			$("#modalCloseSNS").on('click',function(){
				$("#modalContainerSNS").addClass("hidden");
			})

			$("#modalCloseTech").on('click',function(){
				$("#modalContainerTech").addClass("hidden");
			})

	
			$(".modalCloseCareer").on('click',function(){
				$("#modalContainerCareer").addClass("hidden");
			})

			$("#modalCloseAddress").on('click',function(){
				$("#modalContainerAddress").addClass("hidden");
			})

	});
</script>
</head>
<body>
	<div class="body_container">
		<div class="body_left_aside">
			<!-- <c:if
				test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}"> -->
				<button id="myprofile">마이페이지</button>
				<button id="bookmark">북마크</button>
				<button id="modify_info">정보 수정</button>
				<button id="mypost">내가 쓴 게시글</button>
				<button id="solve">내가 푼 문제</button>
				<button id="quit">탈퇴</button>
			<!-- </c:if> -->
		</div>
	<div class="body">
	<div class="flex_main">	
	<div class="profile">
		<div class="profile-fix">
			<c:choose>
				<c:when
					test="${memberVO.profilePic eq 'https://w7.pngwing.com/pngs/384/868/png-transparent-person-profile-avatar-user-basic-ui-icon.png'}">
					<img id ="nomal-img" src="${memberVO.profilePic}" />
				</c:when>
				<c:otherwise>
					<img id="profile-img" src="/member/file/download/${memberVO.email}" />
				</c:otherwise>
			</c:choose>
			<c:if
					test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
					<button data-pic-id="${sessionScope._LOGIN_USER_.email }" class="profile-modify">
					<img id="edit-profilepic" src="/images/edit.png">
					</button>
					
					<div id="modalContainerProfile" class="hidden">
						<div id="modalContentProfile">			
						</div>
					</div>
			</c:if>
		</div>
				<ul class="introduction_list">
					<li class="list_name">
						<h2>${memberVO.nickname}</h2>
					</li>
					<c:choose>
						<c:when test="${not empty generalMemberVO.selfIntro}">
							<li class="list_intro">${generalMemberVO.selfIntro}<c:if
									test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
									<button data-introduce-id="${sessionScope._LOGIN_USER_.email}" class="introduce-modify"><img src="/images/edit.png"></button>
									<div id="modalContainerIntroduction" class="hidden">
										<div id="modalContenIntroduction">		
											<jsp:include page="modifyintroduce.jsp" />																		
										</div>									
									</div>							
								</c:if>
							</li>
						</c:when>
						<c:otherwise>
							<li class="list_intro"><c:if
									test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
									<button data-introduce-id="${sessionScope._LOGIN_USER_.email }" class="introduce-create">
										+ 자기소개 추가하기
									</button>	
									    
                                    <div id="modalContainerIntroduction" class="hidden">
                                        <div id="modalContenIntroduction">        
                                            <jsp:include page="modifyintroduce.jsp" />                                                                        
                                        </div>                                    
                                    </div>    	
								</c:if></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<button id="report">신고</button>
	</div>
	<div class="follow">
	  <div></div>
	  <div class="follower" data-email="${memberVO.email}">팔로워</div>
	  <div>0</div>
	  <div class="followee" data-email="${memberVO.email}">팔로잉</div>
	  <div>0</div>
	  <div></div>
	  <div class="follow_chat"></div>
	  <div></div>
		
		<c:if test="${sessionScope._LOGIN_USER_.email != memberVO.email}" >
		<button class="message_icon">✉ 메시지</button>
		</c:if>
	</div>
	</div>
	<div class="related_link">
		<div id="SNS">
			<img src="https://cdn-icons-png.flaticon.com/512/25/25231.png" alt="Icon 1" id="githubIcon">
		</div>
		<div id="SNS">
        <img src="https://w7.pngwing.com/pngs/863/247/png-transparent-email-computer-icons-email-miscellaneous-angle-text.png" alt="Icon 2" id="emailIcon"> 
		</div>
		<div id="SNS">
        <img src="https://i.pinimg.com/originals/f8/0b/dd/f80bdd79a51358da6ee41a0fda520394.png" alt="Icon 3" id="blogIcon">
		</div>
		<c:if
		test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
			<button data-sns="${sessionScope._LOGIN_USER_.email }" id="edit_button1"> 
				<img id="edit-sns" src="/images/edit.png">
			</button>
			<div id="modalContainerSNS" class="hidden">
				<div id="modalContentSNS">
					<jsp:include page="modifysns.jsp" />
				</div>
				<button id="modalCloseSNS">닫기</button>
			</div>			
		</c:if>
	</div>
	<!-- 모달 -->	
	<div id="technology_stack">
		<h3 class="techstack-font">기술스택</h3>
		<ul>
			<c:choose>
				<c:when test="${not empty commonCodeList}">
					<c:forEach items="${commonCodeList}" var="commonCode">
						<li class="techList">${commonCode.codeContent}</li>
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						
							<button data-teach="${sessionScope._LOGIN_USER_.email }" id="edit_button2">+ 추가하기</button>
							<div id="modalContainerTech" class="hidden">
								<div id="modalContentTech">
									
									<button id="deleteTech">삭제</button>
									
								</div>
							</div>
						
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
							test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
							<button id="insert_techstack">
								<img id="add" src="/images/작성.png/" alt="추가하기">
							</button>
							<div id="modalContainerTech" class="hidden">
								<div id="modalContentTech">
									
									
								</div>
							</div>
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
							${education.degrees } 
							<c:if
								test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
								<button data-education-id="${education.educationId}" class="education-modify">
								<img src="/images/edit.png">
								</button>
								<div id="modalContainerEducation" class="hidden">
									<div id="modalContentEducation">
										<button id="modalCloseEducation">닫기</button>
									</div>
								</div>
							</c:if>
						</li>						
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button id="addEducationButton">
							+ 추가하기
						</button>	
						<div id="modalContainerEducation" class="hidden">
							<div id="modalContentEducation">
								
									
								<button class="modalCloseEducation">닫기</button>
							</div>
						</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button id="addEducationButton">
							+ 추가하기
						</button>
						<div id="modalContainerEducation" class="hidden">
							<div id="modalContentEducation">
								
									
								<button class="modalCloseEducation">닫기</button>
							</div>
						</div>
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
								<button data-career="${career.careerId}" class="career-modify"><img src="/images/edit.png"></button>
								<div id="modalContainerCareer" class="hidden">
									<div id="modalContentCareer">
														
										<button class="modalCloseCareer">닫기</button>
									</div>
								</div>
							</c:if>
						</li>
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button class="addCareer" data-career="${career.careerId}">
							+ 추가하기
						</button>
						<div id="modalContainerCareer" class="hidden">
							<div id="modalContentCareer">
												
								
							</div>
						</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
							test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
							<button class="addCareer">
								추가하기
							</button>	
							<div id="modalContainerCareer" class="hidden">
								<div id="modalContentCareer">
											
									
								</div>
							</div>
						</c:if>
					</li>
				</c:otherwise>

			</c:choose>
			
		</ul>
	</div>
	<div class="region">
		<h3 class="region-font">주소</h3>
		<ul>
			<c:choose>
				<c:when test="${not empty generalMemberVO.region}">
					<li>${generalMemberVO.region}
					<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button data-region="${sessionScope._LOGIN_USER_.email }" class="region_modify"> 
						<img src="/images/edit.png">
						</button>
						<div id="modalContainerAddress" class="hidden">
							<div id="modalContentAddress">
								<jsp:include page="modifyaddress.jsp" />
								
								<button id="modalCloseAddress">닫기</button>
							</div>
						</div>
					</c:if>
					</li>
				</c:when>
				<c:otherwise>
					<li>
					<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button data-region-id="${sessionScope._LOGIN_USER_.email }" class="region_create"> 
							+ 추가하기
						</button>
						<div id="modalContainerAddress" class="hidden">
							<div id="modalContentAddress">
								<jsp:include page="modifyaddress.jsp" />
								
								<button id="modalCloseAddress">닫기</button>
							</div>
						</div>
						</c:if></li>
				</c:otherwise>
			</c:choose>
		  </ul>
	    </div>
	  </div>
	  <div class="create_content">
	    <div class="btn-close">&times;</div>
	    <div class="create_title">팔로워</div>
	    <div class="follower_list"></div>
	  </div>
	  <div class="overlay"></div>
	  <div class="create_content2">
	    <div class="btn-close">&times;</div>
	    <div class="create_title">팔로잉</div>
	    <div class="followee_list"></div>
	  </div>
	  <div class="overlay"></div>
    </div>
<jsp:include page="../layout/footer.jsp" />
<div>
<c:choose>
			<c:when
				test="${not empty sessionScope._LOGIN_USER_.email eq memberVO.email}">
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

		 <h2>신고 내용</h2>
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
		</form> 
</div>
</body>
<script>
    //모달 실행을 위한 문장
    $('.follower').click(function() {
    	var followerEmail = $(this).data('email');
        $('.create_content, .overlay').addClass('active')

		var url = '/member/getfollowers/' + followerEmail;
		loadFollower(url);
    })
    $('.btn-close, .overlay').click(function() {
        $('.create_content, .overlay').removeClass('active')
    })
    $('.followee').click(function() {
		var followeeEmail = $(this).data('email');
        $('.create_content2, .overlay').addClass('active')

		var url2 = '/member/getfollowees/' + followeeEmail;
		loadFollowee(url2);
    })
    $('.btn-close, .overlay').click(function() {
        $('.create_content2, .overlay').removeClass('active')
    })
    
	function loadFollower(url) {
		$.get(url, function(response) {
			console.log(response.followerList);
			let followerTemplate = '';

			if (response && response.followerList && response.followerList.length > 0) {
				const followerList = response.followerList;

				for (let i = 0; i < followerList.length; i++) {
					let account = followerList[i];
					console.log(account);

					const profilePic = account.memberVO.profilePic;
					const followerEmail = account.follower;
					const nickname = account.memberVO.nickname;

					const followerItem =
						`<div>
							<img style="width: 50px; height: 50px;" src="\${profilePic}" />
							<a class="anchor" href="/memberinfo/view/\${followerEmail}">\${nickname}</a>
						</div>`;
					console.log(followerItem)
					followerTemplate += followerItem
				}

				$('.create_content .follower_list').html(followerTemplate);
			} else {
				followerTemplate = "팔로워가 없습니다.";
				$('.create_content .follower_list').html(followerTemplate);
			}
		});
	}
	function loadFollowee(url2) {
		$.get(url2, function(response2) {
			console.log(response2.followeeList);
			let followeeTemplate = '';

			if (response2 && response2.followeeList && response2.followeeList.length > 0) {
				const followeeList = response2.followeeList;

				for (let i = 0; i < followeeList.length; i++) {
					let account = followeeList[i];
					console.log(account);

					const profilePic = account.memberVO.profilePic;
					const followeeEmail = account.followee;
					const nickname = account.memberVO.nickname;

					const followeeItem =
						`<div>
							<img style="width: 50px; height: 50px;" src="\${profilePic}" />
							<a class="anchor" href="/memberinfo/view/\${followeeEmail}">\${nickname}</a>
						</div>`;
					console.log(followeeItem)
					followeeTemplate += followeeItem
				}

				$('.create_content2 .followee_list').html(followeeTemplate);
			} else {
				followeeTemplate = "팔로우하는 계정이 없습니다.";
				$('.create_content2 .followee_list').html(followeeTemplate);
			}
		});
	}
	
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

	template = `
	<c:if test="${sessionScope._LOGIN_USER_.email != memberVO.email}" >
		<button class="follow_icon" data-email="${memberVO.email}">
			<img src="https://cdn-icons-png.flaticon.com/512/907/907873.png" />
			팔로우
			<input type="hidden" class="followerEmail" value="${sessionScope._LOGIN_USER_.email}" />
			<input type="hidden" class="followeeEmail" value="${memberVO.email}" />
			<input type="hidden" class="followId" />
			</button>
	</c:if>`
		
	let templateDom = $(template)
	
	// 팔로우 상태 가져오기
	user_email = `${sessionScope._LOGIN_USER_.email}`
	email = `${memberVO.email}`
	console.log(email)

	$.get(`/follow/status/\${user_email}/\${email}`, function(state) {
	console.log(state.followYn)
		if(state.followYn === 'Y') {
		templateDom.css({'background-color':'var(--blue)', 'color':'var(--white)'}).addClass('follow_on')
		$('.follow_chat').find('.followId').val(`\${state.followId}`)
		}
	})
	$('.follow_chat').prepend(templateDom)
			
	  // 팔로우 토글
	  $(document).on('click', '.follow_icon', function(e) {
	    let userEmail = `${sessionScope._LOGIN_USER_}`
	      if (userEmail === '') {
	        if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?') ) {
	          window.location.href="/member/auth"
	        }
	      }
	      else {
			  let content = {
				"follower": `${sessionScope._LOGIN_USER_.email}`,
				"followee": $(this).find(".followeeEmail").val(),
				"followId": $(e.currentTarget).find('.followId').val()
			  }
			  console.log(content.follower)
			  console.log(content.followee)
			  console.log(content.followId)
			  console.log(e.currentTarget)
			  if ($(e.currentTarget).hasClass('follow_on')) {
				$.post('/unfollow/member', content, function(result) {
				  if (result.result === false) {
					alert('삐') 
				  }
				  else {
					$(e.currentTarget).removeClass('follow_on')
					$(e.currentTarget).css({'background-color':'var(--white)', 'color':'var(--black)'})
					$('.followId').remove()
				  }
				})
			  }
			  else {
				$.post('/follow/member', content, function(result) {
				   if(result) {
					 let template = `<input type="hidden" class="followId" value="\${result.followId}"/>`
					 let templateDom = $(template)

					 $(e.currentTarget).css({'background-color':'var(--blue)', 'color':'var(--white)'})
					 $(e.currentTarget).addClass('follow_on')
					 $('.follow_icon').prepend(templateDom)
				   	 send({
			         	roomName: "main",
			            sendType: "follow",
			            userName: "${sessionScope._LOGIN_USER_.nickname}",
			            userEmail: "${sessionScope._LOGIN_USER_.email}",
			            message: "${sessionScope._LOGIN_USER_.nickname}님이 팔로우 했습니다.",
			            to: "${memberVO.email}"
			        })
				   }
				   else {
					 alert('처리하지 못했습니다.')
				  }
				})
			  }
	      }
	})
</script>
</html>