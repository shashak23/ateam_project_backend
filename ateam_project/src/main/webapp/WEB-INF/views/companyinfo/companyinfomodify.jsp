<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../layout/header.jsp" />
<style>
body>.body_container {
	width: 100%;
	min-height: 75vh;
	display: grid;
	grid-template-columns: 1fr 1080px 1fr;
}

/* Main Contents */
body>.body_container>.body {
	grid-column: 2/3;
	margin-top: 20px;
}

/* Main Contents 왼쪽 여백*/
body>.body_container>.body_left_aside {
	grid-column: 1/2;
	display: flex;
	justify-content: flex-end;
	margin-top: 51px;
}

/* Main Contents 오른쪽 여백*/
body>.body_container>.body_right_aside {
	grid-column: 3/4;
}

.companyInfoModify {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.flex_button {
	display: flex;
	flex-direction: column;
	margin: 50px 120px 0px 0px;
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
	background-color: #26577C;
	color: white;
}

#companyEmail, #contactNumber, #pw, #confirmPw {
	width: 400px;
	height: 40px;
	padding: 8px;
	border: 2px solid rgb(231, 231, 231);
}

#password {
	display: flex;
	flex-direction: column;
}

.submit_btn {
	width: 60px;
	height: 40px;
	border-radius: 6px;
	border: none;
}

form {
	margin: 10px;
}

.info {
	margin-bottom: 10px;
}

h2 {
	margin: 100px 0px 20px 0px;
}

h3 {
	margin-bottom: 15px;
}

#origin, #changed {
	display: flex;
}

#conPW {
	margin-top: 10px;
}
</style>
<script type="text/javascript">
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
			<c:if
				test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
				<div class="flex_button">
					<a href="/companyinfo/view">
						<button id="myprofile">마이프로필</button>
					</a> <a href="/companyinfo/modify">
						<button id="modify_info">정보 수정</button>
					</a> <a href="/companyinfo/mypost">
						<button id="mypost">내가 쓴 게시글</button>
					</a> <a href="/member/logout">
						<button id="quit">탈퇴</button>
					</a>
				</div>
			</c:if>
		</div>

		<div class="body">
			<div class="companyInfoModify">
				<form:form>
					<!-- <label class="info" for="companyEmail">회사 이메일</label><br> -->
					<h3>회사 이메일</h3>
					<input type="text" name="companyEmail" id="companyEmail"
						value="${companyVO.companyEmail}"
						placeholder="${companyVO.companyEmail}">
					<input class="submit_btn" type="submit" value="변경" />
				</form:form>

				<form:form modelAttribute="companyVO" method="post">
					<!-- <label class="info" for="contactNumber">담당자 연락처</label><br> -->
					<h3>담당자 연락처</h3>
					<input type="text" name="contactNumber" id="contactNumber"
						value="${companyVO.contactNumber}"
						placeholder="${companyVO.contactNumber}">
					<input class="submit_btn" type="submit" value="변경" />
				</form:form>

				<form:form modelAttribute="memberVO" method="post">
					<h3>비밀번호</h3>
					<div id="password">
						<label for="pw">비밀번호</label>
						<div id="origin">
							<input type="text" name="pw" id="pw" value="${memberVO.pw}" />
							<!-- <input class="submit_btn" type="submit" value="변경" />	 -->
						</div>
						<label for="confirmPw" id="conPW">비밀번호 확인</label>
						<div id="changed">
							<input id="confirmPw" type="password" name="confirmPw" /> <input
								class="submit_btn" type="submit" value="변경" />
						</div>
						<br> <span class="err_confirm_password"></span>

						<form:errors path="confirmPw" element="div"
							cssClass="confirmPw_errors" />

					</div>
				</form:form>
			</div>
		</div>

		<div class="body_right_aside"></div>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>