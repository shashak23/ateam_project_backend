
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" id="viewport" content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width"/>
    <!-- <title>SnapChat</title> -->
   
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
   
    <script src="js/lib/jquery-3.7.1.js"></script>
    <jsp:include page="../layout/header.jsp"/>
    <style>
         #hashtag {
            margin: 0 auto;
            margin-top: 50px;
            text-align: center;
            font-size: 30px;
         }
         .hashtag_wrap {
	        margin: 0 auto;  
	        display: flex;
	        flex-direction: row;
	        flex-wrap: wrap;
	        width: 780px;
	        }
	     .fieldset_controller {
	        display: flex;
	        margin: 0 auto;
	        margin-right: 300px;
	    } 
	    .board_list_ty1 {
	        width: 800px;
	    } 

   
        .hashtag_incomplete {
           background-color: yellow;        
           margin: 0 auto;
           margin-left: 10px;
           margin-top: 30px;
           width: 85px;
           height: 35px;
           border-radius: 10px;
           border: 1px solid var(--light-gray);
           cursor: pointer;
           
        }
        .hashtag_incomplete:hover {
           background-color: var(--blue);
        }

        .list_search {
           text-align: right;

        }

        /*게시판 테이블 제어*/
        table {
            border-collapse: collapse;
         
        }
        
        .table-header_01 {
           width: 50px;
          height: 35px;
        }
        
        /*버튼 속성제어*/
        .btn_st_2,.btn_st_3 {
           background-color: var(--hashtag-blue);
           border-radius: 5px;
           border: none;
           width: 60px;
           height: 30px;
        }
        .btn_write_1 {  
            margin: 0 auto;  
            margin-top: 30px;
            margin-left: 930px;
            background-color: var(--hashtag-blue);
            border-radius: 5px;
            border: none;
            width: 70px;
            height: 30px;
          
        }

        #button_list_1 tr th {
           background-color: var(--light-gray);
           border-bottom: 1px solid var(--dark-gray);
           color: var(--dark-gray);
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

       .advertising {

           position: absolute;
	       top: 0;
	       right: 10px;
	       width: 200px;
	       height: 500px;
	       border: 1px solid var(--gray);
	       margin: 0 auto;
	       margin-top: 650px;
	       margin-right: 50px;
       }
	    #hot_post a {
		    color: black; 
		    margin: 0 auto;
		    
		    line-height: 3; 
		}
		
		.my-aside {
			position: fixed;
			right: 0;
			top: 220px;
			width: 250px;
			
		}
		
		.my-aside a {
		display: block;
		overflow:hidden;
	      text-overflow:ellipsis;
	      white-space:nowrap;
		}
		
		.contents {
		    width: 780px;
	    	margin: 0 auto;
	    }
    </style>
</head>
<body>
    <nav>
        <div id="hashtagList">
            <p id="hashtag"># Hashtags</p>
            <div class="hashtag_wrap"></div>
        </div> 
    </nav>
    <div class="controll_all">
        <main class="contents">
            <!-- 게시물검색 -->
            <div class="list_search">
                <select name="searchType">
                    <option value="subject" ${searchForumVO.searchType eq 'subject' ? 'selected' : ''}>제목</option>
                    <option value="content" ${searchForumVO.searchType eq 'content' ? 'selected' : ''}>내용</option>
                    <option value="writer" ${searchForumVO.searchType eq 'email' ? 'selected' : ''}>이메일</option>
                </select>
                <input type="text" class="sc_text" placeholder="검색어 입력" name="searchKeyword" value="${searchForumVO.searchKeyword}" />
                <button type="submit" class="btn btn_st_2">
                    <a href="#">조회</a>
                </button>
                <button type="submit" class="btn btn_st_3">
                    <a href="/qnaboard/create">글쓰기</a>
                </button>
            </div>
            <!-- 게시판 리스트 -->
            <div id="container_controller">
                <form class="fieldset_controller" action="" method="">
                    <fieldset class="board_list_box">
                        <!-- 리스트 -->
                        <div class="board_list_ty1">
                            <table>
                                <colgroup>
                                    <col width="10%">
                                    <col width="*">
                                    <col width="10%">
                                    <col width="15%">
                                    <col width="10%">
                                </colgroup>
                                <thead id="button_list_1">
                                    <tr>
                                        <th scope="col" class="table-header_01">번호</th>
                                        <th scope="col" class="table-header_02">제목</th>
                                        <th scope="col" class="table-header_03">등록자</th> <!-- 수정: 등호 추가 -->
                                        <th scope="col" class="table-header_04">등록일</th>
                                        <th scope="col" class="table-header_05">조회수</th>
                                    </tr>
                                </thead>
                                <tbody id="user-list">
                                    <c:forEach items="${generalPostListVO.generalPostList}" var="qnaboard" varStatus="index">
                                        <tr>
                                            <td class="pratice_01">${(index.index + 1) * (searchForumVO.pageNo + 1)}</td>
                                            <td>
                                                <div class="pratice">
                                                    <a class="text_controller" href="/qnaboard/view/${qnaboard.generalPostId}">
                                                        ${qnaboard.postTitle}
                                                    </a>
                                                </div>
                                                <script src="https://unpkg.com/axios/dist/axios.min.js"></script>  
                                            </td>
                                            <td class="pratice_02"> ${qnaboard.memberVO.nickname}</td>
                                            <td class="pratice_03">${qnaboard.postDate}</td>
                                            <td class="pratice_04">${qnaboard.viewCnt}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </form>
            </div>
        </main>
        <aside class="my-aside">
	          <!-- 조회수순 랭킹 -->
	          <h3 id="viewCnt">주간 질답 랭킹 ▶ </h3>
	          <div class="view_ranking_wrap"></div>
	          <h3 id="like_top">명예의 전당 ▶ </h3>
	           <div class= "ranking_list">
	              <ul class="ranking_wrap"></ul>
	          </div>                       
	      </aside>
    </div>
   <jsp:include page="../layout/footer.jsp" />
   <script src="./js/jquery-1.11.3.min.js"></script>
   <script src="./js/jquery.easing.1.3.js"></script>
   <script src="./js/common.js"></script>
   <script>
   </script>
   <script>
   // 월요일마다 갱신함
   const today = new Date()
   const currentDay = today.getDay() // (0: 일요일, 1:월요일)
   const targetDay = 0
   const daysAfterTargetDay = currentDay - targetDay

   const prevMonday = new Date(today)
   prevMonday.setDate(today.getDate() - daysAfterTargetDay + 1)
   
   const year = prevMonday.getFullYear()
   const month = String(prevMonday.getMonth() + 1).padStart(2, '0')
   const day = String(prevMonday.getDate()).padStart(2, '0')

   const formattedMonday = year + '-' + month + '-' + day
	// 랭킹
    $.get('/home/ranking/\${formattedMonday}', function(response) {
       console.log(response);
      let list = response.rankings
      for (let i = 0; i < 10; i++) {

        if (list[i].boardId === 'CC-20231017-000030') {
          let ranking_template = `
            <li id="hot_post">
            <a href="/qnaboard/view/\${list[i].generalPostId}" target="_blank"">\${list[i].postTitle}</a>
            </li>`
          let ranking_templateDom = $(ranking_template)
  
          $('.ranking_wrap').append(ranking_templateDom)
        }
      }
    })
   	  // 가운데에 해시태그 리스트 조회해주는 코드 
      $.get('/code/해시태그', function(response) {
        for (let i = 0; i < response.length; i++) {
          let hash_template = `<button class="hashtag_incomplete">#\${response[i].codeContent}</button>`
          $('.hashtag_wrap').append(hash_template)
        }
        
      })   
      $().ready(function() {
	  // 'codeContent' 클릭 시 이벤트 처리
	  $('.hashtag_wrap').click(function() {
	    $.get('/hashtag/list', function(response) {
	      if (response.hashtagId != null) {
	        // 해시태그 목록을 반복하여 처리
	        response.hashtagListVO.forEach(function(hashtagId) {
	          console.log(generalPostHashtagVO.hashtagId);
	        });
	      } else {
	        console.log('무언가 잘못됐답니당 ~~~~~~~ ');
	      }
	    });
	  });
	});

		// 버튼 클릭 이벤트 핸들러 연결
		// $('.hashtag_wrap').on('click', '.hashtag_incomplete', redirectToNewPage);
        // 버튼 클릭 시 페이지 이동 이벤트 핸들러
		/* function redirectToNewPage() {
		    // 클릭한 버튼의 hashtagId 값을 가져오기
		    let hashtagId = $(this).data('hashtagId');
		
		    // 새로운 URL 생성
		    let newURL = `/hashtag/list/${hashtagId}`;
		
		    // $.get 방식으로 URL로 이동
		    $.get(newURL, function(data) {
		        // 이동한 페이지에서 반환된 데이터(data)에 대한 처리를 여기에 추가
		        console.log("이동한 페이지에서 받은 데이터:", data);
		    });
		}
 */
		
       const userList = document.getElementById('user-list');
       const tableContainer = document.querySelector('.board_list_ty1');
       const loading = document.getElementById('loading');
       let page = 1;
       let isFetching = false;

    
       // 미완성된 기능을 알려주는 모달창
       $('.incomplete').click(function() {
           $('.modal, .overlay').addClass('modal_active');
       });
       $('.overlay').click(function() {
           $('.modal, .overlay').removeClass('modal_active');
       });
   
       // 스크롤 버튼, IDE
       let calcScrollValue = () => {
           let scrollProgress = document.getElementById('progress');
           let progressValue = document.getElementById('progress-value');
           let pos = document.documentElement.scrollTop;
           let calcHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
           let scrollValue = Math.round((pos * 100) / calcHeight);
   
           scrollProgress.addEventListener('click', () => {
               document.documentElement.scrollTop = 0;
           });
       };
       
       window.onscroll = calcScrollValue;
   
       // 서브 리스트가 있다면? 아래로 떨군다.
       $('.visible').hide();
       $('.list_company').mouseover(function() {
           $('.visible').show();
           $(this).find('a').css({'background-color': 'var(--blue)', 'color': 'white', 'box-shadow': '0 0 5px var(--gray)'});
       });
       $('.list_company').mouseleave(function() {
           $('.visible').hide();
           $(this).find('a').css({'background-color': 'white', 'color': 'var(--blue)', 'box-shadow': 'none'});
       });

   </script>
</body>
</html>

