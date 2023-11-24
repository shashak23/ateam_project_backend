<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="./companyMyPage.css" />
<jsp:include page="../layout/header.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<script type="text/javascript">
	$().ready(function() {
		
		$.get("/member/COMPANY", function(response) {
			for (var i = 0; i < response.length; i++) {
				var member = response[i]
				var option = $("<option value='"+member.nickname+"'></option>");
				$("#nicList").append(option);
			}
		});
		
		$("#search-btn").click(function() {
			$("#search-form").attr({
				"method": "get",
				"action": "/algorithm/question/list"
			}).submit()
		});
	
			$(document).on('click', '.register', function(e) {
				let userEmail = `${sessionScope._LOGIN_USER_}`
				let memberType = `${sessionScope._LOGIN_USER_.memberType}`
				if (userEmail === '') {
					if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?') ) {
						window.location.href="/member/auth"
					}
				}
				if (memberType === 'GENERAL') {
					alert('기업회원만 이용하실 수 있는 서비스입니다.')
					window.location.href="/algorithm/question/list"
				}
				if (memberType === 'COMPANY') {
					window.location.href="/algorithm/question/create"
				}
		
			})
		
		
			$(".intro_button").on('click', function() {
				var currentIntro = $(".list_intro p").text();
				$("#introTextArea").val(currentIntro);
				$("#modalContainerIntro").removeClass("hidden");
			});

			function saveintroChanges() {
					var newIntro = $("#introTextArea").val();
					$(".list_intro p").text(newIntro);
					closeIntroModal();
			}
		
			$(".stack_button").click(function() {
				var currentStack = $(".stackList").text();
				$("#stackTextArea").val(currentStack);
					$("#modalContainerStack").removeClass("hidden")
				 })

			function savestackChanges() {
			var newStack = $("#stackTextArea").val();
			$(".stackList").text(newStack);
			closeStackModal();
			}
		
			$(".task_button").click(function() {
			var currentTask = $(".taskInfo").text();
			$("#taskTextArea").val(currentTask);
			$("#modalContainerTask").removeClass("hidden")
			})
			
			function savetaskChanges() {
			var newTask = $("#taskTextArea").val();
			$(".taskInfo").text(newTask);
			closeTaskModal();
			}

			$(".location_button").click(function() {
			var currentLocation = $(".address").text();
			$("#locationTextArea").val(currentLocation);
			$("#modalContainerLocation").removeClass("hidden")
			})

			function savelocationChanges() {
			var newLocation = $("#locationTextArea").val();
			$(".address").text(newLocation);
			closeLocationModal();
			}

			//닫기 버튼
			$("#modalCloseIntro").on('click',function(){
				$("#modalContainerIntro").addClass("hidden");
			})

			$("#modalCloseStack").on('click',function(){
				$("#modalContainerStack").addClass("hidden");
			})
		

			$("#modalCloseTask").on('click',function(){
				$("#modalContainerTask").addClass("hidden");
			})
		

			$("#modalCloseLocation").on('click',function(){
				$("#modalContainerLocation").addClass("hidden");
			})

			//변경 저장
			$("#saveIntro").on('click',function(){
				saveintroChanges();
			})

			$("#saveStack").on('click',function(){
				savestackChanges();
			})

			$("#saveTask").on('click',function(){
				savetaskChanges();
			})

			$("#saveLocation").on('click',function(){
				savelocationChanges();
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
		
		  //검색 전후 마진 바텀 적용
		  $("#search_btn").click(function() {
				// 검색이 수행되었는지 확인하고 여백을 동적으로 조절합니다.
				if ($("#search_form input[type='checkbox']:checked").length > 0) {
					$("#overall").css("margin-bottom", "300px");
					// $("#container").css("margin-bottom", "100px");
				} else {
					// 검색이 수행되지 않았다면 여백을 초기화합니다.
					$("#left_container").css("margin-bottom", "0");
					$("#container").css("margin-bottom", "0");
				}
		
				// 폼 제출을 계속 진행합니다.
				$("#search_form").attr({
					"method": "get",
					"action": "/algorithm/explanation/list"
				}).submit();
			});
		
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
		
			
	})
</script>
</head>
<style>
@charset "utf-8";
#overall{
	display: flex;
	justify-content: center;
}

#container {
  display: grid;
  grid-gap: 30px;
  grid-template-columns: 300px 1fr;
}

.flex_button {
  display: flex;
  flex-direction: column;
  margin-left: 120px;
  margin-top: 51px;
}


.intro_button,
.stack_button,
.task_button,
.location_button {
	background-color: transparent;
	border: none;
	cursor: pointer;
	padding: 3px;
}

.location_button {
	padding-left: 10px;
}

.intro_button .intro_button_img,
.stack_button img,
.task_button img,
.location_button img {
	width: 28px;
	height: 24px;
	border-radius: 0;
}

.flex_main {
  display: flex;
  flex-direction: column;
  width: 1200px;
  margin: 0px 0px 200px 45px;
}

.flex_button button {
  width: 150px;
  height: 40px;
  margin-bottom: 15px;
  cursor: pointer;
  border: 2px;
}

.flex_button button:hover {
  background-color: #E55604;
}

.leave_button {
    position: relative;
    left: 1100px;
  margin-right: 0px;
  color: white;
  text-align: center;
  border: none;
  background-color: #75c2f6;
  width: 70px;
  height: 30px;
  border-radius: 5px;
  cursor: pointer;
}



.profile {
  display: grid;
  grid-template-columns: 170px 20px 1fr;
  margin-top: 100px;
}

.profile img {
  width: 150px;
  height: 150px;
  border-radius: 50%;
}



.introduction_list {
  position: relative;
  bottom:50px;
  padding: 0px;
  list-style: none;
  grid-gap: 20px;
  width: 1200px;
}

.list_name {
  margin-top: 66px;
}

.follow a {
  text-decoration: none;
  color: #000;
}
.follow a:first-child{
  margin-left: 50px;
}
.submit_btn {
    border: none;
    color: white;
    text-align: center;
    background-color: #75c2f6;
    width: 70px;
    height: 30px;
    border-radius: 5px;
    cursor: pointer;

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

#technology_stack{
  margin-top: 120px;
  margin-bottom: 20px;
  border-bottom: 1px solid #E55604;
}
#career_stack{
  margin-top: 20px;
  margin-bottom: 20px;
  border-bottom: 1px solid #E55604;
}
#address_stack {
  margin-top: 20px;
  margin-bottom: 20px;
}
#edit_button1{
            cursor: pointer;
            background: none;
            border: none;
            padding-left: 10px;
            margin: 0;
        }
#edit_button2,#edit_button3,#edit_button4, #edit_button5 {
cursor: pointer;
background: none;
border: none;
padding: 0;
margin: 0;
}


#technology_stack ul
,#career_stack ul
,#address_stack ul{
  list-style: none;
  padding: 0;
  display: flex;
  margin-bottom: 20px;
}

#career_stack ul{
	flex-direction: column;
	
}

#career_stack ul li{
	list-style-type: disc;	
	margin-left: 25px;
}

#technology_stack li 
,#career_stack li
,#address_stack li{
  margin-right: 10px;
}

.task_button{
	width: 24px;
	height: 24px;
}

.common{
	display: flex;
	flex-direction: column;
}
#fix_button{
	margin-top: 13px;
}
#address_stack > img{
	padding-top: 14px;s

}

.info{
	font-weight: bold;
	font-size: larger;
}

.location{
	width:200px;
	margin-top: 10px;
}

.map{
	margin-top: 30px;
}

.stackList{
	background-color: rgba(214, 214, 214, 0.979);
	border-radius: 5px;
	font-weight: bold;
	padding: 5px;
}

#modalContainerIntro {
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

#modalContainerStack {
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

#modalContainerTask {
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


#modalContainerLocation {
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

#modalContentIntro {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 300px;
  padding: 15px;
}

#modalContentStack {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 300px;
  padding: 15px;
}

#modalContentTask {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 300px;
  padding: 15px;
}

#modalContentLocation {
  position: absolute;
  background-color: #ffffff;
  width: 500px;
  height: 300px;
  padding: 15px;
}

#modalContainerIntro.hidden {
  display: none;
}

#modalContainerStack.hidden {
  display: none;
}

#modalContainerTask.hidden {
  display: none;
}

#modalContainerLocation.hidden {
  display: none;
}
</style>

<body>
		<div id="overall">
		<div id="container">
			<div class="flex_button">
				<c:if
				test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
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
			<div class="flex_main">
				<div class="profile">
							<img src="https://cdn.thelec.kr/news/photo/202307/22027_19495_4334.jpg" />
					<div>
						<div>
							<ul class="introduction_list">
								<li class="list_name">
									<h2>kt ds</h2>
								</li>
								<li class="list_intro"><p>kt는 국내 최대 통신사이자 디지털 플랫폼 기업으로 ICT, 금융사업, 위성방송서비스사업, 기타사업 등을 영위하고 있다.<br> 무선통신, 초고속인터넷, IPTV 등 핵심사업에서의 지속적인 성장뿐만 아니라<br> IDC, 클라우드, AI/DX 등 B2B 성장사업에서도 성과를 창출하였다.</p>
									<button class="intro_button"><img class="intro_button_img" src="/images/edit.png" /></button>
									<div id="modalContainerIntro" class="hidden">
										<div id="modalContentIntro">
											<textarea id="introTextArea"></textarea>
											<button id="saveIntro">변경 저장</button>
											<!-- <button onclick="saveIntroChanges()">변경 저장</button> -->											
											<button id="modalCloseIntro">닫기</button>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="show_pwf">
					<p></p>
					<p></p>				
					<p></p>
					<p></p>
				</div>
				<div id="technology_stack">
					<div class="common">
						<ul>
							<li><p class="info">기술스택</p></li>
							
							<p></p>
						</ul>
					</div>
								<ul class="technology_button">
									<li class="stackList">java</li>
									<li class="stackList">Docker</li>
									<li class="stackList">Ubuntu</li>
									<li class="stackList">OpenCV</li>
									<li class="stackList">springboot</li>
								</ul>
								<span></span>
								</li>
								<button class="stack_button"><img src="/images/edit.png" /></button>
								<div id="modalContainerStack" class="hidden">
									<div id="modalContentStack">
										<span class="close" onclick="closeLocationModal()">&times;</span>
										<textarea id="stackTextArea"></textarea>
										<button id="saveStack">변경 저장</button>
										<button id="modalCloseStack">닫기</button>
									</div>
								</div>
				</div>
				<div id="career_stack">
					<div class="common">
						<ul>
							<div class="info">업무 소개</div>
							<div class="taskInfo">이런일 저런일 합니다.</div>
							<button class="task_button"><img src="/images/edit.png" /></button>
								<div id="modalContainerTask" class="hidden">
									<div id="modalContentTask">
										<span class="close" onclick="closeTaskModal()">&times;</span>
										<textarea id="taskTextArea"></textarea>
										<button id="saveTask">변경 저장</button>
										<button id="modalCloseTask">닫기</button>
									</div>
								</div>
							<p></p>
						</ul>
					</div>
					
				</div>
				<div id="address_stack">
					<div class="common">
						<ul>
							
								<p class="info">오시는 길</p>
								<p class="address">서울 서초구 효령로 176</p>
								<button class="location_button"><img src="/images/edit.png" /></button>
								<div id="modalContainerLocation" class="hidden">
									<div id="modalContentLocation">
										<span class="close" onclick="closeLocationModal()">&times;</span>
										<textarea id="locationTextArea"></textarea>
										<button id="saveLocation">변경 저장</button>
										<button id="modalCloseLocation">닫기</button>
									</div>
								</div>
								
							<p></p>
						</ul>
					</div>
					<img class="map" src="/images/오시는길.png"/>
				</div>
			</div>
		</div>
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp" />
	
</body>
</html>