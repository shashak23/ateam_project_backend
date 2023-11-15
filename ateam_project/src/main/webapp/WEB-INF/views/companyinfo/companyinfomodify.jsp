<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <title>devGround</title>
        <link rel="preconnect" href="https://fonts.googleapis.com"> 
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" /> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="/js/lib/jquery-3.7.1.js"></script> 
        <link rel="stylesheet" type="text/css" href="/css/common.css" />
<jsp:include page="../layout/header.jsp" />
<style>
	.companyInfoModify {
		display: flex;
		flex-direction: column;
		/* margin-left: 100px;
		margin-top: 20px; */
		align-items: center;
	}
	.flex_button {
		/* width: 150px; */
		/* margin: 50px 50px 30px 0px; */
		display: flex;
		flex-direction: column;
		text-align: end;
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

	#companyEmail,
	#contactNumber,
	#pw {
		width: 400px;
		height: 40px;
		padding: 8px;
		border: 2px solid rgb(231,231,231);
	}

	.submit_btn{
		width: 60px;
		height: 40px;
		border-radius: 6px;
		border: none;
	}

	form{
		margin: 10px;
	}

	.info{
		margin-bottom: 10px;
	}

	h2{
		margin: 100px 0px 20px 0px;
	}
</style>
<script>
	  function redirectToURL(url) {
	        window.location.href = url;
	   }
    /* 비밀번호, 닉네임 수정 버튼 */
	$("#myprofile").click(function() {
			redirectToURL(`/memberinfo/view/${memberVO.email}`);
		});
		$("#mypost").click(function() {
	        redirectToURL(`/member/mypost`);
	    });
	    $("#modify_info").click(function() {
	        redirectToURL(`/member/selectmember/${memberVO.email}`);
	    });
		$("#quit").click(function() {
	        redirectToURL(`/member/logout`);
	    });
	
     
	// 모달창 열고 닫기
	$(document).on('click', '.incomplete', function() {
		$('.modal, .overlay').addClass('modal_active')
	})
	$(document).on('click', '.overlay', function() {
		$('.modal, .overlay').removeClass('modal_active')
	})

	$(document).on('keyup', function(e) {
		if (e.key === 'Escape') {
		$('.modal, .overlay').removeClass('modal_active')
		}
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

  // 메인 에디터 영역 모달
  $('.home_edit_container').mouseenter(function() {
    $('.edit_btn').css('background-color', 'var(--gray)')
  })
  $('.home_edit_container').mouseleave(function() {
    $('.edit_btn').css('background-color', '')
  })
</script>
</head>
<body>
	<div class="body_container">
		<div class="body_left_aside">
			<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
				<div class="flex_button">
					<a href="/companyinfo/view">
						<button id="myprofile">마이프로필</button>
					</a>
					<a href="/companyinfo/modify">
						<button id="modify_info">정보 수정</button>
					</a>
					<a href="/companyinfo/mypost">
						<button id="mypost">내가 쓴 게시글</button>
					</a>
					<a href="/member/logout">
						<button id="quit">탈퇴</button>
					</a>
				</div>
			</c:if>
		</div>

		<div class="body">
			<div class="companyInfoModify">
				<form:form>
					<label class="info" for="companyEmail">회사 이메일</label><br>
					<input type="text" name="companyEmail" id="companyEmail" value="${companyVO.companyEmail}" placeholder="${companyVO.companyEmail}">
					<input class="submit_btn" type="submit" value="변경" />
				</form:form>
	
				<form:form modelAttribute="companyVO" method="post">
					<label class="info" for="contactNumber">담당자 연락처</label><br>
					<input type="text" name="contactNumber" id="contactNumber" value="${companyVO.contactNumber}" placeholder="${companyVO.contactNumber}">
					<input class="submit_btn" type="submit" value="변경" />			
				</form:form>
	
				<form:form modelAttribute="memberVO" method="post">    	
					<label class="info" for="pw">비밀번호</label><br>
					<input type="text" name="pw" id="pw" value="${memberVO.pw}" />
					<input class="submit_btn" type="submit" value="변경" />			
				</form:form>
			</div>
		</div>

        <div class="body_right_aside"></div>
	</div>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>