<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>devGround</title>
<script src="/js/lib/jquery-3.7.1.js"></script> 
<script src="./js/swiper.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<jsp:include page="../layout/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<style>

	/*swiper제어*/
   .swiper-slide img {
       position: relative;
	   max-width: 100%;
	   height: auto;
	   overflow: hidden;
   }

   .swiper-button-prev,
   .swiper-button-next {
       margin-top: -100px;
   }
	/* 본문 */
   .wrap {
	   display: flex;
	   justify-content: center;
	   margin: 0 auto;
	   
   }

   .container {
       display: inline-block;
       width: 1080px;
       margin: 0 auto;     
   }
   
   .board_list_box {
       margin: 0 auto;
       margin-top: 90px;
       border-top: none;
       border-bottom:none;
       border-left: none;
       border-right: none;
   }

   #button_list_1 tr th {
       background-color: var(--light-gray);
       border-bottom: 1px solid var(--dark-gray);
       color: var(--dark-gray);       
   }    
   .table-header_01 {                        
       width: 50px;
       height: 35px;
    }
    .pratice_01,.pratice_02,.pratice_03,.pratice_04 {
       border-bottom: 1px solid var(--gray);
       text-align: center;
       color: var(--dark-gray);
    }
    .pratice {
       margin-top: 42px;
       border-bottom: 1px solid var(--gray);
    }
    .text_controller {
       position: relative;
       bottom: 20px;
    }
    
    /* 오른쪽 */   
    .advertising{
       margin-top: 90px;
   	   margin-left: 30px;
    }
    
    .viedo_ver{
       margin-top: 40px;
   	   margin-left: 30px;
    }
   
    .why_code {
       width: 250px;
       height: 200px;
    }
    
   /* 왼쪽 글작성 */
   #left_container{
      display: flex;
      justify-content: center;
      width:300px;
      min-height: 500px;
      margin-top: 8px;
   }

   #toolbar{
      width: 300px;
      /* margin: 0px 0px 0px 0px; */
      width: 200px;
      padding: 15px;
      align-items: center;
      margin-top: 60px;
   }

   #toolbar > #registerArticle > .register{
      width: 220px;
      height:35px;
      margin-top: 9px;
      color:white;
      background-color: #26577C;
      border-radius: 6px;
      border:none;
      transition: box-shadow 0.1s ease;
   }

   #toolbar > #registerArticle > .register:hover{
      border: 2px solid #1E90FF;
   }
   #pageName {
    	font-size: 30px;
    	font-weight: bold;
   }
   .search_menu {
    	position: relative;
    	top: 22px;
   }
   
   .button_box {
       position: relative;
       left: 95px;
       /* margin: 0 auto; */
       margin-top: 5px;
       color:#26577C;
       
   }
   
   .btn_st_2 {
       position: relative;
       left: 65px;
       margin-right: 30px;          
       background-color: #26577C;
       color: white;
       border-radius: 5px;
       border: none;
       width: 60px; 
       height: 30px;
   }
   
   .input_box {
    	position: relative;
    	right: 100px;
   }
   .sc_text {
       position: relative;
       left: 70px;
       margin: 0 auto;
       width: 150px;
   }

</style>
</head>
<body>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="https://asset.programmers.co.kr/image/origin/production/competition/167560/e8ef54c9-7dd9-460c-a1fb-5f4845a64e0f.jpg" alt="데브 게시판 표시">
            </div>
            <div class="swiper-slide">
                <img src="https://asset.programmers.co.kr/image/origin/production/competition/166055/a73b3c4b-1be8-4c34-b5ff-7fd691bf529b.png" alt="데브 게시판 표시">
            </div>
            <div class="swiper-slide">
                <img src="https://asset.programmers.co.kr/image/origin/production/competition/168189/e31a3bf1-8c84-4169-81af-c74a9aa1880e.jpg" alt="데브 게시판 표시">
            </div>
          </div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
    </div>
	<div class="body_container">
    <div id="wrap" class="wrap">
        <!-- 좌측 툴바 -->
        <div id="left_container">
            <div id="toolbar">
                <div id="pageName"></div>
                <div id="registerArticle">
                    <button class="register" type="button" onclick="location.href='/freeboard/create';">글작성</button>
                </div>
                <div class="search_area">
                   
                    <form id="search-form" method="get" action="/freeboard/list">
                      <div class="button_list">
                        <select class="search_menu" name="searchType">
                            <option value="postTitle" ${searchForumVO.searchType eq 'postTitle' ? 'selected' : ''}>제목</option>
                            <option value="postContent" ${searchForumVO.searchType eq 'postContent' ? 'selected' : ''}>내용</option>
                            <option value="postWriter" ${searchForumVO.searchType eq 'postWriter' ? 'selected' : ''}>작성자</option>
                        </select>
                        <input type="text" class="sc_text" placeholder="검색어 입력" name="searchKeyword" value="${searchForumVO.searchKeyword}" />
                            <div class="button_box">
		                        <button type="submit" class="btn_st_2">
		                            검색
		                        </button>       
                            </div>                         
                      </div>               
                   </form>               
                </div>            
             </div>
        </div>
        </div> 
        <!-- 본문 -->
        <div class="body">
        <section id="container" class="container">
            <main class="contents">         
                    <!-- 게시판 리스트 -->
                    <form>
                        <fieldset class="board_list_box">   
                            <div class="">
                                <table>                                  
                                    <colgroup>
                                        <!-- 하나이상의 열을 그룹화 하며 col을 사용하여 표의 열에 대해서 정의합니다. -->
                                        <col width="10%"> <!-- 열의 넓이를 정의한다 -->
                                        <col width="*"><!-- 나머지공간을 모두 차지함 -->      
                                        <col width="10%">
                                        <col width="15%">
                                        <col width="10%">
                                    </colgroup>
                                    <div class="button_color">
                                    <thead id="button_list_1">
                                        <tr><!-- 하나의 셀이 col의 속성에대한 열의 속성의 헤더라는 뜻이다 -->                                 
                                            <th scope="col" class="table-header_01">번호</th>
                                            <th scope="col" class="table-header_02">제목</th>
                                            <th scope="col" class="table-header_03">등록자</th>
                                            <th scope="col" class="table-header_04">등록일</th>
                                            <th scope="col" class="table-header_05">조회수</th>
                                        </tr>
                                    </thead>
                                    </div>
                                    <tbody>
                                        <c:forEach items="${generalPostListVO.generalPostList}" var="freeboard" varStatus="index">
                                            <tr>                                                
                                                <td class="pratice_01">${(index.index + 1) * (searchForumVO.pageNo + 1)}</td>
                                                <td><!--자유게시판의 내용을 가져와 반복하는 태그 -->
                                                <div class="pratice">
                                                <a class="text_controller" href="/freeboard/view/${freeboard.generalPostId}">
                                                    <!-- ${freeboard.postTitle} -->
                                                    <span class="comment_count"></span>
                                                        ${freeboard.postTitle}
                                                </a>
                                                </div>
                                                </td>
                                                <td class="pratice_02">${freeboard.memberVO.nickname}</td>
                                                <td class="pratice_03">${freeboard.postDate}</td>
                                                <td class="pratice_04">${freeboard.viewCnt}</td>
                                            </tr>
                                            
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>                       
                        </fieldset>
                    </form>
                 </main>
                 </section>
                 </div>
    		 <div class="body_right_aside">
    		 <div class="body-right">
    		 <!-- 오른쪽 -->
	             <div class="advertising">
		              <a href="https://blog.naver.com/roborang/221827208404">
		              	<img class="why_code" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDAyMjZfOTcg%2FMDAxNTgyNzAzOTk2MzQ1.bsJ-QZhJSxCCLwgYAk4ibsKrPqHNk-7SlEYEowKsf6Ug.MReP1pZZeA_b7SBVMUbJUspOftiFOZ-_rvBxkWVktmIg.PNG.roborang%2F%25C4%25DA%25B5%25F9%25B1%25B3%25C0%25B0_%25BF%25D6_%25C7%25D8%25BE%25DF_%25C7%25D2%25B1%25EE%25BF%25E4.png&type=sc960_832">
		              </a> 
	            </div>
	            <div class="viedo_ver">
	                <a href="https://www.youtube.com/watch?v=iI0s1JtKpy8">
	                    <iframe width="250" height="200" src="https://www.youtube.com/embed/iI0s1JtKpy8" title="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	                </a>
	            </div>        
	        </div>
        </div>
      </div>
<jsp:include page="../layout/footer.jsp" />
<script>
        document.addEventListener('DOMContentLoaded', function() {
    const viewCountElement = document.getElementById('viewCount');
    
    const postId = freeboard.generalPostId; // 게시물의 고유 ID (예시로 대입)

    // 서버로부터 조회수 업데이트 정보를 가져옵니다.
    function updateViewCount() {
        fetch(`/updateViewCount?postId=${postId}`, {
            method: 'GET'
        })
        .then(response => response.json())
        .then(data => {
            // 업데이트된 조회수를 가져와서 화면에 표시합니다.
            viewCountElement.textContent = data.viewCount;
        })
        .catch(error => {
            console.error('에러 발생:', error);
        });
    }

    // 페이지 로딩 시 초기 조회수 업데이트를 수행합니다.
    updateViewCount();

    // 페이지 뷰 시 매번 업데이트하는 대신, 필요한 이벤트(예: 게시물 뷰)에서 호출하세요.
    // updateViewCount();
});

        // 미완성된 기능을 알려주는 모달창
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
        var swiper = new Swiper('.swiper-container', {
           slidesPerView: 1, // 한 번에 보일 슬라이드 개수
           spaceBetween: 10, // 슬라이드 사이 간격
           navigation: {
               nextEl: '.swiper-button-next', // 다음 버튼의 클래스
               prevEl: '.swiper-button-prev'  // 이전 버튼의 클래스
           }
       });
       var mySwiper = new Swiper('.swiper-container', {
  // 기타 Swiper 설정...

  // autoplay 속성을 사용하여 자동 전환을 활성화하고 설정합니다.
  autoplay: {
    delay: 2000, // 슬라이드 간의 전환 지연 시간 (밀리초)
    disableOnInteraction: false, // 사용자 상호 작용 후에도 자동 전환을 유지할지 여부
  },

  
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev'
  }
});
</script>
</body>
</html>