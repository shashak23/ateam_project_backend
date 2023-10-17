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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="./myProfile.css" />
<link rel="stylesheet" type="text/css" href="/css/myProfile.css" />
</head>

<body>
	<!--아이디와 클래스 값을 부여함-->
	<div id="wrap" class="wrap">


		<header id="header" class="header">

			<!-- 로그인/회원가입 -->
			<!-- <li><a href="#">로그인</a></li> 링크를 통해 # 사용자가 지정 할수있고 버튼을 누르면 그곳으로 이동해 달라는 태그 -->

			<div class="util">
				<ul>
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>

			<div class="inner">
				<!-- 로고 -->

				<h1>
					<a href="index.html">SnapChat</a>
				</h1>


				<!-- Navigation -->
				<!--누르면 링크로 이동하는 버튼 네비게이션을 통하여 그 창으로 이동힌다-->
				<nav class="gnb">
					<ul>
						<li><a href="index.html">자유게시판</a></li>
						<li><a href="qa.html">Q&A</a></li>
						<li><a href="#">채용</a></li>
						<li><a href="#">코딩테스트</a></li>
					</ul>
				</nav>

				<!-- 아이콘 -->
				<div class="setting">
					<a href="#"> <span class="material-symbols-outlined">account_circle</span>
					</a> <a href="#"> <span class="material-symbols-outlined">mail</span>
					</a> <a href="#"> <span class="material-symbols-outlined">notifications</span>
					</a>
				</div>
			</div>
		</header>
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!--           메인 -------------------------------------------------------------------------------- -->
		<div id="container">
			<div class="flex_button">
				<button>마이페이지</button>
				<button>스크랩</button>
				<button>정보 수정</button>
				<button>내가 푼 문제</button>
				<button>마이 팀</button>
			</div>
			<div class="flex_main">
				<div class="follow_chat">
					<button class="follow_icon">
						<img src="https://cdn-icons-png.flaticon.com/512/907/907873.png">
						팔로우
					</button>
					<button class="message_icon">✉ 메시지</button>
				</div>
				<div class="profile">
					<img
						src="https://thumb.mt.co.kr/06/2023/07/2023073016215867372_2.jpg/dims/optimize/">
					<div>
						<ul class="introduction_list">
							<li class="list_name">
								<h2>${memberVO.nickname}</h2>
							</li>
							<c:choose>
								<c:when test="${not empty generalMemberList}">
									<li class="list_intro">${generalMemberList[0].selfIntro}
									<button>수정</button>
									</li>
								</c:when>
								<c:otherwise>
									<li class="list_intro"><button>추가하기</button></li>
								</c:otherwise>

							</c:choose>
						</ul>
					</div>
				</div>
				<div class="follow">
					<a href="#">팔로워</a> <a href="#">팔로잉</a>
					<p></p>
				</div>
				<div class="related_link">
					<a href="${generalMemberVO.githubUrl}"><img
						src="https://cdn-icons-png.flaticon.com/512/25/25231.png"
						alt="Icon 1"></a> <a href="${generalMemberVO.additionalEmail}"><img
						src="https://w7.pngwing.com/pngs/863/247/png-transparent-email-computer-icons-email-miscellaneous-angle-text.png"
						alt="Icon 2"> </a> <a href="${generalMemberVO.blogUrl}"><img
						src="https://i.pinimg.com/originals/f8/0b/dd/f80bdd79a51358da6ee41a0fda520394.png"
						alt="Icon 3"> </a>
					<button id="edit_button1">
						<img
							src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png">
					</button>
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
					<p>
						기술스택
						<button id="edit_button2">
							<img
								src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png">
						</button>
					</p>
					<ul>
						<li><button></button></li>
					</ul>
				</div>
				<div class="education">
					<p>
						학력
						<button id="edit_button3">
							<img
								src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png">
						</button>
					</p>
					<ul>
						<li>Massachusetts Institute of Technology Institute for Data,
							Systems</li>
						<li>서울대학교 컴퓨터공학과 석사</li>
					</ul>
				</div>
				<div class="career">
					<p>경력</p>
					<button id="edit_button4">
						<img
							src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png">
					</button>
					<ul>
						<c:choose>
							<c:when test="${not empty careerList}">
								<c:forEach items="${careerList}" var="career">
									<li>${career.previousCompanyName}-${career.jobTitle }
									<li class="career_list_year">${career.hireDate}~
										${career.resignDate}</li>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li><button>추가하기</button></li>
							</c:otherwise>

						</c:choose>
					</ul>
				</div>
				<div class="education">
					<p>
						주소
						<button id="edit_button5">
							<img
								src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png">
						</button>
					</p>

					<ul>
						<c:choose>
							<c:when test="${not empty generalMemberList}">
								<li>${generalMemberList[0].region}</li>
							</c:when>
							<c:otherwise>
								<li><button>추가하기</button></li>
							</c:otherwise>

						</c:choose>
					</ul>
				</div>
			</div>
		</div>
		</form>


		<!-- 페이지 푸터 -->
		<footer id="footer" class="footer">
			<div class="inner">
				<address>
					<span>상호명 : SNAPCHAT </span> <span>개인정보책임관리자 : 홍길동 </span> <span>주소
						: kt ds </span> <span>ssss</span>
				</address>
				<div class="copyright">&copy; 2023 by SNAPCHAT. All rights
					reserved</div>
			</div>
		</footer>
	</div>
</body>
</html>