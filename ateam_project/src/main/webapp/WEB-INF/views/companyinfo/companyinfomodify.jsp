<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../layout/header.jsp" />
<style>
	header {
	    background-color: #333;
	    color: white; 
	    padding: 45px; 
	    margin: 20px 0;
	    font-size: 25px; /* 글자 크기 설정 */
	}

	#overall{
		display: flex;
		justify-content: center;
	}
	
	#container {    
		width: 1100px;  
	}

	.companyInfo_update_table{
		font-weight: bold;
		margin-bottom: 50px;
	}
	
	.flex_button {	
		width: 150px;
		margin: 100px 50px 0px 0px;
		display: flex;
		flex-direction: column;
	}

	.body_container{
	    margin: 0 auto;
		margin-bottom: 100px;
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
	

	#contactName,
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

<div id="overall">
	<div class="flex_button">
		<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
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
		</c:if>
	</div>


	<div id="container">
		<div class="companyInfo_update_table">
			<h2>기업정보수정</h2>
		<form:form modelAttribute="companyVO" method="post">
			
				<label class="info" for="contactName">담당자 이름 변경</label><br>
				<input type="text" name="contactName" id="contactName" value="${companyVO.contactName}">
				<input class="submit_btn" type="submit" value="변경완료" />			
		</form:form>
				<form:form modelAttribute="companyVO" method="post">
			
				<label class="info" for="contactNumber">담당자 연락처 변경</label><br>
				<input type="text" name="contactNumber" id="contactNumber" value="${companyVO.contactNumber}">
				<input class="submit_btn" type="submit" value="변경완료" />			
		</form:form>
		<form:form modelAttribute="memberVO" method="post">    
			
				<label class="info" for="pw">기업회원 비밀번호 변경</label><br>
				<input type="text" name="pw" id="pw" value="${memberVO.pw}" />
				<input class="submit_btn" type="submit" value="변경완료" />			
		</form:form>
		</div>
	</div>
</div>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>