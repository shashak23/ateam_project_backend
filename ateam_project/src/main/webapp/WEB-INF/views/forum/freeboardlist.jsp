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
         <script src="/js/lib/jquery-3.7.1.js"></script> 
         <link rel="stylesheet" href="/css/style.css"> 
        <jsp:include page="../layout/header.jsp"/>
        <style>
            
            table {
            border-collapse: collapse;
            }
            .bbs_title {
                font-weight: bold;
                font-size: 25px;
                margin: 80px 100px 30px 430px;

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
            .btn_write_1,.btn_write_2 {
            position: relative;
            left: 830px;
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
                color: var(--blue);
           
            
                
             }
             .pratice {
                margin-top: 42px;
                border-bottom: 1px solid var(--gray);
              
               

             }
             .text_controller {
                position: relative;
                bottom: 20px;
                
               
                
             }
             
             
             
             
             
            
             
             
             
           
            
          
            
            
           
            
            

            


            
        </style>
</head>
<body>
    <p class="bbs_title">게시글 목록</p>
    <!-- 게시물 검색 -->
        <div class="button_list">
                <select class="select">
                    <option value="제목">제목</option>
                    <option value="작성자">작성자</option>
                </select>
            <input type="text" class="sc_text" placeholder="검색어 입력">
                <button type="submit" class="btn_st_2">
                    <a href="#">조회</a>
                </button>
                <!-- <button type="submit" class="btn_st_3">
                    <a href="/freeboard/create">등록</a>
                </button> -->
    </div>
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
                                        <c:forEach items="${generalPostListVO.generalPostList}" var="freeboard">
                                            <tr>                                                
                                                <td class="pratice_01">${freeboard.generalPostId}</td>                                          
                                                <td><!--자유게시판의 내용을 가져와 반복하는 태그 -->
                                                <div class="pratice">
                                                <a class="text_controller" href="/freeboard/view/${freeboard.generalPostId}">
                                                        ${freeboard.postTitle}
                                                </a>
                                                </div>
                                                </td>
                                                <td class="pratice_02">${freeboard.postWriter}</td>
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
                            <button type="submit" class="btn_write_2">
                                <a href="/freeboard/create">엑셀파일</a>
                            </button>
                        </div>
                        <div id="page">
                            <a class="active_page" href="javascript:void(0)">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">다음</a>
                        </div>
                    </form>
    </div>        
            </main>
            <!-- <footer id="footer" class="footer">
                <div class="inner">
                    <address>
                        <span>상호명 : SNAPCHAT</span>
                        <span>개인정보책임관리자 : 홍길동</span>
                        <span>주소 : kt ds</span>
                        <span>사업자등록번호 : 313-34432</span>
                    </address>
                    <div class="copyright">
                        &copy; 2023 by SNAPCHAT. All rights reserved
                    </div>
                </div>
            </footer> -->
    <jsp:include page="../layout/footer.jsp" />
</body>
    <script>
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
             
    </script>
</html>