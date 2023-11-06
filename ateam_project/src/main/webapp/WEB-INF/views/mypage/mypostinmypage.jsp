<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../layout/header.jsp" />
<style>
  /* 메인 컨텐츠 영역 */

	#container{
		display: flex; 
		justify-content: center;
	}

	.flex_button {	
		margin: 100px 50px 0px 0px;
		display: flex;
		flex-direction: column;
	
	}

	.body_container{
		display: flex;
		flex-direction: column;
		margin-left: 100px;
	}

	.flex_button button {
	  color: white;	
    background-color: var(--gray);
    width: 150px;
    height: 40px;
    margin-bottom: 15px;
    cursor: pointer;
    border: 2px;
	}

.flex_button button:hover {
	background-color: var(--light-blue);
  	color: white;

}

	table.table {
		border-collapse: collapse;
		margin-top: 30px;
		width: 900px;
		margin: 0 auto;
	}

	table th{
		background-color: var(--light-gray);
		border-bottom: 1px solid var(--dark-gray);
		height:35px;
		color: var(--dark-gray);
	}

	table td{
		border-bottom: 1px solid #D3D3D3;
		color: var(--dark-gray);
	}
	table.table th:last-child, table.table td:last-child {
		border-right: none;
	}
	
	table.table > tbody td {
		padding: 10px;
		color: #333;
		text-align: center;
		color: var(--dark-gray);
	}
	caption {
		font-weight: bold;
		font-size: 20px;
		margin-bottom: 10px;
		margin-top: 10px;
		text-align: left;
	}
	div.member {
		display: flex;
		flex-direction: column;
		padding-left: 90px;
		justify-content: space-around;
	}
	div.member div.flex {
		margin-top: 10px;
	}
	div.member_type {
		font-weight: bold;
		font-size: 20px;
		margin-bottom: 5px;
	}
</style>
  <!-- 메인 컨텐츠 영역 -->
<body> 
	
 		
  <div id="container"> 
	<div class="flex_button">
		<button id="myprofile">마이페이지</button>
		<button>북마크</button>
		<button id="modify_info">정보 수정</button> 
		<button id="mypost">내가 쓴 게시글</button>
		<button id="solve">내가 푼 문제</button>
		<button>탈퇴</button>
	</div>   
	
		<div class="body_container">
			<p></p>
			<table class="table">
				<caption>질답게시판</caption>
				<thead>
					<colgroup>
						<col width="10%" />
						<col width="45%" />
						<col width="15%" />
						<col width="20%" />
						<col width="10%" />
					</colgroup>
					<tr id="table-tr">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty qnaPostList}">
						<c:forEach items="${qnaPostList}" var="qnaboard" varStatus="index">
							<tr>
								<td>${index.index + 1}</td>
								<td style="font-weight: bold;">
									<a href="/qnaboard/view/${qnaboard.generalPostId}">
										<c:out value="${qnaboard.postTitle}" />
									</a>
								</td>
								<td>${qnaboard.memberVO.nickname}</td>
								<td>${qnaboard.postDate}</td>
								<td>${qnaboard.viewCnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
						
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<p></p>
			<table class="table">
				<thead>
					<caption>자유게시판</caption>
					<colgroup>
						<col width="10%" />
						<col width="45%" />
						<col width="15%" />
						<col width="20%" />
						<col width="10%" />
					</colgroup>
					<tr id="table-tr">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty freePostList}">
						<c:forEach items="${freePostList}" var="freeboard" varStatus="index">
							<tr>
								<td>${index.index + 1}</td>
								<td style="font-weight: bold;">
									<a href="/freeboard/view/${freeboard.generalPostId}">
										<c:out value="${freeboard.postTitle}" />
									</a>
								</td>
								<td>${freeboard.memberVO.nickname}</td>
								<td>${freeboard.postDate}</td>
								<td>${freeboard.viewCnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<p></p>
			<table class="table">
				<caption>알고리즘 문제 게시판</caption>
				<thead>
					<colgroup>
						<col width="10%" />
						<col width="20%" />
						<col width="10%" />
						<col width="40%" />
						<col width="20%" />
					</colgroup>
					<tr id="table-tr">
						<th scope="col">번호</th>
						<th scope="col">카테고리</th>
						<th scope="col">난이도</th>
						<th scope="col">문제 제목</th>
						<th scope="col">작성자</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty algorithmQuestionList.algorithmQuestionList}">
						<c:forEach items="${algorithmQuestionList.algorithmQuestionList}" var="algorithmquestion" varStatus="index">
							<tr>
								<td>${index.index + 1}</td>
								<td>${algorithmquestion.commonCodeVO.codeContent}</td>
								<td>${algorithmquestion.algorithmTierId}</td>
								<td style="font-weight: bold;">
									<a href="/algorithm/question/view/${algorithmquestion.companyAlgorithmQuestionId}">
										<c:out value="${algorithmquestion.algorithmTitle}" />
									</a>
								</td>
								<td>${algorithmquestion.memberVO.nickname}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
						
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<p></p>
			<table class="table">
				<caption>알고리즘 해설 게시판</caption>
				<thead>
					<colgroup>
						<col width="10%" />
						<col width="25%" />
						<col width="20%" />
						<col width="20%" />
						<col width="15%" />
						<col width="10%" />
					</colgroup>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>카테고리</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty algorithmExplanationList.algorithmExplanationList}">
						<c:forEach items="${algorithmExplanationList.algorithmExplanationList}" var="algorithmexplanation" varStatus="index">
							<tr>
								<td>${index.index + 1}</td>
								<td style="font-weight: bold;">
									<a href="/algorithm/explanation/view/${algorithmexplanation.companyAlgorithmExplanationId}">
										<c:out value="${algorithmexplanation.postTitle}" />
									</a>
								</td>
								<td>${algorithmexplanation.commonCodeVO.codeContent}</td>
								<td>${algorithmexplanation.memberVO.nickname}</td>
								<td>${algorithmexplanation.postDate}</td>
								<td>${algorithmexplanation.viewCnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">조회된 게시글이 없습니다.</td>
						</tr>
						
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<p></p>
			 <table class="table">
				<caption>기업 소식 게시판</caption>
				<thead>
					<colgroup>
						<col width="10%" />
						<col width="45%" />
						<col width="15%" />
						<col width="20%" />
						<col width="10%" />
					</colgroup>
					<tr id="table-tr">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty companyNewsList.companyNewsList}">
						<c:forEach items="${companyNewsList.companyNewsList}" var="companynews" varStatus="index">
							<tr>
								<td>${index.index + 1}</td>
								<td style="font-weight: bold;">
									<a href="/news/view/${companynews.companyNewsPostId}">
										<c:out value="${companynews.postTitle}" />
									</a>
								</td>
								<td>${companynews.memberVO.nickname}</td>
								<td>${companynews.postDate}</td>
								<td>${companynews.viewCnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
						
					</c:otherwise>
				</c:choose>
				</tbody>
			</table> 
		</div>
	
	</div>
  <jsp:include page="../layout/footer.jsp" />
</body>

<script>  
	
  function redirectToURL(url) {
	        window.location.href = url;
	    }
	    /* 비밀번호, 닉네임 수정 버튼 */
	    $("#myprofile").click(function() {
			redirectToURL(`/memberinfo/view/$${sessionScope._LOGIN_USER_.email}`);
		});
	    $("#mypost").click(function() {
	        redirectToURL(`/member/mypost`);
	    });
	    $("#modify_info").click(function() {
	        redirectToURL(`/member/selectmember/${sessionScope._LOGIN_USER_.email}`);
	    });
		$("#quit").click(function() {
	        redirectToURL(`/member/logout`);
	    });
		$("#solve").click(function(){
			redirectToURL(`/codingtest/mylist`);
		});
  // 모달창 열고 닫기
  $(document).on('click', '.incomplete', function() {
    $('.modal, .overlay').addClass('modal_active')
  })
  $(document).on('click', '.overlay', function() {
    $('.modal, .overlay').removeClass('modal_active')
  })

  $(document).on('keyup', function(e) {
    if (e.key === 'Escape') {
      $('.modal, .overlay').removeClass('modal_active')
    }
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

  // 메인 에디터 영역 모달
  $('.home_edit_container').mouseenter(function() {
    $('.edit_btn').css('background-color', 'var(--gray)')
  })
  $('.home_edit_container').mouseleave(function() {
    $('.edit_btn').css('background-color', '')
  })

  // 게시글 클릭 시 단건 조회 창으로 이동

  // 무한 스크롤 컨텐츠
//   $().ready(function() {
//     let skip = 0
//     let all_count
//     let loading = false
//     let article, articles
//     let boardType
//     let hashtags = []
//     let hashtag_template
//     let template
//     let comments
//     let comment_cnt
//     let nicknameList
//     let nickname
//     let email

    
    
//     const loadContents = function() {
//       $.get('/home/maincontent', function(response) {
//         articles = response
//         console.log(skip, articles)
//         all_count = response.length
//         if (skip === 0) {
//           for (let i = skip; i < skip + 10; i++) {
//             article = articles[i]

            // 게시판의 타입 결정
            // if (article.boardId.slice(-2) === '30') {
            //   boardType = 'qnaboard'
            // }
            // else {
            //   boardType = 'freeboard'
            // }

            // for (let j = 0; j < comments.length; j++) {
            //   if (comments[j].generalPostId === article.generalPostId) {
            //     comment_cnt = comments[j].commentCnt
            //   }
            // }
            
            // for (let j = 0; j < nicknameList.length; j++) {
            //   if (nicknameList[j].generalPostId === article.generalPostId) {
            //     nickname = nicknameList[j].nickname
            //     email = nicknameList[j].email
            //   }
            // }

            // template = `
            //   <article class="content_container">
            //     <div class="writer_info_area">
            //       <div class="flex_left">
            //         <img src="/images/꼬부기.png" alt="꼬부기" />
            //         <div>
            //           <div class="writer_name"><a href="/memberinfo/view/\${email}">\${nickname}</a><span class="follow_btn incomplete">follow</span></div>
            //           <div class="posting_date">\${article.postDate}</div>
            //         </div>
            //       </div>
            //       <div class="flex_right">
            //         <div class="utility">
            //           <button class="bookmarkBtn">
            //             <input type="hidden" class="postId" value="\${article.generalPostId}"/>
            //             <input type="hidden" class="boardId" value="\${article.boardId}" />
            //             <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:(--blue)}</style><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg></button>
            //           <svg class="incomplete" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 128 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M64 360a56 56 0 1 0 0 112 56 56 0 1 0 0-112zm0-160a56 56 0 1 0 0 112 56 56 0 1 0 0-112zM120 96A56 56 0 1 0 8 96a56 56 0 1 0 112 0z"/></svg>
            //         </div>
            //       </div>
            //     </div>
            //     <div class="q_title">
            //       <span class="big_letter">Q</span>
            //       <div>  
            //         <a href="/\${boardType}/view/\${article.generalPostId}" target="_blank">
            //           <span class="title">\${article.postTitle}</span>
            //         </a>
            //         <span class="comment_number">[\${comment_cnt}]</span>
            //         <span><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.1s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"/></svg></span>
            //         <span class="thumbs_up_number">\${article.likeCnt}</span>
            //       </div>
            //     </div>
            //     <div class="q_content">
            //       <p>\${article.postContent}</p>
            //       <ul class="hashtagList">
            //       </ul>
            //     </div>
            //   </article>`
            // let templateDom = $(template)

            // 북마크 상태 가져오기
            // user_email = `${sessionScope._LOGIN_USER_.email}`

            // $.get(`/bookmark/status/\${user_email}/\${article.generalPostId}`, function(response) {
            //   if (response.bookmarkYn === 'Y') {
            //     templateDom.find('.bookmarkBtn').find('svg').css('fill', 'var(--blue)').addClass('bookmark_on')
            //     templateDom.find('.bookmarkBtn').prepend(`<input type="hidden" class="bookmarkId" value="\${response.bookmarkId}"/>`)
            //   }
            // })
            

            // 게시글 유형이 자유 유형이면 대문짝만한 Q 삭제
        //     if(article.boardId === 'CC-20231017-000029') {
        //       templateDom.find('.big_letter').text('').css('margin-right', '0px')
        //     }
            
        //     // 해시태그 표시할 AJAX 호출
        //     $.get(`/home/hashtag/\${article.generalPostId}`, function(response_of_hashtag) {
        //       if (response_of_hashtag.length > 0) {
        //         for (let j = 0; j < response_of_hashtag.length; j++) {
        //           templateDom.find('.hashtagList').append(`<li>\${response_of_hashtag[j].commonCodeVO.codeContent}</li>`)
        //         }
        //       }
        //     })
        //     $('.body_left').append(templateDom)

        //   }
          
        //   skip += 10
        // }



        // $(window).scroll(function() {
        //   if ($(window).scrollTop() + $(window).height() >= $('body').height() - 200 && !loading) {
        //     if (skip < all_count) {
        //       for (let i = skip; i < skip + 10; i++) {
        //         if (i < all_count) {
        //           article = articles[i]

        //           if (article.boardId === 'CC-20231017-000030') {
        //             boardType = 'qnaboard'
        //           }
        //           else {
        //             boardType = 'freeboard'
        //           }

        //           for (let j = 0; j < comments.length; j++) {
        //             if (comments[j].generalPostId === article.generalPostId) {
        //               comment_cnt = comments[j].commentCnt
        //             }
        //           }
                  
        //           for (let j = 0; j < nicknameList.length; j++) {
        //             if (nicknameList[j].generalPostId === article.generalPostId) {
        //               nickname = nicknameList[j].nickname
        //               email = nicknameList[j].email
        //             }
        //           }

        //           template = `
        //             <article class="content_container">
        //               <div class="writer_info_area">
        //                 <div class="flex_left">
        //                   <img class="incomplete" src="/images/꼬부기.png" alt="꼬부기" />
        //                   <div>
        //                     <div class="writer_name incomplete"><a href="/memberinfo/view/\${email}">\${nickname}</a><span class="follow_btn">follow</span></div>
        //                     <div class="posting_date">\${article.postDate}</div>
        //                   </div>
        //                 </div>
        //                 <div class="flex_right">
        //                   <div class="utility">
        //                     <button class="bookmarkBtn">
        //                       <input type="hidden" class="postId" value="\${article.generalPostId}"/>
        //                       <input type="hidden" class="boardId" value="\${article.boardId}" />
        //                       <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:(--blue)}</style><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg></button>
        //                     <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 128 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M64 360a56 56 0 1 0 0 112 56 56 0 1 0 0-112zm0-160a56 56 0 1 0 0 112 56 56 0 1 0 0-112zM120 96A56 56 0 1 0 8 96a56 56 0 1 0 112 0z"/></svg>
        //                   </div>
        //                 </div>
        //               </div>
        //               <div class="q_title">
        //                 <span class="big_letter">Q</span>
        //                 <div>
        //                   <a href="/\${boardType}/view/\${article.generalPostId}" target="_blank"">
        //                     <span class="title">\${article.postTitle}</span>
        //                   </a>
        //                   <span class="comment_number">[\${comment_cnt}]</span>
        //                   <span><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.1s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"/></svg></span>
        //                   <span class="thumbs_up_number">\${article.likeCnt}</span>
        //                 </div>
        //               </div>
        //               <div class="q_content">
        //                 <p>\${article.postContent}</p>
        //                 <ul class="hashtagList">
        //                 </ul>
        //               </div>
        //             </article>`

        //             let templateDom = $(template);

                    // 북마크 상태 가져오기
                    // user_email = `${sessionScope._LOGIN_USER_.email}`

                    // $.get(`/bookmark/status/\${user_email}/\${article.generalPostId}`, function(response) {
                    //   if (response.bookmarkYn === 'Y') {
                    //     templateDom.find('.bookmarkBtn').find('svg').css('fill', 'var(--blue)').addClass('bookmark_on')
                    //     templateDom.find('.bookmarkBtn').prepend(`<input type="hidden" class="bookmarkId" value="\${response.bookmarkId}"/>`)
                    //   }
                    // })

                    // 게시글 유형이 자유 유형이면 대문짝만한 Q 삭제
                    // if(article.boardId === 'CC-20231017-000029') {
                    //   templateDom.find('.big_letter').text('').css('margin-right', '0px')
                    // }

                    // 해시태그 표시용 AJAX 호출
    //                 $.get(`/home/hashtag/\${article.generalPostId}`, function(response_of_hashtag) {
    //                   if (response_of_hashtag.length > 0) {
    //                     for (let j = 0; j < response_of_hashtag.length; j++) {
    //                       templateDom.find('.hashtagList').append(`<li>\${response_of_hashtag[j].commonCodeVO.codeContent}</li>`)
    //                     }
    //                   }
    //                   $('.body_left').append(templateDom)
    //               })
    //             }
    //           }
    //           skip += 10
    //         }
    //       }
    //     })

    //     // 북마크 토글
    //     $(document).on('click', '.bookmarkBtn', function(e) {
    //       let body = {
    //       "email": `${sessionScope._LOGIN_USER_.email}`,
    //       "postId": $(this).find(".postId").val(),
    //       "boardId": $(this).find(".boardId").val(),
    //       "bookmarkId": $(e.currentTarget).find('.bookmarkId').val()
    //       }
    //       console.log(body.email)
    //       console.log(body.postId)
    //       console.log(body.boardId)
    //       console.log(body.bookmarkId)
    //       console.log(e.currentTarget)
    //       if ($(e.currentTarget).find('svg').hasClass('bookmark_on')) {
    //         $.post('/unbookmark', body, function(result) {
    //           alert('북마크가 취소되었습니다.!')
    //           $(e.currentTarget).find('svg').removeClass('bookmark_on')
    //           $(e.currentTarget).find('svg').css('fill', 'var(--gray)')
    //           $('.bookmarkId').remove()
    //         })
    //       }
    //       else {
    //         $.post('/bookmark/general-post', body, function(result) {
    //           if (result) {
    //             alert('북마크에 추가되었습니다.')
    //             $(e.currentTarget).find('svg').css('fill', 'var(--blue)')
    //             $(e.currentTarget).find('svg').addClass('bookmark_on')
    //             $('.bookmarkBtn').prepend(`<input type="hidden" class="bookmarkId" value="\${result.bookmarkId}"/>`)
    //           }
    //           else {
    //             alert('처리하지 못했습니다.')
    //           }
    //         })
    //       }
    //     })
    //   })
    // }
    // loadContents()

    // 랭킹 컨텐츠

    // 월요일마다 갱신함
    // const today = new Date()
    // const currentDay = today.getDay() // (0: 일요일, 1:월요일)
    // const targetDay = 0
    // const daysAfterTargetDay = currentDay - targetDay

    // const prevMonday = new Date(today)
    // prevMonday.setDate(today.getDate() - daysAfterTargetDay + 1)
    
    // const year = prevMonday.getFullYear()
    // const month = String(prevMonday.getMonth() + 1).padStart(2, '0')
    // const day = String(prevMonday.getDate()).padStart(2, '0')

    // const formattedMonday = year + '-' + month + '-' + day

    // $.get('/home/ranking/\${formattedMonday}', function(response) {
    //   let list = response.rankings
    //   for (let i = 0; i < 10; i++) {

    //     if (list[i].boardId === 'CC-20231017-000029') {
    //       let ranking_template = `
    //         <li class="hot_post">
    //         <a href="/freeboard/view/\${list[i].generalPostId}" target="_blank"">\${list[i].postTitle}</a>
    //         </li>`
    //       let ranking_templateDom = $(ranking_template)
  
    //       $('.ranking_list').append(ranking_templateDom)
    //     }
    //     else {
    //       let ranking_template = `
    //         <li class="hot_post">
    //         <a href="/qnaboard/view/\${list[i].generalPostId}" target="_blank" >\${list[i].postTitle}</a>
    //         </li>`
    //       let ranking_templateDom = $(ranking_template)
  
    //       $('.ranking_list').append(ranking_templateDom)
    //     }
    //   }
    // })

    // 랭킹 박스 아래에 해시태그 가져오기
//     $.get('/code/해시태그', function(response) {
//       for (let i = 0; i < response.length; i++) {
//         let hash_template = `<button class="hashtag incomplete">#\${response[i].codeContent}</button>`
//         $('.hashtag_wrap').append(hash_template)
//       }
//     })
//   })

</script>
</html>