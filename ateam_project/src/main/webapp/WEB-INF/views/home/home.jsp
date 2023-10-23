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
  --hashtag-blue: #d6e9f5;
  --light-gray: #e5e5e5;
  --gray: #ccc;
  --dark-gray: #888;
  --white: #fff;
  --deep-dark: #191919;
  --dark: #333;
  --red: #ff4444;
  --font-x-big: 16pt;
  --font-big: 14pt;
  --font-medium: 12pt;
  --font-small: 10pt;
  --font-x-small: 9pt;
}

html {
  scroll-behavior: smooth;
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

/* 왼쪽 */
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

/* 글쓰기 영역 */
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

/* 게시글 영역 */
.body_left .content_container {
  width: 100%;
  height: 250px;
  border: 1px solid var(--light-gray);
  margin: 45px 0;
  border-radius: 10px;
  padding: 24px 36px;
}

.body_left .content_container .writer_info_area {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 10px;
  border-bottom: 1px solid var(--gray);
}

.body_left .content_container .writer_info_area .flex_left {
  display: flex;
  align-items: center;
}

.body_left .content_container .writer_info_area .flex_left img {
  width: 36px;
  height: 36px;
  background-color: var(--light-gray);
  margin-right: 10px;
  border-radius: 50%;
}

.body_left .content_container .writer_info_area .flex_left .writer_name {
  font-size: var(--font-medium);
}

.body_left .content_container .writer_info_area .flex_left .writer_name .follow_btn {
  border: 1px solid var(--light-gray);
  border-radius: 10px;
  margin-left: 20px;
  padding: 0 3px;
  font-size: var(--font-x-small);
  color: var(--blue);
  cursor: pointer;
}

.body_left .content_container .writer_info_area .flex_left .posting_date {
  font-size: var(--font-small);
  color: #ccc;
}

.body_left .content_container .writer_info_area .flex_right .utility {
  display: flex;
  align-items: center;
}

.body_left .content_container .writer_info_area .flex_right .utility > button {
  width: 24px;
  height: 24px;
  background-color: transparent;
  border: none;
  margin-right: 10px;
}

.body_left .content_container .writer_info_area .flex_right .utility > button > svg {
  width: 20px;
  height: 20px;
  cursor: pointer;
}

.body_left .content_container .writer_info_area .flex_right .utility > svg {
  width: 24px;
  height: 24px;
  padding: 2px;
  fill: var(--dark);
  border: 1px solid var(--gray);
  border-radius: 50%;
  cursor: pointer;
}

.body_left .content_container .q_title {
  display: flex;
  align-items: flex-end;
  margin: 7px 0;
}

.body_left .content_container .q_title > .big_letter {
  font-size: var(--font-x-big);
  font-weight: bold;
  margin-right: 8px;
  color: var(--deep-blue);
}

.body_left .content_container .q_title > div {
  display: flex;
  align-items: center;
}

.body_left .content_container .q_title > div .title {
  font-size: var(--big);
  margin-right: 10px;
  color: var(--deep-darkdark);
}

.body_left .content_container .q_title > div .comment_number {
  font-size: var(--font-medium);
  margin-right: 10px;
  color: var(--red);
}

.body_left .content_container .q_title > div svg {
  font-size: var(--font-medium);
  fill: var(--blue);
}

.body_left .content_container .q_title  .thumbs_up_number {
  font-size: var(--font-medium);
  margin-left: 7px;
}

.body_left .content_container .q_content {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.body_left .content_container .q_content p {
  margin-bottom: 20px;
  font-size: var(--font-small);
  color: var(--dark);
  display: -webkit-box;
  -webkit-box-orient: vertical;
  overflow: hidden;
  -webkit-line-clamp: 3;
}

.body_left .content_container .q_content ul {
  display: flex;
}

.body_left .content_container .q_content li {
  padding: 3px 10px;
  margin-right: 20px;
  border-radius: 50px;
  background-color: var(--hashtag-blue);
  color: var(--blue);
  font-size: var(--font-x-small);
}


/* 오른쪽 */
.body_container .body .body_right {
  border: 1px solid;
  width: 250px;
}

/* 푸터 영역 */
.footer {
  background-color: var(--light-blue);
  color: var(--white);
}

.footer .inner {
  width: 1080px;
  margin: 0 auto;
  padding: 40px 0;
}

.footer .inner address {
  text-align: center;
  font-size: var(--font-small);
  padding: 0 0 30px 0;
}

.footer .inner address span {
  color: var(--dark);
}

.footer .inner .copyright {
  text-align: center;
  color: var(--dark);
  font-size: var(--font-x-small);
  border-top: 1px solid var(--blue);
  padding: 30px 0 0 0;
}

/* 스크롤 버튼, IDE 영역 */
#progress {
  position: fixed;
  bottom: 20px;
  right: 20px;
  height: 40px;
  width: 40px;
  display: inline-block;
  place-items: center;
  border-radius: 50%;
  box-shadow: 0 0 10px;
  cursor: pointer;
}

#progress_value {
  display: block;
  height: 100%;
  width: 100%;
  background-color: #fff;
  border-radius: 50%;
  display: grid;
  place-items: center;
  font-size: var(--font-medium);
  color: #001a2e;
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
  cursor: default;
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
            <a href="#" class="incomplete">
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
        <div class="home_edit_container incomplete">
          <div class="text_area"></div>
          <div class="edit_btn">
            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><path d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"/></svg>
          </div>
        </div>
        <article class="content_container">
          <div class="writer_info_area">
            <div class="flex_left">
              <img class="incomplete" src="/images/꼬부기.png" alt="꼬부기" />
              <div>
                <div class="writer_name incomplete">꼬부기<span class="follow_btn">FOLLOW</span></div>
                <div class="posting_date">2023-10-03</div>
              </div>
            </div>
            <div class="flex_right">
              <div class="utility">
                <button><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#dedede}</style><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg></button>
                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 128 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M64 360a56 56 0 1 0 0 112 56 56 0 1 0 0-112zm0-160a56 56 0 1 0 0 112 56 56 0 1 0 0-112zM120 96A56 56 0 1 0 8 96a56 56 0 1 0 112 0z"/></svg>
              </div>
            </div>
          </div>
          <div class="q_title">
            <span class="big_letter">Q</span>
            <div>
              <span class="title">제목라인</span>
              <span class="comment_number">[?]</span>
              <span><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.1s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"/></svg></span>
              <span class="thumbs_up_number">[따봉개수]</span>
            </div>
          </div>
          <div class="q_content">
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, omnis voluptatem impedit error asperiores totam repellat! Harum fugiat, quam vero magni earum sapiente vitae repellat similique, veritatis dolor ipsum. Ratione!
            Laudantium, beatae, reprehenderit quasi cupiditate, blanditiis illo suscipit enim eum repellat ex facilis id natus doloribus vel. Nam debitis ratione, quos officiis voluptates similique sunt dolor, reprehenderit perspiciatis et hic?
            Incidunt, dolores eveniet sapiente quaerat aliquid autem vitae nobis aliquam, blanditiis delectus, recusandae nostrum! Voluptatum architecto suscipit, blanditiis error soluta aut aperiam, cupiditate maiores veritatis quod iste natus incidunt minus.
            Debitis blanditiis quaerat a quae dicta fugit, quas cumque temporibus earum, ipsa necessitatibus esse totam, corrupti magni atque voluptates. Ipsum iusto est, id exercitationem distinctio voluptatem illo quos mollitia aliquid.
            Voluptatibus incidunt neque laudantium nemo saepe non praesentium repellendus numquam vel. Natus quod nesciunt nobis delectus consectetur unde est labore! Tenetur veritatis culpa in dicta sunt quo deserunt minima. Illum.</p>
            <ul>
              <li>hashtag</li>
              <li>hashtag</li>
              <li>hashtag</li>
              <li>hashtag</li>
              <li>hashtag</li>
            </ul>
          </div>
        </article>
      </div>
      <div class="body_right">
        오른쪽
      </div>
    </div>
  </section>

  <!-- 푸터 영역 -->
  <footer class="footer">
    <div class="inner">
      <address>
        <span>상호명: ?</span>
        <span>개인정보책임관리자 : 홍길동</span>
        <span>주소 : kt ds</span>
        <span>ssss</span>
      </address>
      <div class="copyright">
        &copy; 2023 by ???. All rights reserved
      </div>
    </div>
  </footer>

  <!-- 스크롤 버튼, IDE 영역 -->
  <div id="progress">
    <span id="progress_value">&#x1F815;</span>
  </div>

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
  // 미완성된 기능 모달창
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

  // 스크롤 버튼, IDE
  let calcScrollValue = () => {
  let scrollProgress = document.getElementById('progress')
  let progressValue = document.getElementById('progress-value')
  let pos = document.documentElement.scrollTop
  let calcHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight
  let scrollValue = Math.round((pos * 100) / calcHeight)

  if (pos > 100) {
    scrollProgress.style.display = 'grid'
  }
  else {
    scrollProgress.style.display = 'none'
  }
  scrollProgress.addEventListener('click', () => {
    document.documentElement.scrollTop = 0
  })
  }

  window.onscroll = calcScrollValue;
  window.onload = calcScrollValue;
</script>
</html>