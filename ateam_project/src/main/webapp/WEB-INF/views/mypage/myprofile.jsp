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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/lib/jquery-3.7.1.js"></script>
<jsp:include page="../layout/header.jsp" />
<style>
@charset "utf-8";
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');/*글꼴을 가져오는 페이지*/

.btn_append::before {
	content: " + ";
}

body > .body_container {
    width: 100%;
    min-height: 75vh;
    display: grid;
    grid-template-columns: 1fr 1080px 1fr;
}

/* Main Contents */
body > .body_container > .body {
    grid-column: 2/3;
	display: flex;
    flex-direction: column;
	margin-top: 20px;
}

/* Main Contents 왼쪽 여백*/
body > .body_container > .body_left_aside {
    grid-column: 1/2;
	display: flex;
    justify-content: flex-end; 
}

/* Main Contents 오른쪽 여백*/
body > .body_container > .body_right_aside {
    grid-column: 3/4;
	
}

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
    height: 27px;
    font-size: 8pt;
    margin-top: 2px;
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

	#selfIntro{
		height: 200px;
		width: 770px;
		resize: none;
	}

	.saveIntro {
    text-align: end;
	}
	/* 프로필 */
	

.profile-image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	margin: 0 auto;
	display: block;
}

.file-input {
	margin-top: 20px;
}

input#githubUrl,
input#blogUrl,
input#additionalEmail
 {
    width: 500px;
}
.companyName_errors,
.jobTitle_errors,
.hireDate_errors {
	opacity: 0.8;
	padding: 10px;
	color: red;
	font-size: 10pt;
  
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
#reportUser{
	width: 70px;
    position: absolute;
    height: 30px;
    top: 12%;
    left: 85%;
    transform: translate(-50%, -50%);
	cursor: pointer;
}

#saveBtn{
	cursor: pointer;
    border: 1px solid #EEE;
    border-radius: 5px;
    background-color:var(--blue);;
    color: #EEE;
    width: 80px;
    height: 40px;
    font-size: 14pt;
}

#techSave,
#saveSNS,
#saveEdu,
#saveCareer,
#saveAddress{
	display: flex;
	justify-content: end;
}
</style>
<!-- 자바스크립트 시작 -->
<%-- <jsp:include page="../layout/header.jsp" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/lib/jquery-3.7.1.js"></script> --%>
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

	    $(".message_icon").click(function() {
	    	inviteUser(send, "${sessionScope._LOGIN_USER_.nickname}", "${sessionScope._LOGIN_USER_.email}", "${memberVO.email}");
	    });

	});

	function sample6_execDaumPostcode() {
      			new daum.Postcode({
					oncomplete: function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 저장하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if(data.userSelectedType === 'R'){
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if(data.buildingName !== '' && data.apartment === 'Y'){
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if(extraAddr !== ''){
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
						
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("region").value = addr;
						// 커서를 상세주소 필드로 이동한다.
					}
			}).open();
			
			$().ready(function() {
				$("#region_button").click(function() {
					$(".region_errors").hide();
				});
			});

		$().ready(function() {
				$("#hireDate, #resignDate").change(function() {
					var currentDate = new Date(); // 현재 날짜 가져오기
					var hireDateValue = $("#hireDate").val();
					var resignDateValue = $("#resignDate").val();
					
					// 빈 값인 경우 비교하지 않음
					if (hireDateValue && resignDateValue) {
						var hireDate = new Date(hireDateValue);
						var resignDate = new Date(resignDateValue);
						
						if (hireDate > currentDate || resignDate > currentDate) {
							alert("입사일과 퇴사일은 현재 날짜보다 클 수 없습니다.");
							// 입사일과 퇴사일을 초기화
							$("#hireDate").val("");
							$("#resignDate").val("");
						} else if (hireDate > resignDate) {
							alert("입사일이 퇴사일보다 이후일 수 없습니다.");
							// 입사일을 초기화
							$("#hireDate").val("");
						}
						else if (hireDate === resignDate) {
							alert("입사일이 퇴사일보다 이후일 수 없습니다.");
							// 입사일을 초기화
							$("#hireDate").val("");
						}
						else if (hireDate.toDateString() === resignDate.toDateString()) {
							alert("입사일과 퇴사일이 같을 수 없습니다.");
							// 입사일과 퇴사일을 초기화
							$("#hireDate").val("");
							$("#resignDate").val("");
						}
					}
				});
				$("#previousCompanyName").click(function() {
					$(".companyName_errors").hide();
				});
				
				$("#jobTitle").click(function() {
					$(".jobTitle_errors").hide();
				});
				$("#hireDate").click(function() {
					$(".hireDate_errors").hide();
				});
				
		});

		$(document).ready(function() {
		// 페이지가 로드된 후 실행될 JavaScript 코드
		var selfIntroTextarea = $("#selfIntro");
		var selfIntroValue = selfIntroTextarea.val();
		
		// 공백 제거 함수
		function removeSpaces(inputText) {
			return inputText.replace(/\s/g, '');
		}
		
		// 초기 텍스트 설정
		selfIntroTextarea.val(removeSpaces(selfIntroValue));
		});
	}
	
	$(document).on('click', '#reportUser', function() {
		$.sweetModal({
		title: '신고 내용',
		content: `
	    <form name="reportVO" method="post" action="/report/view/5">
			<div class="grid" style="grid-template-columns: 150px 1fr; grid-template-rows: 30px 100px 30px; row-gap: 10px;">
			<label for="reportReason" >신고사유${reportVO.reportReason}</label>
				<select name="reportReason">
					<option value="CC-20231018-000200">영리목적/홍보성</option>
					<option value="CC-20231018-000201">개인정보 노출</option>
					<option value="CC-20231018-000202">음란성/선정성</option>
					<option value="CC-20231018-000203">같은 내용 반복(도배)</option>
					<option value="CC-20231018-000204">이용규칙위반</option>
					<option value="CC-20231018-000205">기타</option>
				</select>
		
		        <label for = "reportReasonContent">신고 상세내용</label>
		        <textarea name="reportReasonContent" id="reportReasonContent">${reportVO.reportReasonContent}</textarea>
		     	
		        <label for="attachedImg">첨부파일${reportVO.attachedImg}</label>
		        <input id="attachedImg" type="file" name="attachedImg"/>
		        
		        <label for="reportTypeId">${reportVO.reportTypeId}</label>
		        <input id="reportTypeId" type="hidden" name="reportTypeId" value="5"/>
		        
		        <label for="reportMemberEmail">${reportVO.reportMemberEmail}</label>
		        <input id="reportMemberEmail" type="hidden" name="reportMember" value="${sessionScope._LOGIN_USER_.email}"/>
		     
		        <label for="receivedReportMemberEmail">${reportVO.receivedReportMemberEmail}</label>
		        <input id="receivedReportMemberEmail" type="hidden" name="receivedReportMember" value="${memberVO.email}"/>
		     
		        <label for="reportContentId">${reportVO.reportContentId}</label>
		        <input id="reportContentId" type="hidden" name="reportContentId" value="${memberVO.email}"/>
		     </div>
		        <div class="modal_content_element submit_area btn_controller">
		           <input type="submit" value="완료" />
		        </div>
		     
	     </form>`
	});
});
		$(document).on('click', '.profile-modify', function() {
					$.sweetModal({
						title: '프로필 수정',
						content: `			
						<form method="post" enctype="multipart/form-data"
							action="/memberInfo/modify/modify-profile-pic">
							<input type="hidden" name="email" value="${memberVO.email}" />
							<div class="profile-container">
								<c:choose>
									<c:when test="${memberVO.profilePic eq 'https://w7.pngwing.com/pngs/384/868/png-transparent-person-profile-avatar-user-basic-ui-icon.png'}">
										<img src="${memberVO.profilePic}" class="profile-image" id="profile-image"/>
									</c:when>
									<c:otherwise>
										<img src="/member/file/download/${memberVO.email}" class="profile-image" id="profile-image"/>
									</c:otherwise>
								</c:choose>
								<div class="file-input" style="display:flex; justify-content:center; margin-left:70px">
									<input type="file" id="file" name="file" />
								</div>
							</div>
							<div style="display:flex; justify-content:end;">
								<input type="submit" value="저장" id="saveBtn" style="margin-top:15px"/>	
							</div>
						</form>`
					})	
		});

        $(document).on('click', '.introduce-modify', function() {
        	$.sweetModal({
        		title: '자기소개',
        		content: `
				<div class="gridIntro" style="grid; grid-template-colums: 100px 1fr 100px;">
        		<form method="post" action="/memberInfo/modify/update-introduction">
        			<input type="hidden" name="generalMemberEmail" value="${sessionScope._LOGIN_USER_.email}"/>
        			  <textarea name="selfIntro" id="selfIntro" placeholder="간단한 문구를 입력해 주세요 😊">
        			  ${generalMemberVO.selfIntro}
        			  </textarea> 
					<div class="saveIntro">
						<input type="submit" value="저장" id="saveBtn" /> 
					</div>    			
        		</form>
				</div>
				`
        	})
        });

		$(document).on('click', '#edit_button1', function() {
        	$.sweetModal({
        		title: 'SNS',
        		content: `			
					<form method="post" action="/memberInfo/modify/update-sns-link" style=" display: grid; grid-template-rows: 20px 30px 20px 30px 20px 30px;">				
					<input type="hidden" name="generalMemberEmail" value="${sessionScope._LOGIN_USER_.email}"/>
					<label>Github 주소</label>
					<input type="text" id="githubUrl" name="githubUrl" value="${generalMemberVO.githubUrl}" placeholder="Github Url">
					<label>이메일 주소</label>
					<input type="email" id="additionalEmail" name="additionalEmail" value="${generalMemberVO.additionalEmail}" placeholder="Email Url">
					<label>Blog 주소</label>
					<input type="text" id="blogUrl" name="blogUrl" value="${generalMemberVO.blogUrl}" placeholder="Blog Url">	
					<div id="saveSNS">
					<input type="submit" value="저장" id="saveBtn" style="margin-top:15px"/>
					</div>						
				`
        	})

			
        });

		$(document).on('click', '#edit_button2', function() {
        	$.sweetModal({
        		title: '기술스택 수정',
        		content: `
        		<form method="post" action="/memberInfo/modify/update-tech">
				<input type="hidden" name="email" value="${sessionScope._LOGIN_USER_.email}" />   
				<label class="label" for="hashtagId">알고리즘 카테고리</label>
				<div id="techstack_category"></div>
				<div id="techSave">
					<input type="submit" value="저장" id="saveBtn">
				
				</div>`
        	})
	
		$.get("/code/해시태그", function(response) {
			for (var i = 0; i < response.length; i++) {
				var code = response[i]
				var label = $("<label for='"+code.codeId+"'>"+code.codeContent+"</label>");
				var checkbox = $("<input type='checkbox' id='"+code.codeId+"' name='hashtagList' value='"+code.codeId+"' />");
				$("#techstack_category").append(checkbox);
				$("#techstack_category").append(label);
			}
			$.get("/techstack/category/${sessionScope._LOGIN_USER_.email}", function(techstackResponse) {
				console.log(techstackResponse)
				
				for (var i = 0; i < techstackResponse.length; i++) {
					var code = techstackResponse[i]
					$("input[name=hashtagList][value="+code.hashtagId+"]").prop("checked", true);
				}
			});
		});

		$("form").submit(function(event) {
            var checkedCount = $("input[name='hashtagList']:checked").length;
            if (checkedCount < 1) {
                alert("적어도 하나 이상의 항목을 선택하세요.");
                event.preventDefault();
            }
        });
        });

		$(document).on('click', '#insert_techstack', function() {
        	$.sweetModal({
        		title: '기술스택 추가',
        		content: `
        		<form method="post">		
				<label class="label" for="hashtagId">알고리즘 카테고리</label>
				<div id="techstack_category"></div>
				<input type="submit" value="저장" id="saveBtn" />
				</form>`
        	})
        });

		


		$(document).on('click', '.career-modify', function() {
        	$.sweetModal({
        		title: '경력 수정',
        		content: `
        		<form:form modelAttribute="careerVO" method="post" action="/memberInfo/modify/update-career" enctype ="multipart/form-data">
					<input type="hidden" name="careerId" value="${careerVO.careerId}" />
					<div>
						<label for="previousCompanyName">근무 회사명:</label>
						<input type="text" id="previousCompanyName" name="previousCompanyName" value="${careerVO.previousCompanyName }" >
						<form:errors path="previousCompanyName" element="div" cssClass="companyName_errors" />
					</div>
					
					<div>
						<label for="jobTitle">직무명:</label>
						<input type="text" id="jobTitle" name="jobTitle" value="${careerVO.jobTitle }">
						<form:errors path="jobTitle" element="div" cssClass="jobTitle_errors" />
					</div>
					<div>
						<label for="hireDate">입사일:</label>
						<input type="date" id="hireDate" name="hireDate" class="date-picker" placeholder="YYYY-MM-DD"
						value="${careerVO.hireDate }">
					<form:errors path="hireDate" element="div" cssClass="hireDate_errors" />
					</div>
					<div>
						<label for="resignDate">퇴사일:</label>
						<input type="date" id="resignDate" name="resignDate" class="date-picker" placeholder="YYYY-MM-DD" 
						value="${careerVO.resignDate }">
					</div>
					<div id="saveCareer">
						<input type="submit" value="저장" id="saveBtn">
					</div>
					
					<button class="modalCloseCareer">닫기</button>
					<a href="/memberInfo/modify/delete-career/${careerVO.careerId}">삭제</a>
				</form:form>`
        	})
		
    	});

		$(document).on('click', '.addCareer', function() {
        	$.sweetModal({
        		title: '경력 추가',
        		content: `
        		<form modelAttribute="careerVO" method="post">
					<div>
						<label for="previousCompanyName">근무 회사명:</label>
						<input type="text" id="previousCompanyName" name="previousCompanyName" >
						<form:errors path="previousCompanyName" element="div" cssClass="companyName_errors" />
					</div>
					<div>
						<label for="jobTitle">직무명:</label>
						<input type="text" id="jobTitle" name="jobTitle">
						<form:errors path="jobTitle" element="div" cssClass="jobTitle_errors" />
					</div>
					<div>
						<label for="hireDate">입사일:</label>
						<input type="date" id="hireDate" name="hireDate" class="date-picker" placeholder="YYYY-MM-DD" >
						<form:errors path="hireDate" element="div" cssClass="hireDate_errors" />
					</div>
					<div>
						<label for="resignDate">퇴사일:</label>
						<input type="date" id="resignDate" name="resignDate" class="date-picker" placeholder="YYYY-MM-DD" >
					</div>
					<div id="saveCareer">
						<input type="submit" value="저장" id="saveBtn">
					</div>
				</form>`
        	})
			
        });

		$(document).on('click', '.region_create', function() {
			
        	$.sweetModal({
        		title: '주소 추가',
        		content: `
        		<form modelAttribute="generalMemberVO" method="post" action="/memberInfo/modify/create-location">
					<input type="hidden" name="generalMemberEmail" value="${generalMemberVO.generalMemberEmail }"/>
					<input type="text" id="sample6_postcode" placeholder="우편번호" readonly>
					<input type="button" onclick="sample6_execDaumPostcode()" id="region_button" value="우편번호 찾기" ><br>
					<input type="text" id="region" name ="region" placeholder="주소" readonly ><br>
					<div id="saveAddress">
						<input type="submit" value="저장" id="saveBtn">
					</div>
				<form:errors path="region" element="div" cssClass="region_errors" />
				</form>`
        	})		
        });

		$(document).on('click', '.region_modify', function() {
        	$.sweetModal({
        		title: '주소 수정',
        		content: `
        		<form modelAttribute="generalMemberVO" method="post" action="/memberInfo/modify/update-location">
					<input type="hidden" name="generalMemberEmail" value="${sessionScope._LOGIN_USER_.email}"/>
					<input type="text" id="sample6_postcode" placeholder="우편번호" readonly>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="region" name ="region" value="${generalMemberVO.region}" placeholder="주소" readonly><br>
					<div>
						<form:errors path="region" element="div" cssClass="errors" />
					</div>
					<input type="submit" value="저장" id="saveBtn" />
					<a href="/memberInfo/modify/delete-location/${generalMemberVO.generalMemberEmail}">삭제</a>
				</form>`
        	})
   		});
</script>
</head>
<body>
	<div class="body_container">
		<div class="body_left_aside">
			<!-- <c:if
				test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}"> -->
				<div class="flex_button">
					<button id="myprofile">마이페이지</button>
					<button id="bookmark">북마크</button>
					<button id="modify_info">정보 수정</button>
					<button id="mypost">내가 쓴 게시글</button>
					<button id="solve">내가 푼 문제</button>
					<button id="quit">탈퇴</button>
				</div>
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
<!-- 					
					<div id="modalContainerProfile" class="hidden">
						<div id="modalContentProfile">	
									
						</div>
					</div> -->
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
								
								</c:if>
							</li>
						</c:when>
						<c:otherwise>
							<li class="list_intro"><c:if
									test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
									<button data-introduce-id="${sessionScope._LOGIN_USER_.email }" class="introduce-create btn_append">
										자기소개 추가하기
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
				<c:if test="${sessionScope._LOGIN_USER_.email != memberVO.email}" >
					<button id="reportUser">신고</button>
				</c:if>
	</div>
	<div class="follow">
	  <div></div>
	  <div class="follower">팔로워</div>
	  <div class="follower_count"></div>
	  <div class="followee">팔로잉</div>
	  <div class="followee_count"></div>
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
			<!-- <div id="modalContainerSNS" class="hidden">
				<div id="modalContentSNS">
					<jsp:include page="modifysns.jsp" />
				</div>
				<button id="modalCloseSNS">닫기</button>
			</div>			 -->
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
						
							<button data-teach="${sessionScope._LOGIN_USER_.email }" id="edit_button2" class="btn_append">추가하기</button>
							<!-- <div id="modalContainerTech" class="hidden">
								<div id="modalContentTech">
									
									<button id="deleteTech">삭제</button>
									
								</div>
							</div> -->
						
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
							test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
							<button id="insert_techstack">
								<img id="add" src="/images/저장.png/" alt="추가하기">
							</button>
							<!-- <div id="modalContainerTech" class="hidden">
								<div id="modalContentTech">
									
									
								</div>
							</div> -->
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
								<!-- <div id="modalContainerEducation" class="hidden">
									<div id="modalContentEducation">
										<button id="modalCloseEducation">닫기</button>
									</div>
								</div> -->
							</c:if>
						</li>						
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button id="addEducationButton" class="btn_append">
							추가하기
						</button>	
						<!-- <div id="modalContainerEducation" class="hidden">
							<div id="modalContentEducation">
								
									
								<button class="modalCloseEducation">닫기</button>
							</div>
						</div> -->
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button id="addEducationButton" class="btn_append">
							추가하기
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
								<!-- <div id="modalContainerCareer" class="hidden">
									<div id="modalContentCareer">
														
										
									</div>
								</div> -->
							</c:if>
						</li>
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button class="addCareer btn_append" data-career="${career.careerId}">
							추가하기
						</button>
						<!-- <div id="modalContainerCareer" class="hidden">
							<div id="modalContentCareer">
												
								
							</div>
						</div> -->
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
							test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
							<button class="addCareer btn_append">
								추가하기
							</button>	
							<!-- <div id="modalContainerCareer" class="hidden">
								<div id="modalContentCareer">
											
									
								</div>
							</div> -->
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
						
					</c:if>
					</li>
				</c:when>
				<c:otherwise>
					<li>
					<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button data-region-id="${sessionScope._LOGIN_USER_.email }" class="region_create btn_append"> 
							추가하기
						</button>
						
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
	<%-- <c:choose>
		<c:when test="${not empty sessionScope._LOGIN_USER_.email eq memberVO.email}">
			<!-- a유저가 로그인한 경우에만 신고 버튼을 표시합니다. -->
			<form action="/report/view/5" method="post">
				<input type="hidden" id="reportUser" value="${empty sessionScope._LOGIN_USER}">
				<button type="submit" id="reportUser" value="5">신고</button>
			</form>
		</c:when>
		<c:otherwise>
			<!-- a유저가 로그인하지 않은 경우에는 신고 버튼을 표시하지 않습니다. -->
		</c:otherwise>
	</c:choose> --%>
</div>
</body>
<script>
	$().ready(function() {
		var currentUrl = window.location.href;
		
		var startIndex = currentUrl.indexOf("/memberinfo/view/") + "/memberinfo/view/".length;
		var endIndex = currentUrl.length;
		
		var extractedEmail = currentUrl.substring(startIndex, endIndex);
		/* var initialFollowerEmail = isValidEmail(extractedEmail) ? extractedEmail : ""; */
		
		var initialUrl = '/member/getfollowers/' + extractedEmail;
		var initialUrl2 = '/member/getfollowees/' + extractedEmail;
		
		/* function isValidEmail(email) {
			var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	        return emailRegex.test(email);
	    } */
		
		function updateFollowerCount(count) {
			console.log('Follower Count:', count);
			$('.follower_count')[0].innerText = count;
		}
		function updateFolloweeCount(count) {
			console.log('Followee Count:', count);
			$('.followee_count')[0].innerText = count;
		}
		loadFollower(initialUrl);
		loadFollowee(initialUrl2);
		
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
	
					updateFollowerCount(response.count);
					$('.create_content .follower_list').html(followerTemplate);
				} else {
					followerTemplate = "팔로워가 없습니다.";
					$('.create_content .follower_list').html(followerTemplate);
					updateFollowerCount(0);
				}
			});
		}
		function loadFollowee(url) {
			$.get(url, function(response) {
				console.log(response.followeeList);
				let followeeTemplate = '';
				if (response && response.followeeList && response.followeeList.length > 0) {
					const followeeList = response.followeeList;
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
					updateFolloweeCount(response.count);
					$('.create_content2 .followee_list').html(followeeTemplate);
				} else {
					followeeTemplate = "팔로우하는 계정이 없습니다.";
					$('.create_content2 .followee_list').html(followeeTemplate);
					updateFolloweeCount(0);
				}
			});
		}
	})
    //모달 실행을 위한 문장
    $('.follower').click(function() {
        $('.create_content, .overlay').addClass('active')
    })
    $('.btn-close, .overlay').click(function() {
        $('.create_content, .overlay').removeClass('active')
    })
    $('.followee').click(function() {
        $('.create_content2, .overlay').addClass('active')
    })
    $('.btn-close, .overlay').click(function() {
        $('.create_content2, .overlay').removeClass('active')
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