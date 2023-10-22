<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- 작성자: 김태현
     작성일자: 2023-10-20
     내용: 메인 페이지 -->
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<title>Buffer Overflow</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
<!-- <link rel="stylesheet" href="/css/style.css"> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script src="/js/lib/jquery-3.7.1.js"></script>
<style>
:root {
  --light-blue: #75C2F6;
  --blue: #5E69F5;
  --deep-blue: #470FF4;
  --light-gray: #e5e5e5;
  --gray: #ccc;
  --deep-dark: #191919;
  --dark: #333;
  --font-x-big: 16pt;
  --font-big: 14pt;
  --font-medium: 12pt;
  --font-small: 10pt;
  --font-x-small: 9pt;
}

svg {
  fill: var(--blue);
}

*:lang(en) {
  font-family: 'Open Sans', sans-serif;
}
*:lang(ko-KR) {
  font-family: 'Noto Sans KR', sans-serif;
}
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  color: var(--dark);
}

.header_container {
  width: 1140px;
  padding: 0 30px;
  margin: 0 auto;
}

/* 헤더 영역 */
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 0;
}

.logo_wrap {
  display: flex;
  height: 30px;
}

.logo_wrap .logo_img {
  width: 50px;
  text-align: center;
  line-height: 30px;
  font-size: var(--font-big);
}

.logo_wrap .logo_name {
  width: 120px;
  text-align: center;
  line-height: 30px;
  font-size: var(--font-big);
}

/* 메뉴 영역 */
.gnb ul {
  display: flex;
}

.gnb > ul > li > a {
    margin: 0 10px;
    padding: 8px 15px;
    border-radius: 10px;
    font-weight: bold;
    font-size: var(--font-medium);
    color: var(--blue);
}

.gnb ul li a:hover {
  background-color: var(--blue);
  box-shadow: 0 0 5px var(--gray);
  color: white;
}

.gnb ul .list_company {
  position: relative;
}

.company_sublist {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: absolute;
  top: 30px;
  left: 10px;
  z-index: 10;
  height: 90px;
}

.company_sublist li {
  margin-top: 15px;
}

.company_sublist li a {
  color: white;
  padding: 5px 15px;
  border-radius: 10px;
  background-color: var(--blue);
  font-weight: bold;
  text-align: center;
}

/* 회원 프로필 영역 */
.my_icon {
  display: flex;
  justify-content: center;
  align-items: center;
}

.my_icon .user_name {
  margin-left: 6px;
  color: var(--blue);
}

.my_icon a {
    margin-left: 10px;
}

.my_icon a:first-child {
  display: flex;
  align-items: center;
  margin-right: 10px;
}

/* 비회원 프로필 영역 */
.login_btn {
  margin-right: 10px;
}

/* 검색바 영역 */
.search_container {
  width: 100%;
  background-color: var(--light-blue);
}

.search_container .for_search_align {
  padding: 0 30px;
  width: 1140px;
  margin: 0 auto;
}

.searchbox {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 1080px;
  height: 120px;
}

.searchbox .inner {
  display: flex;
  align-items: center;
  position: relative;
  width: 900px;
}

.searchbox .inner input {
  width: 100%;
  height: 46px;
  border: none;
  border-radius: 50px;
  padding: 0 20px;
  font-size: var(--font-small);
  outline: none;
}

.searchbox .inner .btn_search{
  position: absolute;
  right: 20px;
  top: 8px;
  background-color: transparent;
  border: none;
}

.searchbox .inner .btn_search img {
  width: 30px;
  opacity: 0.3;
}

/* 메인 컨텐츠 영역 */
.body_container {
  width: 1140px;
  height: 1000px;
  padding: 30px;
  margin: 0 auto;
}

.body_container .body {
  display: flex;
  justify-content: space-between;
}

/* 오른쪽 */
.body_container .body .body_left {
  border: 1px solid;
  width: 800px;
  margin-right: 30px;
}

.body_left .home_edit_container {
  display: flex;
  padding: 20px;
  cursor: pointer;
  margin-bottom: 20px;
}

.body_left .home_edit_container .text_area {
  position: sticky;
  top: 100px;
  z-index: 10;
  width: 670px;
  height: 80px;
  border: 1px solid var(--gray);
  border-radius: 5px;
  margin-right: 10px;
}

.body_left .home_edit_container .edit_btn {
  width: 80px;
  height: 80px;
  border: 1px solid;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 1px solid var(--gray);
  border-radius: 5px;
  font-size: var(--font-x-big);
}

.body_left .home_edit_container .edit_btn svg {
  fill: var(--dark-gray);
}

.body_container .body .body_right {
  border: 1px solid;
  width: 250px;
}

/* 모달창 css 영역 */
.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: flex;
  justify-content: center;
  align-items: center;
  width: 200px;
  height: 100px;
  background-color: white;
  font-weight: bold;
  font-size: var(--font-x-big);
  box-shadow: 0 0 5px;
  z-index: 999;
  opacity: 0;
  transition: 0.5s;
  visibility: hidden;
}

.modal.modal_active {
  opacity: 1;
  visibility: visible;

}

.signup_modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: flex;
  justify-content: center;
  align-items: center;
  width: 200px;
  height: 100px;
  background-color: white;
  font-weight: bold;
  font-size: var(--font-x-big);
  box-shadow: 0 0 5px;
  z-index: 999;
  opacity: 0;
  transition: 0.5s;
  visibility: hidden;
}

.signup_modal.modal_active {
  opacity: 1;
  visibility: visible;
}

.overlay {
  background-color: var(--dark);
  position: fixed;
  width: 100%;
  height: 100vh;
  top: 0;
  left: 0;
  transition: 0.5s;
  opacity: 0;
  pointer-events: none;
  z-index: 998;
}

.overlay.modal_active {
  opacity: 0.3;
  pointer-events: all;
}

</style>
</head>
<body>
  <div class="header_container">
    <section class="header">
      <div class="logo_wrap">
        <span class="logo_img"><a href="./home">🎃</a></span>
        <div class="logo_name"><a href="./home">Name</a></div>
      </div>
      <nav class="gnb">
        <ul>
          <li><a href="/qnaboard/list">자유게시판</a></li>
          <li><a href="/freeboard/list">질문게시판</a></li>
          <li class="list_company"><a href="#" class="incomplete">기업게시판</a>
            <ul class="company_sublist visible">
              <li><a href="#" class="incomplete">채용게시판</a></li>
              <li><a href="#" class="incomplete">알고리즘</a></li>
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
            <a href="#">
              <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg>
              <span class="user_name incomplete"><strong>${sessionScope._LOGIN_USER_.nickname}</strong></span>
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

  <!-- 메인 컨텐츠 영역 -->
  <section class="body_container">
    <div class="body">
      <div class="body_left">
        <div class="home_edit_container">
          <div class="text_area"></div>
          <div class="edit_btn">
            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><path d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"/></svg>
          </div>
        </div>
      </div>
      <div class="body_right">
        오른쪽
      </div>
    </div>
  </section>

  <!-- 모달창 영역입니다. -->
<div class="modal">
  준비중입니다.
</div>
<div class="signup_modal">
  <div>
    기업으로 가입
  </div>
  <div>
    개인으로 가입
  </div>
</div>
<div class="overlay"></div>
</body>
<script>
  // 미완성된 모달창
  $('.incomplete').click(function() {
    $('.modal, .overlay').addClass('modal_active')
  })
  $('.overlay').click(function() {
    $('.modal, .overlay').removeClass('modal_active')
  })

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
</html>