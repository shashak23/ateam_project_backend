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

#container{
	display: flex;
	justify-content: center;
}

.flex_button{
	margin-left:120px;
}
.flex_mains {
	display: flex;
	flex-direction: column;
	width: 1200px;
	height: 689px;
}
.emil{
	margin-top: 97px;
}

#emailSpace{
	width: 400px;
	height: 40px;
    padding: 8px;
	border: 2px solid rgb(231,231,231);
}

#nicknameSpace{
	width: 400px;
	height: 40px;
    padding: 8px;
	border: 2px solid rgb(231,231,231);
}

.info{
	width:500px;
	/* border-bottom: 0.0625rem solid rgb(231,231,231); */
	margin-bottom: 15px;
}
	
.value {
	margin: 10px 0; /* 각 항목 사이의 여백을 설정합니다. */
	display: flex;
}

a {
	
	margin-left: 10px;
	text-decoration: none; /* 링크의 밑줄을 제거합니다. */
	color: #007bff; /* 링크 텍스트의 색상을 설정합니다. */
}

img{
	width:15px;
	height: 15px;
	text-decoration: none;
}

a:hover {
	text-decoration: none; /* 링크에 마우스 오버 시 밑줄을 추가합니다. */
}
h3{
	margin-bottom: 15px;
}
</style>
<link rel="stylesheet" type="text/css" href="/css/myProfile.css" />
<!-- 자바스크립트 시작 -->
<jsp:include page="../../layout/header.jsp" />
<script type="text/javascript">
	function redirectToURL(url) {
	    window.location.href = url;
	}
$().ready(function() {
	$("#my_profile").click(function() {
		redirectToURL(`/memberinfo/view/${memberVO.email}`);
	});
});
</script>
</head>
<body>
	<div id="container">
		<div class="flex_button">
			<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
				<div class="flex_button">
					<button id="myprofile">마이페이지</button>
					<button>북마크</button>
					<button id="modify_info">정보 수정</button>
					<button id="mypost">내가 쓴 게시글</button>
					<button id="solve">내가 푼 문제</button>
					<button>탈퇴</button>
				</div>
			</c:if>
		</div>
		<div class="flex_mains">
			<div class="info">
				<h3 class="emil">이메일</h3>
				<div id="emailSpace">${memberVO.email}</div> 
			</div>
			<div class="info">
				<div class="value">
					<h3>닉네임
						<a href="/memberInfo/modify/update-nickname/${memberVO.email}">
							<img src="/images/작성.png" alt="작성"> 수정</a>
					</h3>
					
				</div>
					<div id="nicknameSpace">${memberVO.nickname}</div>
					
				
			</div>
			<div class="info">
				<div class="value">
					<h3>
						비밀번호 <a href="/memberInfo/modify/update-password/${memberVO.email}">
						<img src="/images/작성.png" alt="작성">	수정</a>
					</h3>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../layout/footer.jsp" />
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
	//  $("#my_profile").click(function() {
	//         redirectToURL(`/memberInfo/view/${memberVO.email}`);
	//     });

		
	//     $("#mypost").click(function() {
	//         redirectToURL(`/member/mypost`);
	//     });
	//     $("#modify_info").click(function() {
	//         redirectToURL(`/member/selectmember/${memberVO.email}`);
	//     });
	/* 비밀번호, 닉네임 수정 버튼 */
	$("#myprofile").click(function() {
			redirectToURL("/memberinfo/view/${sessionScope._LOGIN_USER_.email}");
		});
	    $("#mypost").click(function() {
	        redirectToURL(`/member/mypost`);
	    });
	    $("#modify_info").click(function() {
	        redirectToURL("/member/selectmember/${sessionScope._LOGIN_USER_.email}");
	    });
		$("#quit").click(function() {
	        redirectToURL(`/member/logout`);
	    });
		$("#solve").click(function(){
			redirectToURL(`/codingtest/mylist`);
		});
        
</script>
</html>