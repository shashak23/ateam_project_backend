<!-- 작성자: 김태현
	 작성일: 23-10-23
	 내용: 공통 헤더에 들어갈 요소를 모아놓은 파일 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<title>devGround</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
	<!-- <link rel="stylesheet" href="/css/style.css"> -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<script src="/js/lib/jquery-3.7.1.js"></script>
  <script src="/js/Modal.js"></script>
	<c:if test="${not empty sessionScope._LOGIN_USER_}">
      <script type="text/javascript" src="/js/lib/sockjs.min.js"></script>
      <script type="text/javascript" src="/js/socket.js"></script>
	</c:if>
	<script type="text/javascript">
    <c:if test="${not empty sessionScope._LOGIN_USER_}">
        var userName = "${sessionScope._LOGIN_USER_.nickname}";
        var email = "${sessionScope._LOGIN_USER_.email}";
    </c:if>
    var send = undefined;
	
    $().ready(function() {
        <c:if test="${not empty sessionScope._LOGIN_USER_}">
            send = connectSocket(userName, email, function(send, receiveMessage) {
                if (receiveMessage.sendType == "invite") {
                    if (confirm(receiveMessage.message)) {
                        // 대화에 참여하는 코드 생성
                        // 다른 URL로 이동하면 안됨.
                        // 대화목록, 창 모달
                        enterRoom(send, userName, email, receiveMessage.roomName);
                    }
                }
                // 상대방이 입장했을 때
                else if (receiveMessage.sendType == "enter" || receiveMessage.sendType == "all") {
                    console.log(receiveMessage.message);
                    var chatBox = chatModal.find(".chat-box");
                    var message = "<div>" + receiveMessage.message + "</div>";
                    message = message.replaceAll("↵", "<br/>").replaceAll("\n", "<br/>");
                    var isMe = receiveMessage.sendToMe == true;
                    if (!isMe) {
                        message = '<div style="width:50px; margin-right: 3px;">' + receiveMessage.userName + '</div>'+message ;
                    }else{
                    	message = '<div style="text-align:right; margin-right: 3px;">' + receiveMessage.userName + message+'</div>' ;
                    }
                    chatBox.append('<div class=' + isMe + '>' + message + '</div>');
                    chatBox.scrollTop(99999999999999999999999);
                }
                // 상대방이 방을 나갔을 때
                // URL이 바뀌면 상대방이 방을 나간 뒤 다시 연결된다.
                else if (receiveMessage.sendType == "leave") {
                    console.log(receiveMessage.message);
                }
            });
        </c:if>
    });
</script>
	<link rel="stylesheet" href="/css/style.css">
</head>
<body>
  <div class="header_container">
    <section class="header">
      <div class="logo_wrap">
        <span class="logo_img"><a href="/devground/home">🎃</a></span>
        <div class="logo_name"><a href="/devground/home">devGround</a></div>
      </div>
      <nav class="gnb">
        <ul>
          <li><a href="/qnaboard/list" target="_blank">질답게시판</a></li>
          <li><a href="/freeboard/list" target="_blank">자유게시판</a></li>
          <li class="list_company"><a href="#" class="incomplete">기업게시판</a>
            <ul class="company_sublist visible">
              <li><a href="#" class="incomplete">채용게시판</a></li>
              <li><a href="/algorithm/question/list">문제게시판</a></li>
              <li><a href="/algorithm/explanation/list">해설게시판</a></li>
            </ul>
          </li>
          <li><a href="#" class="incomplete">팀게시판</a></li>
        </ul>
      </nav>
      <c:choose>
        <c:when test="${empty sessionScope._LOGIN_USER_}">
          <div>
            <span class="login_btn"><a href="/member/auth">로그인</a></span>
            <span class="regist_btn"><a href="/member/signup">회원가입</a></span>
          </div>
        </c:when>
        <c:otherwise>
          <div class="my_icon">
            <a href="/memberinfo/view/${sessionScope._LOGIN_USER_.email}">
              <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg>
              <span class="user_name"><strong>${sessionScope._LOGIN_USER_.nickname}</strong></span>
            </a>
            <a href="#">
              <span class="incomplete"><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224 0c-17.7 0-32 14.3-32 32V49.9C119.5 61.4 64 124.2 64 200v33.4c0 45.4-15.5 89.5-43.8 124.9L5.3 377c-5.8 7.2-6.9 17.1-2.9 25.4S14.8 416 24 416H424c9.2 0 17.6-5.3 21.6-13.6s2.9-18.2-2.9-25.4l-14.9-18.6C399.5 322.9 384 278.8 384 233.4V200c0-75.8-55.5-138.6-128-150.1V32c0-17.7-14.3-32-32-32zm0 96h8c57.4 0 104 46.6 104 104v33.4c0 47.9 13.9 94.6 39.7 134.6H72.3C98.1 328 112 281.3 112 233.4V200c0-57.4 46.6-104 104-104h8zm64 352H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7s18.7-28.3 18.7-45.3z"/></svg></span>
            </a>
            <a href="#">
              <span class="incomplete"><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M123.6 391.3c12.9-9.4 29.6-11.8 44.6-6.4c26.5 9.6 56.2 15.1 87.8 15.1c124.7 0 208-80.5 208-160s-83.3-160-208-160S48 160.5 48 240c0 32 12.4 62.8 35.7 89.2c8.6 9.7 12.8 22.5 11.8 35.5c-1.4 18.1-5.7 34.7-11.3 49.4c17-7.9 31.1-16.7 39.4-22.7zM21.2 431.9c1.8-2.7 3.5-5.4 5.1-8.1c10-16.6 19.5-38.4 21.4-62.9C17.7 326.8 0 285.1 0 240C0 125.1 114.6 32 256 32s256 93.1 256 208s-114.6 208-256 208c-37.1 0-72.3-6.4-104.1-17.9c-11.9 8.7-31.3 20.6-54.3 30.6c-15.1 6.6-32.3 12.6-50.1 16.1c-.8 .2-1.6 .3-2.4 .5c-4.4 .8-8.7 1.5-13.2 1.9c-.2 0-.5 .1-.7 .1c-5.1 .5-10.2 .8-15.3 .8c-6.5 0-12.3-3.9-14.8-9.9c-2.5-6-1.1-12.8 3.4-17.4c4.1-4.2 7.8-8.7 11.3-13.5c1.7-2.3 3.3-4.6 4.8-6.9c.1-.2 .2-.3 .3-.5z"/></svg></span>
            </a>
            <a href="/member/logout">
              <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M502.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L402.7 224 192 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l210.7 0-73.4 73.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l128-128zM160 96c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 32C43 32 0 75 0 128L0 384c0 53 43 96 96 96l64 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l64 0z"/></svg>
            </a>
          </div>
        </c:otherwise>
      </c:choose>
    </section>
  </div>

  <!-- 검색 영역 -->
  <section class="search_container">
    <div class="for_search_align">
      <div class="searchbox">
        <div class="inner">
          <input type="text" placeholder="검색어를 입력해주세요.">
          <button type="submit" class="btn_search">
            <img src="/images/search.svg" alt="search">
          </button>
        </div>
      </div>
    </div>
  </section>
