
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" id="viewport" content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width"/>
<title>devGround</title>
<script src="js/lib/jquery-3.7.1.js"></script>
<jsp:include page="../layout/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<style>
   /* 본문 */
 
   .board_list_box {
       position: relative;
       bottom: 400px;
       margin: 0 auto;
       margin-top: 490px;
       margin-left: 30px;
       margin-right: 30px;
       border-top:none;
       border-bottom:none;
       border-left: none;
       border-right: none;
   }
   
   #button_list_1 tr th {
       background-color: var(--light-gray);
       border-bottom: 1px solid var(--dark-gray);
       color: var(--dark-gray);  
       width: 1050px;     
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
    
    #tier_img{
	  	width: 11px;
	  	margin-left: 5px;
	}
    .pratice {
        margin-top: 30px;
        border-bottom: 1px solid var(--gray);
    }
    .text_controller {
        position: relative;
        bottom: 20px;
    }
    /* 해시태그 */
     #hashtag {
        margin: 0 auto;
        margin-top: 30px;
        text-align: center;
        font-size: 40px;
        font-weight: bold;
        
     }
     .hashtag_wrap {
	    margin: 0 auto;  
	    display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    width: 780px;
     
     }
    .hashtag_incomplete {
	    text-align: center;
	    font-size: 20px;
	    margin: 0 auto;
	    margin-left: 10px;
	    margin-top: 35px;
	    padding: 0px 10px;
	    width: auto;
	    height: 35px;
	    border-radius: 10px;
	    border: none;
	    cursor: pointer;
	    background-color: var(--light-gray);
	    color: var(--dark-gray);
	    transition: color 0.3s ease; 
	}
	
	.hashtag_incomplete:hover {
	    background-color: #E55604;
	}
    
    /* 글작성 버튼 */
    #left_container {
      display: flex;
      justify-content: center;
      width:300px;
      min-height: 500px;
      margin-top: 330px;
   }

   #toolbar{
   	  position:fixed; 
      width: 300px;
      margin: 25px 0px 0px 20px;
      width: 200px;
      padding: 15px;
      align-items: center; 
   }

   #toolbar > #registerArticle > .register{
      width: 220px;
      height:35px;
      margin-top: 9px;
      color:black;
      background-color: #26577C;
      color: white;
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
	    color: white;
   }
   .search_menu {
	    position: relative;
	    top: 22px;
   }
   .button_box {
	    margin: 0 auto;
	    margin-left: 160px;
	    margin-top: 10px;
	    background-color: #26577C;
	    color: white;
	    border-radius: 5px;
	    border: none;
	    width: 60px; 
    	height: 30px;
   }
   .sc_text {
	    margin: 0 auto;
	    margin-left: 68px;
	    width: 150px;
   }
    /* 랭킹박스 */
    .body_right_aside {
		width: 290px;
		padding: 15px 20px;
	}
	.my-aside {
		width: 270px;
		display: flex;
		flex-direction: column;
	    justify-content: center;
	    width: 100%;
		margin-top: 370px;
	}
	
   .ranking_controller {
   		margin-top: 20px;
   		display: flex;
	    border: 1px solid var(--light-gray);
	    border-radius: 10px;
	    margin-right: 40px;
   		flex-direction: column;
    	border: 1px solid var(--light-gray);
   }
   
   .ranking_controller_1 {
   		display: flex;
	    border: 1px solid var(--light-gray);
	    border-radius: 10px;
	    margin-right: 40px;
   		flex-direction: column;
    	border: 1px solid var(--light-gray);
   }
   .ranking_controller .viewCnt {
   		display: flex;
	    justify-content: center;
	    padding: 10px 0;
	    border-bottom: 1px solid var(--gray);
	    width: 100%;
   }
   
   .ranking_controller_1 .viewCnt {
   		display: flex;
	    justify-content: center;
	    padding: 10px 0;
	    border-bottom: 1px solid var(--gray);
	    width: 100%;
   }
   
   .ranking_controller .ranking_wrap {
   		display: flex;
	    flex-direction: column;
	    justify-content: center;
	    width: 100%;
	    margin-bottom: 20px;
	    font-size: 13px;
	    
   }
   
   .ranking_controller .ranking_wrap ul .hot_post {
	    flex: 1;
	    width: 100%;
	    border-bottom: 1px solid var(--light-gray);
	    transition: all 0.1s;
	    color: var(--dark);
	    cursor: pointer;
	    padding: 15px 20px;
	    background-color: #DFEEF7;
  }
  
  .ranking_controller .hot_post:hover {
  		background-color: #DFEEF7;
  }

  .body_right .ranking_wrap ul .hot_post a {
	    color: var(--dark);
	    display: block;
	    padding: 15px 20px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
  }  

</style>
</head>
<body>
    <div class="body_container">
	    <div class="body_left_aside">
		    <div id="left_container">
		        <div id="toolbar">
		            <div id="pageName"></div>
		            <div id="registerArticle">
		                <button class="register" type="button" onclick="location.href='/qnaboard/create';">글작성</button>
		            </div>
		            <div class="search_area">
		               
		                <form id="search-form" method="get" action="/qnaboard/list">
		                  <div class="button_list">
		                    <select class="search_menu" name="searchType">
		                        <option value="postTitle" ${searchForumVO.searchType eq 'postTitle' ? 'selected' : ''}>제목</option>
		                        <option value="postContent" ${searchForumVO.searchType eq 'postContent' ? 'selected' : ''}>내용</option>
		                        <option value="postWriter" ${searchForumVO.searchType eq 'postWriter' ? 'selected' : ''}>작성자</option>
		                    </select>
		                    <input class="sc_text" type="text"  placeholder="검색어 입력" name="searchKeyword" value="${searchForumVO.searchKeyword}" />                    
		                        <button class="button_box" type="submit" class="btn_st_2">
		                            검색
		                        </button>                               
		                  </div>               
		               </form>               
		            </div>            
		         </div>
		    </div>
	    </div>
    <div class="body">
    <div id="hashtagList">
            <p id="hashtag"># Hashtags</p>
            <div class="hashtag_wrap"></div>
        </div> 
        <main class="contents">
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
                                    <col width="15%">
                                    <col width="15%">
                                   
                                </colgroup>
                                <thead id="button_list_1">
                                    <tr>
                                        <th scope="col" class="table-header_01">번호</th>
                                        <th scope="col" class="table-header_02">제목</th>
                                        <th scope="col" class="table-header_03">등록자</th>
                                        <th scope="col" class="table-header_04">등록일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${generalPostListVO.generalPostList}" var="qnaboard" varStatus="index">
                                        <tr>
                                            <td class="pratice_01">${(index.index + 1) * (searchForumVO.pageNo + 1)}</td>
                                            <td>
                                                <div class="pratice">
                                                    <a class="text_controller" href="/qnaboard/view/${qnaboard.generalPostId}">
                                                        ${qnaboard.postTitle}
                                                    </a>
                                                </div>                                       
                                            </td>
                                            <td class="pratice_02"> ${qnaboard.memberVO.nickname}<img id="tier_img" src="/images/${qnaboard.memberVO.tierVO.tierName}.png" /></td>
                                            <td class="pratice_03">${qnaboard.postDate}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </form>
            </div>
        </main>
    </div>
        <div class="body_right_aside">
	        <div class="my-aside">
	        	  <!-- 명예의 전당 -->
	              <div class="ranking_controller_1">
		            <h3 class="viewCnt">👑명예의 전당👑 </h3>
	                  <ul class="ranking_wrap_1"></ul>
	              </div>
		          <!-- 조회수순 랭킹 -->
	              <div class="ranking_controller">
		          	<h3 class="viewCnt">📋주간 질답 랭킹 </h3>
		              <ul class="ranking_wrap"></ul>
	             </div>
		      </div>
	      </div>
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
	
     
	//  랭킹
	$(document).ready(function() {
		// 주간랭킹
	    $.get('/home/ranking/\${formattedMonday}', function(response) {
	       console.log(response);
	      let list = response.rankings
	      for (let i = 0; i < 10; i++) {

	        if (list[i].boardId === 'CC-20231017-000030') {
	          let ranking_template = `
	            <li class="hot_post">
                  <a class="block ellipse" href="/qnaboard/view/\${list[i].generalPostId}" target="_blank" style="padding: 10px; border-bottom: 1px solid var(--light-gray);;">\${list[i].postTitle}</a>
	            </li>`
	          let ranking_templateDom = $(ranking_template)
	  
	          $('.ranking_wrap').append(ranking_templateDom)
	        }
	      }
	    })
	    
	   	  // 가운데에 해시태그 리스트 조회해주는 코드 
	      $.get('/code/해시태그', function(response) {
	        for (let i = 0; i < response.length; i++) {
	          let hash_template = `<a href="/qnaboard/list?hashtagId=\${response[i].codeId}" class="hashtag_incomplete">\${response[i].codeContent}</button>`
	          $('.hashtag_wrap').append(hash_template)
	        }
	      })
	      
	    // AJAX 요청을 통해 데이터 가져오기
	    $.get('/home/ranking/\${formattedMonday}', function(response) {
	        // 데이터를 가져왔을 때 실행되는 콜백 함수
	        if (response && response.data) {
	            const rankingData = response.data;
	
	            // rankingData를 이용하여 그래프를 생성하고 ranking_wrap_1에 추가
	            const rankingWrap = $('.ranking_wrap_1');
	            rankingWrap.empty(); // 기존 내용을 지우고 다시 생성
				
	            rankingData.forEach(item => {
	                const views = item.views;
	                const postTitle = item.postTitle;
	
	                // 그래프 항목 생성
	                const ranking_template = `
	                    <li> 
	                        <a href="/qnaboard/view/${item.generalPostId}" target="_blank">${postTitle}</a>
	                    </li>`;
	                const ranking_templateDom = $(ranking_template);
	                ranking_templateDom.css('width', views + 'px');
	                rankingWrap.append(ranking_templateDom);
	            });
	
	            // 페이지가 로드될 때 랭킹 컨트롤러를 확장 (올라가도록)합니다.
	            $('.ranking_controller').addClass('expanded');
	        }
	    });
		
	 	// 명예의 전당
	    $.get("/qnaboard/topTenMember", function(response) {
		    let listDOM = $("<ul></ul>");
		    for (var i in response.generalMemberList) {
		    	let userEmailDOM = $("<li></li>").css({
		            'border-bottom': '1px solid var(--light-gray)',
		            'padding': '9px 9px',
		            'font-size': '13px'
		        });
		
		        // 티어 이미지를 표시하는 부분
		        let tierImageSrc = "/images/" + response.generalMemberList[i].tierVO.tierName + ".png";
		        let tierImageDOM = $("<img>").attr("src", tierImageSrc).attr("id", "tier_img");
		
		        // 프로필 이미지를 표시하는 부분
		        let profilePicSrc = response.generalMemberList[i].profilePic;
		        let profilePicDOM = $("<img>")
						            .attr("src", profilePicSrc)
						            .attr("id", "profile_img")
						            .css({
						                'width': '9px',
						                'height': '9px',
						                'padding': '10px'
						            });
				
		        console.log(response.generalMemberList[i])
		        userEmailDOM.append(tierImageDOM);
		        userEmailDOM.append(profilePicDOM);
		        userEmailDOM.append($("<span> " + response.generalMemberList[i].nickname + "  " + response.generalMemberList[i].tierScore+"</span>"));
		
		        // 이미지를 리스트에 추가
		        listDOM.append(userEmailDOM); // $()안에 넣지 않고 그냥 text를 쓰면 초기화된다

		    }
		    $(".ranking_wrap_1").append(listDOM);
		});
	});

   //랭킹
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

