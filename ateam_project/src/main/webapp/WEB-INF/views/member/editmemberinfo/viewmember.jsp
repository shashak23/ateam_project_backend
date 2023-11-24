<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!--스타일,폰트 지정-->
<!--스와이퍼 기능 지정-->
<jsp:include page="../../layout/header.jsp" />
<script type="text/javascript">
	function redirectToURL(url) {
	    window.location.href = url;
	}
$().ready(function() {
	$("#my_profile").click(function() {
		redirectToURL(`/memberinfo/view/${memberVO.email}`);
	});

	$("#nickname").keyup(function(){
            $.get("/memberInfo/modify/update-nickname/vaildation", {
            	nickname: $("#nickname").val()
            }, function(response) {
                var nickname = response.nickname
                var available = response.available

                if (available) {
                    $("#nickname").addClass("available")
                    $("#nickname").removeClass("unusable")
                    $("#btn-regist").removeAttr("disabled")
                }
                else {
                    $("#nickname").addClass("unusable")
                    $("#nickname").removeClass("available")
                    $("#btn-regist").attr("disabled", "disabled")
                }
            })
        })
   
	 $("#nickname").click(function() {
 	      $(".nickname_errors").hide();
 	  	 });
// 비밀번호 수정
			$("#confirmPw").on("input", function() {
	    var pw = $("#pw").val();
	    var confirmPw = $(this).val();
	    var errConfirmPassword = $(".err_confirm_password");
	    
	    
	    if (pw === confirmPw) {
	        errConfirmPassword.text(""); 
	    } else {
	        errConfirmPassword.text("* 비밀번호가 일치하지 않습니다.");
	    }
	
	    // 비밀번호 길이 확인
	    if (pw.length >= 5 && pw.length <= 10) {
	        $(".err_password").text(""); 
	    } else {
	        $(".err_password").text("* 5~10글자까지만 입력 가능합니다.");
	    }
	});
	$("#pw").click(function() {
	      $(".pw_errors").hide();
	});
	$("#confirmPw").click(function() {
	      $(".confirmPw_errors").hide();
	});
		 
});
</script>
<style>
	body > .body_container {
    width: 100%;
    min-height: 75vh;
    display: grid;
    grid-template-columns: 1fr 1080px 1fr;
	}
	
	/* Main Contents */
	body > .body_container > .body {
	    grid-column: 2/3;
		margin: 40px 0 100px 100px;
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
		margin: 50px 120px 0px 0px;
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
        background-color: #26577C;
        color: white;
	} 

	#emailSpace,
	#nicknameSpace,
	#pw, #confirmPw
	{
		width: 400px;
		height: 40px;
		padding: 8px;
		border: 2px solid rgb(231,231,231);
	}

	.pw{
		display: flex;
		flex-direction: column;
	}

		

	.info{
		width:500px;
		/* border-bottom: 0.0625rem solid rgb(231,231,231); */
		margin-bottom: 15px;
	}

	#btnUpdateNickname,
	#btnUpdatePassword{
		width: 60px;
		height: 40px;
		border-radius: 6px;
		background-color: #F0F0F0;
		border: none;
		padding: 5px;
		border-radius: 5px;
		cursor: pointer;
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

	.errors {
			opacity: 0.8;
			padding: 10px;
			color: red;
			font-size: 10pt;
			display: inline-block;
		}
		.errors:last-child {
			margin-bottom: 15px;
		}
		.err_password, .err_confirm_password {
		color: red;
		font-size: 10pt;
	}
</style>
</head>
<body>
	<div class="body_container">
		<div class="body_left_aside">					
			<div class="flex_button">
				<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">			
						<button id="myprofile">마이페이지</button>
						<button id="bookmark">북마크</button>
						<button id="modify_info">정보 수정</button>
						<button id="mypost">내가 쓴 게시글</button>
						<button id="solve">내가 푼 문제</button>
						<button>탈퇴</button>				
				</c:if>
			</div>
		</div>
		<div class="body">
			<div class="info">
				<h3 class="emil">이메일</h3>
				<div id="emailSpace">${memberVO.email}</div> 
			</div>
			<div class="info">
				<form:form modelAttribute="memberVO" method="post">
					<input type="hidden" name="email" value="${memberVO.email}" />
					<h3>닉네임</h3>
					<input type="text" name="nickname" id="nicknameSpace" value="${memberVO.nickname}">
					<input id="btnUpdateNickname" disabled="disabled" type="submit" value="변경" />
					<form:errors path="nickname" element="div" cssClass="nickname_errors" />	
				</form:form>			
			</div>
			<div class="info">
				<form:form modelAttribute="memberVO" method="post" action="/memberInfo/modify/update-password">
					<input type="hidden" name="email" value="${memberVO.email}" />
					<h3>비밀번호</h3>
					<div class="pw">
						<label for="pw">비밀번호</label>
						<input type="password" name="pw" id="pw">
						<br><span class="err_password"></span>
						<form:errors path="pw" element="div" cssClass="pw_errors" />
						<div>
							<label for="confirmPw">비밀번호 확인</label>
							<input id="confirmPw" type="password" name="confirmPw" />
							<input id="btnUpdatePassword" type="submit" value="변경" />
							<br><span class="err_confirm_password"></span>
							
							<form:errors path="confirmPw" element="div" cssClass="confirmPw_errors" />
						</div>
					</div>
				</form:form>
			</div>
		</div>
		<div class="body_right_aside"></div>
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
	  $(this).find('a').css({'background-color': '#E55604',
	                         'color': 'white',
	                         'box-shadow': '0 0 5px var(--gray)'})
	})
	$('.list_company').mouseleave(function() {
	  $('.visible').hide()
	  $(this).find('a').css({'background-color': 'white',
	                         'color': '#E55604',
	                         'box-shadow': 'none'})
	})
	
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
		$("#bookmark").click(function(){
			redirectToURL(`/member/bookmark`);
			
		});
        
</script>
</html>