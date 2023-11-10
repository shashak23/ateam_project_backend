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
  /* background-color: var(--light-blue); */
  color: white;
}

#delete_tech{
	margin-left: 10px;
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

#content_wrapper{
	display: flex;
	justify-content: center;
}

#content {
  display: flex;
  justify-content: center;
  
}
/* 추가하기 */
 #insert_techstack, #addEducationButton,.addCareer,.region_create{
	/* background-color: var(--gray);
    border: none;
    color: var(--white);
    border-radius: 10px;
    cursor: pointer;
    text-align: center; */
	background-color: none;
	border: none;
   margin-top: 15px;
   cursor: pointer;
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
    top: 6%;
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
		display: flex;
   		justify-content: space-evenly;
		border-bottom: 1px solid #333;
		font-weight: bold;
		margin-right: 140px;
	}

	.follow div {
		margin-right: 7px;
		cursor: pointer;
	}

	.follower,
	.followee{
		width:200px;
		height: 30px;
		background-color:  rgb(231,231,231);
		justify-content: center;
		border-radius: 5px;
		display: flex;
   		padding: 5px;
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

/* #modalContainerIntroduction {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
} */

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
  background-color: #ffffff;
  width: 500px;
  height: 200px;
  padding: 15px;
}

/* #modalContentIntroduction {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 200px;
  padding: 15px;
} */

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

/* #modalContainerIntroduction.hidden {
  display: none;
} */

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

</style>
<link rel="stylesheet" type="text/css" href="/css/myProfile.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 자바스크립트 시작 -->
<jsp:include page="../layout/header.jsp" />
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
		$("#bookmark").click(function(){
			redirectToURL(`/member/bookmark`);
			
		});

	    /* 프로필 사진 수정 */ 
	  	// $('.profile-modify').click(function() {
	    //     var email = $(this).data('pic-id');
	    //     var url = '/memberInfo/modify/modify-profile-pic/' + email;
       	// 	window.location.href = url;
   		//  });
	    /* 자기소개 수정*/
	  	// $('.introduce-modify').click(function() {
	    //     var email = $(this).data('introduce-id');
	    //     var url = '/memberInfo/modify/update-introduction/' + email;
       	// 	window.location.href = url;
   		//  });
	    // /* 자기소개 추가 */
	    // $(".introduce-create").click(function() {
	    // 	 var email = $(this).data('introduce-id');
		//      var url = '/memberInfo/modify/update-introduction/' + email;
	    //    	 window.location.href = url;
	    // });
	    /* git, email, blog 새창으로 열기 */
	    // $("#githubIcon").click(function() {
        // 	 var githubUrl = "${generalMemberVO.githubUrl}";
        // 	 if (githubUrl) {
        // 		 window.open(githubUrl, "_blank");
        // 		 }
    	// });
    	// $("#emailIcon").click(function() {
        // 	 var emailUrl = "${generalMemberVO.additionalEmail}";
        // 	 if (emailUrl) {
        //     	window.open(emailUrl, "_blank");
        // 		}
    	// });
    	// $("#blogIcon").click(function() {
        // 	 var blogUrl = "${generalMemberVO.blogUrl}";
        // 	 if (blogUrl) {
        //         window.open(blogUrl, "_blank");
        // 		}
   		// });
		
	    //  /* git,email,blog 수정버튼 */
	 	//  $("#edit_button1").click(function() {
	    // 	 var email = $(this).data('sns');
		//      var url = '/memberInfo/modify/update-sns-link/' + email;
	    //    	 window.location.href = url;
	    // });

	    /* 채팅 */
	    $(".message_icon").click(function() {
	    	inviteUser(send, "${sessionScope._LOGIN_USER_.nickname}", "${sessionScope._LOGIN_USER_.email}", "${memberVO.email}");
	    });
	    /* 학력 수정*/
	    // $('.education-modify').click(function() {
	    //     var educationId = $(this).data('education-id');
	    //     var url = '/memberInfo/modify/update-education/' + educationId;
	    //     window.location.href = url;
    	// });
	    // /* 학력 추가 */
	    // $('#addEducationButton').click(function() {
	    //     window.location.href = '/memberInfo/modify/create-education';
	    // });

	    /* 주소 수정*/
	    $('.region_modify').click(function() {
	        var email = $(this).data('region');
	        var url = '/memberInfo/modify/update-location/' + email;
	        window.location.href = url;
    	});
	    /* 주소 추가 */ 
	  	// $('.region_create').click(function() {
	    //     var email = $(this).data('region-id');
	    //     var url = '/memberInfo/modify/create-location/' + email;
       	// 	window.location.href = url;
   		//  });

		 $(".profile-modify").click(function() {
			$("#modalContainerProfile").removeClass("hidden")
		 })

		 $(".introduce-modify").click(function() {
			$("#modalContainerIntroduction").removeClass("hidden")
		 })

		//  $(".introduce-modify").load("/memberInfo/my-introduction/{generalMemberEmail}");

 
		 $("#edit_button1").click(function() {
			$("#modalContainerSNS").removeClass("hidden")
		 })

		//  $("#edit_button1").load("/memberinfo/viewsns/{generalMemberEmail}");
		
		 $("#edit_button2").click(function() {
			$("#modalContainerTech").removeClass("hidden")
		 })

		//  $("#edit_button2").load("/memberinfo/viewsns/{generalMemberEmail}");

		 $(".addCareer").click(function() {
			$("#modalContainerCareer").removeClass("hidden")
		 })

		//  $(".addCareer").load("/memberinfo/viewsns/{generalMemberEmail}");

		 $(".addEducationButton").click(function(){
			$("#modalContainerEducation").removeClass("hidden")
		 })

		//  $(".addEducationButton").load("/memberinfo/viewsns/{generalMemberEmail}");

		 $(".region_create").click(function(){
			$("#modalContainerAddress").removeClass("hidden")
		 })

		//  $(".region_create").load("/memberinfo/addressview/{generalMemberEmail}");

		// const modalContainerCareer = document.getElementById('modalContainerCareer');
		// const modalCloseButtonCareer = document.getElementById('modalCloseButtonCareer');

		const modalCloseButton = document.getElementById('modalCloseButton');
		const modalTech = document.getElementById('modalContainerTech');
		const modalCareer = document.getElementById('modalContainerCareer');
		const modalEducation = document.getElementById('modalContainerEducation');

		// modalCloseButton.addEventListener('click', () => {
		// modalTech.classList.add('hidden');
		// });

		// modalCloseButton.addEventListener('click', () => {
		// modalCareer.classList.add('hidden');
		// });

		// modalCloseButton.addEventListener('click', () => {
		// modalEducation.classList.add('hidden');
		// });
			});

		//자기소개
		   // 페이지가 로드된 후 실행될 JavaScript 코드
		   var selfIntroTextarea = $("#selfIntro");
            var selfIntroValue = selfIntroTextarea.val();
            
            // 공백 제거 함수
            function removeSpaces(inputText) {
                return inputText.replace(/\s/g, '');
            }
            
            // 초기 텍스트 설정
            selfIntroTextarea.val(removeSpaces(selfIntroValue));
		//기술스택jsp
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

		//경력
		$.datepicker.regional['ko'] = {
            closeText: '닫기',
            prevText: '이전달',
            nextText: '다음달',
            currentText: '오늘',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            weekHeader: '주',
            dateFormat: 'yy-mm-dd',
            firstDay: 0,
            isRTL: false,
            showMonthAfterYear: true,
            yearSuffix: '년'
        };
        $.datepicker.setDefaults($.datepicker.regional['ko']);
        
        // DatePicker를 사용할 input 필드에 클래스 추가
        $(".date-picker").datepicker({
            changeYear: true,
            showButtonPanel: true,
            yearRange: "1900:+0",
            dateFormat: "yy-mm-dd"
        });
        
        // 팝업 창을 생성할 버튼 클릭 시 동작
        $("#openPopupButton").click(function() {
            $("#popup").dialog({
                width: 400,
                modal: true
            });
        });
        
        // 입력한 입사일과 퇴사일을 비교하여 이전 날짜인지 확인
        $("#hireDate, #resignDate").change(function() {
            var hireDate = $("#hireDate").datepicker("getDate");
            var resignDate = $("#resignDate").datepicker("getDate");
            
            if (hireDate && resignDate && hireDate > resignDate) {
                alert("입사일이 퇴사일보다 이전일 수 없습니다.");
                // 입사일을 초기화 또는 수정할 수 있도록 처리
                $("#hireDate").val("");
            }
        });

		//학력
		const universityApiUrl = `https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=8a2e49c8c985107112055a268b321623&svcType=api&svcCode=SCHOOL&contentType=json&gubun=univ_list&perPage=10000`;
        const departmentApiUrl = `https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=8a2e49c8c985107112055a268b321623&svcType=api&svcCode=MAJOR&contentType=json&gubun=high_list&perPage=9999`;
        let universities = [];
        let departments = [];

        // API를 호출하여 대학교 정보 가져오기
        $.ajax({
            url: universityApiUrl,
            dataType: 'json',
            success: function(data) {
                universities = data.dataSearch.content;

                // 중복된 대학교 이름 필터링
                const uniqueUniversities = [...new Set(universities.map(university => university.schoolName))];

                // 검색창에서 텍스트 입력 시 대학교 검색 결과 업데이트
                $('#search-university-input').on('input', function() {
                    const searchText = $(this).val().toLowerCase();
                    const searchResults = uniqueUniversities.filter(universityName => universityName.toLowerCase().includes(searchText));
                    // 대학교 검색 결과를 화면에 표시
                    displayUniversitySearchResults(searchResults);
                });
            }
        });

       // API를 호출하여 학과 정보 가져오기
        $.ajax({
            url: departmentApiUrl,
            dataType: 'json',
            success: function(data) {
                departments = data.dataSearch.content;
                // 학과 검색창에서 텍스트 입력 시 학과 검색 결과 업데이트
                $('#search-department-input').on('input', function() {
                    const searchText = $(this).val().toLowerCase();
                    const searchResults = departments.filter(department => department.facilName.toLowerCase().includes(searchText));
                    // 학과 검색 결과를 화면에 표시
                    displayDepartmentSearchResults(searchResults);
                });
            },
        });

        // 대학교 검색 결과를 표시하는 함수
        function displayUniversitySearchResults(results) {
            const searchResultsContainer = $('#search-university-results');
            searchResultsContainer.empty();
            results.forEach(result => {
            	searchResultsContainer.append(`<p class='result-item university' data-name='\${result}'>\${result}</p>`);
            });

            // 대학교 검색 결과 항목을 클릭했을 때 해당 대학이 검색 창에 나타남
            $('.result-item.university').click(function() {
                const selectedUniversityName = $(this).data('name');
                $('#search-university-input').val(selectedUniversityName);
                searchResultsContainer.empty();
            });
        }

      // 학과 검색 결과를 표시하는 함수
        function displayDepartmentSearchResults(results) {
            const searchResultsContainer = $('#search-department-results');
            searchResultsContainer.empty();
            results.forEach(result => {
                const facilNameArray = result.facilName.split(', '); // 쉼표로 구분된 항목을 배열로 분리
                facilNameArray.forEach(facil => {
                    searchResultsContainer.append(`<p class="result-item department" data-name="\${facil}">\${facil}</p>`);
                });
            });
            
            // 학과 검색 결과 항목을 클릭했을 때 선택한 학과를 검색 창에 설정
            $('.result-item.department').click(function() {
                const selectedDepartment = $(this).data('name');
                $('#search-department-input').val(selectedDepartment);
                searchResultsContainer.empty();
            });
        }
  	 
      $("#search-university-input").click(function() {
  	      $(".school_errors").hide();
  	  });
  	
  	  $("#search-department-input").click(function() {
  	      $(".department_errors").hide();
  	  });

	  //주소
	  function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
    }

	$("#region_button").click(function() {
 	      $(".region_errors").hide();
 	  	 });
</script>
</head>
<body>
	<div id="content_wrapper">
	<div id="content">
		<div class="flex_button">
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
		<div class="flex_main">	
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
				<div id="modalContainerProfile" class="hidden">
					<div id="modalContentProfile">
						<form method="post" action="/memberInfo/modify/update-profile-pic" enctype="multipart/form-data">
							<input type="hidden" name="email" value="${sessionScope._LOGIN_USER_.email}" />
							<div class="profile-container">
								<h1>프로필 사진</h1>
								<img src="${memberVO.profilePic}" alt="프로필 사진" class="profile-image" id="profile-image">
								<div class="file-input">
									<input type="file" id="profilePic" name="profilePic" />
								</div>
							</div>
								<input type="submit" value="수정" />
						</form>
						<button id="modalCloseButton">닫기</button>
					</div>
				</div>
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
									<!-- <div id="modalContainerIntroduction" class="hidden">
										<div id="modalContenIntroduction">
											<form method="post" action="/memberInfo/modify/update-introduction">
												<input type="hidden" name="generalMemberEmail" value="${sessionScope._LOGIN_USER_.email}"/>
												<label>자기소개 </label>
												  <textarea name="selfIntro" id="selfIntro" placeholder="간단한 문구를 입력해 주세요 😊" style="height: 50px">
												  ${generalMemberVO.selfIntro}
												  </textarea>
												<input type="submit" value="수정" />
												</form>
											<button id="modalCloseButton">닫기</button>
										</div>
									</div> -->
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
	  <div class="follower" data-email="${memberVO.email}">팔로워
		<img id="arrow" src="/images/아래.png/" alt="arrow">
	  </div>
	  <div class="followee" data-email="${memberVO.email}">팔로잉
		<img id="arrow" src="/images/아래.png/" alt="arrow">
	  </div>
	  <div class="follow_chat">
		<%-- <c:choose>
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
		</form>   --%>
		<button class="message_icon">✉ 메시지</button>
	</div>
	</div>
	<div class="related_link">
		<div id="SNS">
			<img src="https://cdn-icons-png.flaticon.com/512/25/25231.png" alt="Icon 1" id="githubIcon">
			<!-- <div>${generalMemberVO.githubUrl}</div> -->
		</div>
		<div id="SNS">
        <img src="https://w7.pngwing.com/pngs/863/247/png-transparent-email-computer-icons-email-miscellaneous-angle-text.png" alt="Icon 2" id="emailIcon"> 
		<!-- <div>${generalMemberVO.additionalEmail}</div> -->
		</div>
		<div id="SNS">
        <img src="https://i.pinimg.com/originals/f8/0b/dd/f80bdd79a51358da6ee41a0fda520394.png" alt="Icon 3" id="blogIcon">
		<!-- <div>${generalMemberVO.blogUrl}</div> -->
		</div>
		<c:if
		test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
			<button data-sns="${sessionScope._LOGIN_USER_.email }" id="edit_button1"> 
				수정
			</button>
			<div id="modalContainerSNS" class="hidden">
				<div id="modalContentSNS">
					<form method="post" action="/memberInfo/modify/update-sns-link">
						<input type="hidden" name="generalMemberEmail" value="${sessionScope._LOGIN_USER_.email}"/>
						<label>Github 주소</label>
						<input type="text" id="githubUrl" name="githubUrl" value="${generalMemberVO.githubUrl}" placeholder="Github Url">
						<label>이메일 주소</label>
						<input type="email" id="additionalEmail" name="additionalEmail" value="${generalMemberVO.additionalEmail}" placeholder="Email Url">
						<label>Blog 주소</label>
						<input type="text" id="blogUrl" name="blogUrl" value="${generalMemberVO.blogUrl}" placeholder="Blog Url">
						<input type="submit" value="수정" />
					</form>
				</div>
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
						<li>#${commonCode.codeContent}</li>
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button data-teach="${sessionScope._LOGIN_USER_.email }" id="edit_button2">수정</button>
							<div id="modalContainerTech" class="hidden">
								<div id="modalContentTech">
									<form method="post" action="/memberInfo/modify/update-tech">
										<input type="hidden" name="email" value="${sessionScope._LOGIN_USER_.email}" />
										<h3>기술스택 수정</h3>
											<label class="label" for="hashtagId"></label>
											<div id="techstack_category"></div>
										<input type="submit" value="수정">
											<button id="modalCloseButton">닫기</button>
									</form>	
								</div>
							</div>
						<button data-deleteteach="${sessionScope._LOGIN_USER_.email }" id="delete_tech">삭제</button>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
							test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
							<button id="insert_techstack">
								<img id="add" src="/images/작성.png/" alt="추가하기">
							</button>
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
								<button data-education-id="${education.educationId}" class="education-modify">수정</button>
								<!-- <div id="modalContainerEducation" class="hidden">
									<div id="modalContentEducation">
										<form:form modelAttribute="educationVO" method ="post">
											<h2>대학교 및 학과 검색</h2>
										
											<div id="university-section">
												<h3>대학교 검색</h3>
												<input type="text" id="search-university-input" name="schoolName" placeholder="대학교 검색">
												<form:errors path="schoolName" element="div" cssClass="school_errors" />
												<div id="search-university-results">
													
												</div>
											</div>
										
											<div id="department-section">
												<h3>학과 검색</h3>
												<input type="text" id="search-department-input" name="schoolDepartment" placeholder="학과 검색">
												<form:errors path="schoolDepartment" element="div" cssClass="department_errors" />
												<div id="search-department-results">
													
												</div>
											</div>
											<select id="degree" name="degrees" required>
												<option value="" disabled selected hidden>선택하세요</option>
												<option value="석사">석사</option>
												<option value="학사">학사</option>
												<option value="박사">박사</option>
											</select>
											<input type="submit" value="저장"/>
										</form:form>
									</div>
								</div> -->
							</c:if>
						</li>						
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button id="addEducationButton">
							<img id="add" src="/images/작성.png/" alt="추가하기">
						</button>	
						<!-- <div id="modalContainerEducation" class="hidden">
							<div id="modalContentEducation">
								<form:form modelAttribute="educationVO" method ="post">
									<h2>대학교 및 학과 검색</h2>
								
									<div id="university-section">
										<h3>대학교 검색</h3>
										<input type="text" id="search-university-input" name="schoolName" placeholder="대학교 검색">
										<form:errors path="schoolName" element="div" cssClass="school_errors" />
										<div id="search-university-results">
											
										</div>
									</div>
								
									<div id="department-section">
										<h3>학과 검색</h3>
										<input type="text" id="search-department-input" name="schoolDepartment" placeholder="학과 검색">
										<form:errors path="schoolDepartment" element="div" cssClass="department_errors" />
										<div id="search-department-results">
											
										</div>
									</div>
									<select id="degree" name="degrees" required>
										<option value="" disabled selected hidden>선택하세요</option>
										<option value="석사">석사</option>
										<option value="학사">학사</option>
										<option value="박사">박사</option>
									</select>
									<input type="submit" value="저장"/>
								</form:form>
							</div>
						</div>			 -->
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button id="addEducationButton">
							<img id="add" src="/images/작성.png/" alt="추가하기">
						</button>
					</c:if></li>
				</c:otherwise>
			</c:choose>		
			<div id="modalContainerEducation" class="hidden">
				<div id="modalContentEducation">
					<form:form modelAttribute="educationVO" method ="post">
						<h2>대학교 및 학과 검색</h2>
					
						<div id="university-section">
							<h3>대학교 검색</h3>
							<input type="text" id="search-university-input" name="schoolName" placeholder="대학교 검색">
							<form:errors path="schoolName" element="div" cssClass="school_errors" />
							<div id="search-university-results">
								
							</div>
						</div>
					
						<div id="department-section">
							<h3>학과 검색</h3>
							<input type="text" id="search-department-input" name="schoolDepartment" placeholder="학과 검색">
							<form:errors path="schoolDepartment" element="div" cssClass="department_errors" />
							<div id="search-department-results">
							
							</div>
						</div>
						<select id="degree" name="degrees" required>
							<option value="" disabled selected hidden>선택하세요</option>
							<option value="석사">석사</option>
							<option value="학사">학사</option>
							<option value="박사">박사</option>
						</select>
						<input type="submit" value="저장"/>
					</form:form>
				</div>
			</div>
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
								<!-- <button data-career="${career.careerId}" class="career-modify">수정</button> -->
										
							</c:if>
						</li>
					</c:forEach>
					<c:if
						test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<button class="addCareer">
							<img id="add" src="/images/작성.png/" alt="추가하기">
						</button>
						    <form method="post">
								<div>
									<label for="previousCompanyName">근무 회사명:</label>
									<input type="text" id="previousCompanyName" name="previousCompanyName" required>
								</div>
								<div>
									<label for="jobTitle">직무명:</label>
									<input type="text" id="jobTitle" name="jobTitle" required>
								</div>
								<div>
									<label for="hireDate">입사일:</label>
									<input type="text" id="hireDate" name="hireDate" class="date-picker" placeholder="YYYY-MM-DD" required>
								</div>
								<div>
									<label for="resignDate">퇴사일:</label>
									<input type="text" id="resignDate" name="resignDate" class="date-picker" placeholder="YYYY-MM-DD">
								</div>
								<input type="submit" value="저장">
							</form>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><c:if
							test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
							<button class="addCareer">
								<img id="add" src="/images/작성.png/" alt="추가하기">
							</button>						
						</c:if></li>
				</c:otherwise>

			</c:choose>
			<div id="modalContainerCareer" class="hidden">
				<div id="modalContentCareer">
					<form method="post">
						<div>
							<label for="previousCompanyName">근무 회사명:</label>
							<input type="text" id="previousCompanyName" name="previousCompanyName" required>
						</div>
						<div>
							<label for="jobTitle">직무명:</label>
							<input type="text" id="jobTitle" name="jobTitle" required>
						</div>
						<div>
							<label for="hireDate">입사일:</label>
							<input type="text" id="hireDate" name="hireDate" class="date-picker" placeholder="YYYY-MM-DD" required>
						</div>
						<div>
							<label for="resignDate">퇴사일:</label>
							<input type="text" id="resignDate" name="resignDate" class="date-picker" placeholder="YYYY-MM-DD">
						</div>
						<input type="submit" value="저장">
					</form>
					
					<button id="modalCloseButton">닫기</button>
				</div>
			</div>
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
						<div id="modalContainerAddress" class="hidden">
							<div id="modalContentAddress">
								<form:form modelAttribute="generalMemberVO" method="post" action="/memberInfo/modify/create-location">
									<input type="hidden" name="generalMemberEmail" value="${generalMemberVO.generalMemberEmail }"/>
									<input type="text" id="sample6_postcode" placeholder="우편번호" readonly>
									<input type="button" onclick="sample6_execDaumPostcode()" id="region_button" value="우편번호 찾기" ><br>
									<input type="text" id="region" name ="region" placeholder="주소" readonly ><br>
										<form:errors path="region" element="div" cssClass="region_errors" />
									<input type="submit" value="작성" />
								</form:form>
								<button id="modalCloseButton">닫기</button>
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
</div>
</div>
<jsp:include page="../layout/footer.jsp" />
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

	//마이페이지 회원 이메일
      /* $('.follow_icon').click(function() {
	    var email = $(this).data('email');
	    console.log(email)
	  }) */
            
            template = `
            <c:if test="${sessionScope._LOGIN_USER_.email != memberVO.email}" >
  				<button class="follow_icon" data-email="${memberVO.email}">
  				  <img src="https://cdn-icons-png.flaticon.com/512/907/907873.png" />
  				  팔로우
  				  <input type="hidden" class="followerEmail" value="${sessionScope._LOGIN_USER_.email}" />
  	              <input type="hidden" class="followeeEmail" value="${memberVO.email}" />
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
		        templateDom.find('.follow_icon').prepend($(`<input type="hidden" class="followId" value="\${state.followId}"/>`))
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
				  $(e.currentTarget).removeClass('follow_on')
				  $(e.currentTarget).css({'background-color':'var(--white)', 'color':'var(--black)'})
				  $('.followId').remove()
				})
			  }
			  else {
				$.post('/follow/member', content, function(result) {
				   if(result) {
					 $(e.currentTarget).css({'background-color':'var(--blue)', 'color':'var(--white)'})
					 $(e.currentTarget).addClass('follow_on')
					 $('.follow_icon').prepend(`<input type="hidden" class="followId" value="\${result.followId}"/>`)
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