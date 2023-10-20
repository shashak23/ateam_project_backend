<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
  padding: 10px;
}

.logo_wrap {
  display: flex;
  height: 50px;
}
.logo_wrap .logo_img {
  width: 50px;
  text-align: center;
  line-height: 50px;
  font-size: var(--font-big);
}

.logo_wrap .logo_name {
  width: 120px;
  text-align: center;
  line-height: 50px;
  font-size: var(--font-big);
}

.gnb ul {
  display: flex;
}

.gnb ul a {
    margin: 10px;
    padding: 13px 15px;
    border-radius: 10px;
    font-weight: bold;
    font-size: var(--font-big);
    color: var(--deep-blue);
}

.gnb ul a:hover {
  background-color: var(--deep-blue);
  box-shadow: 0 0 5px var(--gray);
  color: white;
}

/* 프로필 영역 */
.my_icon {
  display: flex;
  justify-content: center;
  align-items: center;
}

.my_icon a {
    border: 1px solid;
    margin-left: 10px;
}

.my_icon a:first-child {
  display: flex;
  align-items: center;
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
          <a href="#"><li>자유게시판</li></a>
          <a href="#"><li>질문게시판</li></a>
          <a href="#"><li>기업게시판</li></a>
          <a href="#"><li>팀게시판</li></a>
        </ul>
      </nav>
      <div class="my_icon">
        <a href="#">
          <img src="/images/profile_default.svg" alt="default">
          <span>{이름hh}</span>
        </a>
        <a href="#">
          <span>{알림}</span>
        </a>
        <a href="#">
          <span>{채팅}</span>
        </a>
      </div>
    </section>
  </div>
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

<jsp:include page="../member/membermenu.jsp"></jsp:include>

</body>
</html>