<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업소식 페이지</title>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
$().ready(function() {
	$("#search-btn").click(function() {
		$("#search-form").attr({
			"method": "get",
			"action": "/news/list"
		}).submit()
	});
})
</script>
<!--브라우저에게 현재 페이지를 가장 최신 버전으로 렌더링-->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--뷰포트는 화면에 표시되는 웹영역 표시, 모바일 등에서 상호작용 할 수있는지 제어-->
<meta
  name="viewport"
  id="viewport"
  content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width"
/><!--스타일,폰트 지정-->
<!--스와이퍼 기능 지정-->
<!--스타일 입히기-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="/css/companyNews.css" />
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
                     
                          <h1><a href="index.html">SnapChat</a></h1>
                      
      
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
                          <a href="#">
                              <span class="material-symbols-outlined">account_circle</span>
                          </a>
                          <a href="#">
                              <span class="material-symbols-outlined">mail</span>
                          </a>
                          <a href="#">
                              <span class="material-symbols-outlined">notifications</span>
                          </a>
                      </div>
                  </div>
        </header>
  
        <!-- 검색박스 -->
        <div class="searchbox">
                  <div class="inner">
                      <input type="text" placeholder="검색어를 입력해주세요.">
                      <button type="submit" class="btn_search">
                          <span class="material-symbols-outlined">
                          search
                          </span>
                      </button>
                  </div>
              </div>
              <section id="container" class="container">
                  <!-- 왼쪽 컨텐츠 -->
                  <!--aside>는 HTML5에서 도입된 태그로, 웹 페이지의 주요 내용과는 별도로 나란히 배치되는 측면(사이드) 콘텐츠를 정의하며 주로 광고,사이드바 같은 부과 태그..-->
                  <aside class="side sideLeft">
                    <div class="baner_01">
                                  자유롭게 컨텐츠를 넣기 !
                              </div>
          
                              <div class="baner_02">
                                  자유롭게 컨텐츠를 넣기 !
                              </div>
                  </aside> 
                <div class="news_container">
				<div class="search_area">
				    <form id="search-form"
				          method="get"
				          action="/news/list">
					<select name="searchType">
				        <option value="postTitle" ${searchCompanyNewsVO.searchType eq 'postTitle' ? 'selected' : ''}>제목</option>
				        <option value="postContent" ${searchCompanyNewsVO.searchType eq 'postContent' ? 'selected' : ''}>내용</option>
				        <option value="postWriter" ${searchCompanyNewsVO.searchType eq 'postWriter' ? 'selected' : ''}>작성자</option>
				    </select>
				    <input type="text" name="searchKeyword" value="${searchCompanyNewsVO.searchKeyword}" />
						<button id="search-btn">검색</button>
					</form>
				</div>	
                      <c:choose>
                          <c:when test="${not empty companyNewsList.companyNewsList}">
                              <c:forEach items="${companyNewsList.companyNewsList}" var="companynews">
                        			<div class="contents">
                                        <div class="company_name">${companynews.memberVO.nickname}(${companynews.postWriter})</div>
                                        <div class="news_title">
                                            <a href="/news/view/${companynews.companyNewsPostId}">
                                                <c:out value="${companynews.postTitle}" />
                                            </a>
                                        </div>
                                        <img src="/news/file/download/${companynews.companyNewsPostId}" />
                                        <div class="view">${companynews.viewCnt}조회수</div>
                                        <div class="like">${companynews.likeCnt}좋아요 수</div>
                                    </div>
                              </c:forEach>
                          </c:when>
                      </c:choose>
                  </div>
                  <!-- 로그인 하지 않았을 때 -->
			      <c:if test="${empty sessionScope._LOGIN_USER_}">
			          <a href="/member/auth">로그인하기</a>
			      </c:if>
                  <!-- 기업회원 로그인 시에만 보이는 버튼 -->
                  <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'COMPANY'}">
                      <div class="right-align" style="text-align: right; font-weight: bold">
                          <a href="/news/create">게시글 등록</a>
                      </div>
                  </c:if>
                  <aside class="side sideRight">
                      <div class="baner_03">
                          오른쪽 컨텐츠 1
                      </div>
  
                      <div class="baner_04">
                          오른쪽 컨텐츠 2
                      </div>
          </aside>
  
        </section>
        <!-- 페이지 푸터 -->
        <footer id="footer" class="footer">
        <div class="inner">
            <address>
            <span>상호명 : SNAPCHAT </span>
            <span>개인정보책임관리자 : 홍길동 </span> 
            <span>주소 : kt ds </span>
            
            <span>ssss</span>
            </address>
            <div class="copyright">
            &copy; 2023 by SNAPCHAT. All rights reserved
            </div>
        </div>
        </footer>
    </div>  
</body>
</html>