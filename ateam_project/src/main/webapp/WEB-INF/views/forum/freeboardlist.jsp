<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Buffer Overflow</title>
         <link rel="preconnect" href="https://fonts.googleapis.com"> 
         <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet"> 
         <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" /> 
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
         <script src="/js/lib/jquery-3.7.1.js"></script> 
         <link rel="stylesheet" href="/css/style.css"> 
         <script src="./js/swiper.min.js"></script>
         <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
         <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <jsp:include page="../layout/header.jsp"/>
        <style>
            wrap-wrap{
            	position: grid;
            }
            
            table {
            	border-collapse: collapse;
            }
            .bbs_title {
                font-weight: bold;
                font-size: 25px;
                margin-top: 155px;
                margin-left: 350px;

            }

            .wrap {
                display: flex;
                justify-content: center;        
            }

            .container {
                display: inline-block;
                width: 980px;
                margin: 0 auto;
            
                
            }
            .button_list {
                margin-bottom: 15px;
                position: relative;
                left: 1120px;
                
            }
            .board_list_box {
                border-top: 3px solid var(--hashtag-blue);
                border-bottom:none;
                border-left: none;
                border-right: none;
            }

            .btn_st_2,.btn_st_3 {
                background-color: var(--hashtag-blue);
                border-radius: 5px;
                border: none;
                width: 60px; 
                height: 30px;
            }
            .btn_write_1 {
                position: relative;
                left: 900px;
                margin-top: 30px;
                background-color: var(--hashtag-blue);
                color: white;
                border-radius: 5px;
                border: none;
                width: 70px; 
                height: 30px;
                margin-bottom: 50px;
            }

            
            #page {
            text-align: center;
            }

            #page > a {
            margin-top: 15px;
            margin-bottom: 15px;
            padding: 5px 10px 5px 10px;
            display: inline-block;
            border-radius: 4px;
            background-color: #FFF;
            color: #666;
            text-decoration: none;
            }

            #page > a.active_page {
                border: 1px solid var(--red);
                color: var(--red);
                font-weight: bold;
            }


            .footer {
                margin-top: 100px;
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
             /*swiper제어*/
       
            .swiper-slide img {
                position: relative;
            max-width: 100%;
            height: auto;
            overflow: hidden; /* 이미지가 부모 컨테이너를 벗어나지 않도록 함 */
            }

            .swiper-button-prev,
            .swiper-button-next {
                margin-top: -100px;
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
    <p class="bbs_title">게시글 목록</p>
    	<!-- 게시물 검색 -->
         <form id="search-form" method="get" action="/qnaboard/list">
          <div class="button_list">
              <select name="searchType">
                  <option value="postTitle" ${searchForumVO.searchType eq 'postTitle' ? 'selected' : ''}>제목</option>
                  <option value="postContent" ${searchForumVO.searchType eq 'postContent' ? 'selected' : ''}>내용</option>
                  <option value="postWriter" ${searchForumVO.searchType eq 'postWriter' ? 'selected' : ''}>작성자</option>
              </select>
              <input type="text" class="sc_text" placeholder="검색어 입력" name="searchKeyword" value="${searchForumVO.searchKeyword}" />
              <button type="submit" class="btn btn_st_2">
              	검색
              </button>
              <button type="submit" class="btn btn_st_3">
                  <a href="/qnaboard/create">글쓰기</a>
              </button>
          </div>
          </form>
    <div id="wrap" class="wrap">
        <!-- 본문 -->
        <section id="container" class="container">
            <main class="contents">         
                    <!-- 게시판 리스트 -->
                    <form action="#" method="">
                        <fieldset class="board_list_box">   
                            <div class="board_list_ty1">
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
                        <div class="btn_write">
                            <button type="submit" class="btn_write_1">
                                <a href="/freeboard/create">글쓰기</a>
                            </button>
                        </div>
                        
                    </form>
    		</div> 

    <jsp:include page="../layout/footer.jsp" />
</body>
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
    </script>
</html>