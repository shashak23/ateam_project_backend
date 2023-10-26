<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <!DOCTYPE html>
    <html lang="ko">
      <head>
        <meta charset="utf-8" />
        
        
        <title>SnapChat</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
          name="viewport"
          id="viewport"
          content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width"
        />
            <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
            <link rel="stylesheet" type="text/css" href="/css/swiper.min.css">
        <link rel="stylesheet" type="text/css" href="/css/style.css" />
      </head>
      <body>
        <div id="wrap" class="wrap">
    
    
          <!-- 상단영역 -->
          <header id="header" class="header">
    
                    <!-- 로그인/회원가입 -->
                    <div class="util">
<%--                         <jsp:include page="../member/membermenu.jsp"></jsp:include>
 --%>                    
                        <ul>
                            <li><a href="#">로그인</a></li>
                            <li><a href="#">회원가입</a></li>
                        </ul>					
                    </div>
    
                    <div class="inner">
                        <!-- 로고 -->
                        <hgroup>
                            <h1><a href="index.html">SnapChat</a></h1>
                        </hgroup>
        
                        <!-- Navigation -->
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
    
          <!-- 본문 -->
          <section id="container" class="container">
            <!-- 왼쪽 컨텐츠 -->
            <aside class="side sideLeft">
              <div class="baner_01">
                            넣고싶은 컨텐츠를 넣어주세용
                        </div>
            </aside> 
    
                    <!-- 내용 -->
                    <main class="contents">
                        <div class="board">
                            <p class="bbs_title">게시글 목록</p>
                            
                            <!-- 게시물검색 -->
                            <div class="list_search">
                                <select class="selelct">
                                    <option value="">제목</option>
                                    <option value="">작성자</option>
                                </select>
                                <input type="text" class="sc_text" placeholder="검색어 입력">
                                <div class="btn btn_st_2">
                                    <a href="#">조회</a>
                                </div>
                                <div class="btn btn_st_2">
                                    <a href="/recruit/create">등록</a>
                                </div>
                            </div>
    
                            <!-- 게시판 리스트 -->
                            <form action="">
                                <fieldset>
                                    <legend>Legend</legend>
    
                                    <!-- 리스트 -->
                                    <div class="board_list_ty1">
                                            <table summary="">
                                                    <caption></caption>
                                                    <colgroup>
                                                            <col width="10%">
                                                            <col width="*">
                                                            <col width="10%">
                                                            <col width="15%">
                                                            <col width="10%">
                                                    </colgroup>
                                                    <thead>
                                                            <tr>
                                                                    <th scope="col">번호</th>
                                                                    <th scope="col">제목</th>
                                                                    <th scope="col">등록자</th>
                                                                    <th scope="col">등록일</th>
                                                                    <th scope="col">조회수</th>
                                                            </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${companyRecruitListVO.companyRecruitList}" var="companyRecruit">
                                                            <tr>
                                                                <td>${companyRecruit.companyRecruitPostId}</td>
                                                                <td>
                                                                    <a href="/recruit/view/${companyRecruit.companyRecruitPostId}">
                                                                        ${companyRecruit.postTitle}
                                                                    </a>
                                                                </td>
                                                                <td>${companyRecruit.postWriter}</td>
                                                                <td>${companyRecruit.postDate}</td>
                                                                <td>${companyRecruit.viewCnt}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                            </table>
                                    </div>
    
                                    <!-- button -->
                                    <div class="btn_set btn_right">
                                            <div class="btn btn_st_1">
                                                    <a href="/freeboard/create">글쓰기</a>
                                            </div>
                                    </div>
    
                                    <!-- paginate -여러 페이지로 나눔-->
                                    <div class="paginate">
                                            <a href="#" class="pre page"><img src="./images/common/btn_page_prev.gif" alt="처음페이지"></a>
                                            <a href="#" class="pre"><img src="./images/common/btn_prev.gif" alt="이전"></a>
                                            <a href="#"><span>1</span></a>
                                            <a href="#"><span>2</span></a>
                                            <a href="#"><span>3</span></a>
                                            <strong><span>4</span></strong>
                                            <a href="#"><span>5</span></a>
                                            <a href="#"><span>6</span></a>
                                            <a href="#"><span>7</span></a>
                                            <a href="#" class="next"><img src="./images/common/btn_next.gif" alt="다음"></a>
                                            <a href="#" class="next page"><img src="./images/common/btn_page_next.gif" alt="마지막페이지"></a><!--이속성을 선택하면 이 사진으로 이동-->
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </main>
                    
                    <!-- 오른쪽 컨텐츠 -->
            <aside class="side sideRight">
                        <div class="baner_03">
                            컨텐츠를 여기로 넣어주세요 !!!!
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
                
                <span>사업자등록번호 : 313-34432</span>
              </address>
              <div class="copyright">
                &copy; 2023 by SNAPCHAT. All rights reserved
              </div>
            </div>
          </footer>
        </div>
      </body>
</html>