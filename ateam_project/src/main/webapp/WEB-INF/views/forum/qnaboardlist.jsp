
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../layout/header.jsp"/>
<style>
    table {
        border-collapse: collapse;
    }

    .body_container {
        display: flex;
        width: 1470px;
        justify-content: center;
        margin: 0 auto 50px;
        
    }

    .button_list {
        display: flex;
        justify-content: space-between;
        margin: 15px auto 0;
        width: 180px;
    }

    .board_list_box {
        display: inline-block;
        margin: 0 auto;
        border:none;
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

    #button_list_1 tr th {
        background-color: var(--light-gray);
        border-bottom: 1px solid var(--dark-gray);
        color: var(--dark-gray);       
    }

    .hidden {
        display: none;
    }

    .controll_all {
        width: 9    80px;
    }

    .board_list_ty1 {
        width: 980px;
        margin-right: 20px;
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

    #hashtag {
        margin: 20px auto;
        text-align: center;
        font-size: 40px;
        font-weight: bold;
    }

    #hashtagList {
        margin-bottom: 30px;
    }

    .hashtag_wrap {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        margin: 0 auto;  
        width: 780px;
        height: 100px;
    }

    .hashtag_incomplete {
        text-align: center;
        font-size: 20px;
        margin: 0 auto;
        width: 85px;
        height: 35px;
        border-radius: 10px;
        border: none;
        cursor: pointer;
        text-decoration: underline;
        
    }
    
    .hashtag_incomplete:hover {
        background-color: var(--blue);
    }

    .list_search {
        text-align: right;
    }

    #hot_post a {
        color: black; 
        margin: 0 auto;
        line-height: 3; 
    }
    
    .my-aside {
        width: 250px;
    }

    /* 추가css */
    #left_container{
        display: flex;
        justify-content: center;
        width: 180px;
        min-height: 500px;
        margin-right: 20px;
    }

    #toolbar{
        width: 150px;
        position: fixed;
        align-items: center; 
        margin-right: 30px;
    }

    #toolbar > #registerArticle{
        width:180px;   
    }

    #toolbar > #registerArticle > .register{
        width: 180px;
        height:35px;
        margin-top: 9px;
        color:black;
        background-color: var(--hashtag-blue);
        border-radius: 6px;
        border:none;
        outline: none;
        transition: box-shadow 0.2s ease;
    }

    #toolbar > #registerArticle > .register:hover{
        box-shadow: 0 0 5px var(--light-blue);
    }
    #pageName {
        font-size: var(--font-big);
        font-weight: bold;
    }
    .search_menu {
        width: 50px;
    }

    .button_box {
        margin: 5px auto;
        background-color: var(--hashtag-blue);
        border-radius: 5px;
        border: none;
        width: 180px; 
        height: 30px;
        transition: box-shadow .2s;
    }

    .button_box:hover {
        box-shadow: 0 0 3px var(--light-blue);
    }
    .sc_text {
        width: 120px;
    }
    
    .ranking_controller {
        border: 1px solid var(--light-gray);
        border-radius: 8px;
        margin-bottom: 20px;
    }
   /* 그래프 */
   .ranking_controller.expanded {
        overflow: hidden;
        height: 0;
        transition: height 1s;
    }

    .ranking_controller.expanded.expanded {
        height: 200px; /* 원하는 높이로 설정하세요. */
        transition: height 1s;
    }

    .ranking_wrap_1 {
        list-style: none;
        padding: 0;
    }

    .ranking_wrap_1 li {
        background-color: var(--default-color); /* 기본 배경색 */
        margin-bottom: 5px;
        transition: width 0.5s;
    }

    .ranking_wrap_1 li:hover {
        background-color: var(--highlight-color); /* 마우스를 올렸을 때 배경색 변경 */
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
    <div class="body_container">
        <div id="left_container">
            <div id="toolbar">
                <div id="pageName">질문게시판</div>
                <div id="registerArticle">
                    <button class="register" type="button" onclick="location.href='/qnaboard/create';">글작성</button>
                </div>
                <form id="search-form" method="get" action="/qnaboard/list">
                    <div class="button_list">
                        <select class="search_menu" name="searchType">
                            <option value="postTitle" ${searchForumVO.searchType eq 'postTitle' ? 'selected' : ''}>제목</option>
                            <option value="postContent" ${searchForumVO.searchType eq 'postContent' ? 'selected' : ''}>내용</option>
                            <option value="postWriter" ${searchForumVO.searchType eq 'postWriter' ? 'selected' : ''}>작성자</option>
                        </select>
                        <input class="sc_text" type="text"  placeholder="검색어 입력" name="searchKeyword" value="${searchForumVO.searchKeyword}" />                    
                    </div>               
                    <button class="button_box" type="submit">검색</button>
                </form>
             </div>
        </div>
     
        <div class="controll_all">
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
                                        <col width="10%">
                                        <col width="15%">
                                    </colgroup>
                                    <thead id="button_list_1">
                                        <tr>
                                            <th scope="col" class="table-header_01">번호</th>
                                            <th scope="col" class="table-header_02">제목</th>
                                            <th scope="col" class="table-header_03">등록자</th> <!-- 수정: 등호 추가 -->
                                            <th scope="col" class="table-header_04">등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${generalPostListVO.generalPostList}" var="qnaboard" varStatus="index">
                                            <tr class="hidden">
                                                <td class="pratice_01">${(index.index + 1) * (searchForumVO.pageNo + 1)}</td>
                                                <td>
                                                    <div class="pratice">
                                                        <a class="text_controller" href="/qnaboard/view/${qnaboard.generalPostId}">
                                                            ${qnaboard.postTitle}
                                                        </a>
                                                    </div>                                       
                                                </td>
                                                <td class="pratice_02"> ${qnaboard.memberVO.nickname}</td>
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
        <aside class="my-aside">
            <!-- 조회수순 랭킹 -->
            <h3 id="viewCnt">주간 질답 랭킹 ▶ </h3>
            <div class="ranking_controller">
            <div class="view_ranking_wrap"></div>         
            <div class= "ranking_list">
                <ul class="ranking_wrap"></ul>
            </div> 
            </div>
            <h3 id="like_top">명예의 전당 ▶ </h3>
            <div class="ranking_controller expanded">
            <div class="view_ranking_wrap_1">
                <ul class="ranking_wrap_1">
            </div>
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
            let hash_template = `<a href="/qnaboard/list?hashtagId=\${response[i].codeId}" class="hashtag_incomplete">#\${response[i].codeContent}</button>`
            $('.hashtag_wrap').append(hash_template)
        }
    })

    $().ready(function() {
    // 'codeContent' 클릭 시 이벤트 처리
    /*  $('.hashtag_wrap').click(function() {
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
        }); */
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


    //  랭킹
    $(document).ready(function() {
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
    });

    // 명예의 전당
    $.get("/qnaboard/topTenMember", function(response) {
        for (var i in response.generalMemberList) {
            let listDOM = $("<ul></ul>");
            let userEmailDOM = $("<li></li>");
            userEmailDOM.text(response.generalMemberList[i].generalMemberEmail + " / " + response.generalMemberList[i].tierScore);
            listDOM.append(userEmailDOM)
            $(".ranking_wrap_1").append(listDOM)
        }
    })


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

    let currCount = 0

    function loadContent() {
        for (let i = currCount; i < currCount + 20; i++) {
            $('tr.hidden').eq(0).removeClass('hidden')
        }
        currCount += 20
    }

    loadContent()

    window.onscroll = function() {
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight -250) {
            loadContent()
        }
    }
   </script>
</body>
</html>

