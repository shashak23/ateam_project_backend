
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
         /*게시판 title 제어*/
         .bbs_title {
            font-weight: bold;
            font-size: 25px;
            margin-top: 160px;
            margin-left: 530px;
         }
         
         .wrap {
            display: flex;
            justify-content: center;
         }

         .list_search {
            margin-bottom: 15px;
            margin-left: 500px;
           
         }
         
        .board_list_box {
           position: relative;
           left: 500px;
           border-top: 3px solid var(--hashtag-blue);
           border-bottom:none;
           border-left: none;
           border-right: none;
            width: 1000px;
         }
         /*게시판 테이블 제어*/
         table {
             border-collapse: collapse;
         }
         
         .table-header_01 {
            width: 50px;
           height: 35px;
         }
         /*pagenation 제어*/
         #page {
            text-align: center;
         }

         #page > a {
            margin-top: 15px;
            margin-bottom: 15px;
            padding: 5px 10px 5px 10px;
            display: inline-block;
            border-radius: 4px;
            background-color:var(--white);
            color: #666;
            text-decoration: none;
         }

        #page > a.active_page {
            border: 1px solid var(--red);
            color: var(--red);
            font-weight: bold;
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
             position: relative;
             left: 1420px;
             margin-top: 30px;
             background-color: var(--hashtag-blue);
             border-radius: 5px;
             border: none;
             width: 70px;
             height: 30px;
             margin-bottom: 50px;
         }
         
         #button_list_1 tr th {
            background-color: var(--light-gray);
            border-bottom: 1px solid var(--dark-gray);
            color: var(--dark-gray);
        }
        /*게시판 내역 제어*/

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
        }.loading {
            display: none;
        }
        .scrollable-table {
            max-height: 400px;
            overflow-y: scroll;
        }

        .hashtag_wrap {
		    display: flex;
		    width: 250px;
		    flex-wrap: wrap;
		    margin-top: 30px;
		    border: 1px solid var(--gray);
		    border-radius: 10px;
		    padding: 10px;
		}
    </style>
</head>
<body>
   <div id="wrap" class="wrap">
      <!-- ... -->
  </div>
  
    <main class="contents">
      <div class="board">
          <p class="bbs_title">게시글 목록</p>
  
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
  		<div id="hashtagList">
		  <h3>해시태그</h3>
		    <div class="hashtag_wrap">
		</div>
          <!-- 게시판 리스트 -->
          <form action="" method="">
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
                                  <th scope="col" class="table-header_03">등록자</th>
                                  <th scope="col" class="table-header_04">등록일</th>
                                  <th scope="col" class="table-header_05">조회수</th>
                              </tr>
                          </thead>
                          <tbody id="user-list"></tbody>
                          <div class="loading text-center" id="loading">로딩 중...</div>
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
              <div class="btn_write">
                  <button type="submit" class="btn_write_1">
                      <a href="/qnaboard/create">글쓰기</a>
                  </button>
              </div>
               
           </div>
          </form>
      </div>
  </main>
   <jsp:include page="../layout/footer.jsp" />
   <script src="./js/jquery-1.11.3.min.js"></script>
   <script src="./js/jquery.easing.1.3.js"></script>
   <script src="./js/common.js"></script>
   <script>
   </script>
   <script>
	// 사이드바에 해시태그 리스트 조회해주는 코드 
	   $.get('/code/해시태그', function(response) {
	     for (let i = 0; i < response.length; i++) {
	       let hash_template = `<button class="hashtag incomplete">#\${response[i].codeContent}</button>`
	       $('.hashtag_wrap').append(hash_template)
	     }
	   })	
	   
      const userList = document.getElementById('user-list');
      const tableContainer = document.querySelector('.board_list_ty1');
      const loading = document.getElementById('loading');
      let page = 1;
      let isFetching = false;

        
        async function getYourData(page) {
			try {
			  const response = await axios.get(`/qnaboard/list?page=${page}`, {
			    headers: {
			      'Content-Type': 'application/json'
			    }
			  });
			return response.data;
			} catch (error) {
			  console.error('Error fetching data: ', error);
			 return [];
			}
        }
        async function displayData() {
            if (isFetching) return;
            isFetching = true;
            loading.style.display = 'block';
            const data = await getYourData(page);
            loading.style. display = 'none';

            // 데이터를 사용해 행을 생성하는 로직을 여러분의 데이터에 맞게 수정하세요.
            data.forEach(qnaboard => {
                const row = document.createElement('tr');
                row.innerHTML =`
         
            <td class="pratice_01">${qnaboard.generalPostId}</td>
        <td>
          <div class="pratice">
            <a class="text_controller" href="/qnaboard/view/${qnaboard.generalPostId}">
              ${qnaboard.postTitle}
            </a>
          </div>
        </td>
        <td class="pratice_02">${qnaboard.memberVO.nickname}</td>
        <td class="pratice_03">${qnaboard.postDate}</td>
        <td class="pratice_04">${qnaboard.viewCnt}</td>
      `;
      userList.appendChild(row) ;
    });
            page++;
}
            isFetching = false;
        

        tableContainer.addEventListener('scroll', () => {
            const { scrollTop, scrollHeight, clientHeight } = tableContainer;
            if (scrollTop + clientHeight >= scrollHeight - 5) {
                displayData();
            }
            if (scrollTop === 0) {
                userList.innerHTML = '';
                page = 1;
                displayData();
            }
        });

        displayData();
    
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