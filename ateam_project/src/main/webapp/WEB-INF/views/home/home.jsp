<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- 작성자: 김태현
     작성일자: 2023-10-20
     내용: 메인 페이지 -->


<jsp:include page="../layout/header.jsp" />
<c:choose>
  <c:when test="${sessionScope._LOGIN_USER_.memberType eq 'ADMIN'}">
    <jsp:include page="./admin_ui.jsp" />
  </c:when>
</c:choose>

<style>
  /* 메인 컨텐츠 영역 */
	.body_container {
		width: 1140px;
		padding: 30px;
		margin: 0 auto;
	}

	.body_container .body {
		display: flex;
		justify-content: space-between;
	}

	/* 왼쪽 */
	.body_container .body .body_left {
		width: 800px;
		margin-right: 30px;
	}

	.body_left .home_edit_container {
		display: flex;
		padding: 20px;
		cursor: pointer;
		margin-bottom: 20px;
	}

	/* 글쓰기 영역 */
	.body_left .home_edit_container .text_area {
		position: sticky;
		top: 100px;
		z-index: 10;
		width: 670px;
		height: 80px;
		border: 1px solid var(--gray);
		border-radius: 5px;
		margin-right: 10px;
	}

	.body_left .home_edit_container .edit_btn {
		width: 80px;
		height: 80px;
		border: 1px solid;
		display: flex;
		justify-content: center;
		align-items: center;
		border: 1px solid var(--gray);
		border-radius: 5px;
		font-size: var(--font-x-big);
	}

	.body_left .home_edit_container .edit_btn svg {
		fill: var(--dark-gray);
	}

	/* 게시글 영역 */
	.body_left .content_container {
		width: 100%;
		border: 1px solid var(--light-gray);
		margin: 45px 0;
		border-radius: 10px;
		padding: 24px 36px;
	}

  .body_left .content_container:hover {
    box-shadow: 0 0 8px var(--gray);
  }

	.body_left .content_container .writer_info_area {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-bottom: 10px;
		border-bottom: 1px solid var(--gray);
	}

	.body_left .content_container .writer_info_area .flex_left {
		display: flex;
		align-items: center;
	}

	.body_left .content_container .writer_info_area .flex_left img {
		width: 36px;
		height: 36px;
		background-color: var(--light-gray);
		margin-right: 10px;
		border-radius: 50%;
	}

	.body_left .content_container .writer_info_area .flex_left .writer_name {
		font-size: var(--font-medium);
	}

	.body_left .content_container .writer_info_area .flex_left .writer_name .follow_btn {
		border: 1px solid var(--light-gray);
		border-radius: 10px;
		margin-left: 20px;
		padding: 0 3px;
		font-size: var(--font-x-small);
		color: var(--blue);
		cursor: pointer;
	}

	.body_left .content_container .writer_info_area .flex_left .posting_date {
		font-size: var(--font-small);
		color: #ccc;
	}

	.body_left .content_container .writer_info_area .flex_right .utility {
		display: flex;
		align-items: center;
	}

	.body_left .content_container .writer_info_area .flex_right .utility > button {
		width: 24px;
		height: 24px;
		background-color: transparent;
		border: none;
		margin-right: 10px;
	}

	.body_left .content_container .writer_info_area .flex_right .utility > button > svg {
		width: 20px;
		height: 20px;
		cursor: pointer;
		fill: var(--gray);
	}

  .body_left .content_container .writer_info_area .flex_right .utility > button > svg:hover {
    fill: var(--hashtag-blue);
  }

	.body_left .content_container .writer_info_area .flex_right .utility > svg {
		width: 24px;
		height: 24px;
		padding: 2px;
		fill: var(--dark);
		border: 1px solid var(--gray);
		border-radius: 50%;
		cursor: pointer;
	}
  
  .body_left .content_container {
    cursor: default;
  }

	.body_left .content_container .q_title {
		display: flex;
		align-items: flex-end;
		margin: 7px 0;
	}

	.body_left .content_container .q_title > .big_letter {
		font-size: var(--font-x-big);
		font-weight: bold;
		margin-right: 8px;
		color: var(--deep-blue);
	}

	.body_left .content_container .q_title > div {
		display: flex;
		align-items: center;
	}

	.body_left .content_container .q_title > div .title {
		font-size: var(--big);
		margin-right: 10px;
		color: var(--deep-dark);
	}

	.body_left .content_container .q_title > div .comment_number {
		font-size: var(--font-medium);
		margin-right: 10px;
		color: var(--red);
	}

	.body_left .content_container .q_title > div svg {
		font-size: var(--font-medium);
		fill: var(--blue);
	}

	.body_left .content_container .q_title  .thumbs_up_number {
		font-size: var(--font-medium);
		margin-left: 7px;
	}

	.body_left .content_container .q_content {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
    display: -webkit-box;
		-webkit-box-orient: vertical;
		overflow: hidden;
		-webkit-line-clamp: 3;
	}

	.body_left .content_container .q_content p {
		margin-bottom: 20px;
		font-size: var(--font-small);
		color: var(--dark);

	}

	.body_left .content_container .q_content ul {
		display: flex;
    flex-wrap: wrap;
	}

	.body_left .content_container .q_content li {
		padding: 3px 10px;
		margin-right: 20px;
    margin-bottom: 10px;
		border-radius: 50px;
		background-color: var(--hashtag-blue);
		color: var(--blue);
		font-size: var(--font-x-small);
    cursor: default;
	}


	/* 오른쪽 */
	.body_container .body .body_right {
		width: 250px;
	}

  .body_right .ranking_wrap {
    display: flex;
    flex-direction: column;
    align-items: center;
    border: 1px solid var(--gray);
    border-radius: 10px;
    margin-top: 20px;
  }

  .body_right .ranking_wrap h2 {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px 0;
    border-bottom: 2px solid var(--gray);
    width: 100%;
  }

  .body_right .ranking_wrap ul {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 700px;
    margin-bottom: 20px;
  }

  .body_right .ranking_wrap ul .hot_post {
    flex: 1;
    font-size: var(--font-medium);
    width: 100%;
    border-bottom: 1px solid var(--light-gray);
    transition: all 0.1s;
    color: var(--dark);
    cursor: pointer;
  }

  .body_right .ranking_wrap ul .hot_post:hover {
    background-color: var(--hashtag-blue);
  }

  .body_right .ranking_wrap ul .hot_post a {
    width: 250px;
    height: 100%;
    font-size: var(--font-small);
    color: var(--dark);
    display: block;
    padding: 0 20px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    line-height: 70px;
  }

  .body_right .hashtag_wrap {
    display: flex;
    width: 250px;
    flex-wrap: wrap;
    margin-top: 30px;
    border: 1px solid var(--gray);
    border-radius: 10px;
    padding: 10px;
  }

  .body_right .hashtag_wrap .hashtag {
    background-color: var(--gray);
    color: var(--dark-gray);
    margin: 5px;
    padding: 3px 8px;
    border-radius: 20px;
    border: none;
    font-size: var(--font-x-small);
    text-align: center;
  }

  .body_right .hashtag_wrap .hashtag:hover {
    box-shadow: 0 0 2px var(--dark-gray);
    cursor: pointer;
  }
</style>

  <!-- 메인 컨텐츠 영역 -->
  <section class="body_container">
    <div class="body">
      <div class="body_left">
        <div class="home_edit_container incomplete">
          <div class="text_area"></div>
          <div class="edit_btn">
            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><path d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"/></svg>
          </div>
        </div>
      </div>
      <div class="body_right">
        <div class="ranking_wrap">
          <h2>주간랭킹</h2>
          <ul class="ranking_list">
          </ul>
        </div>
        <div class="hashtag_wrap">
        </div>
      </div>
    </div>
  </section>

  <jsp:include page="../layout/footer.jsp" />
</body>

<script>
  // 미완성된 기능을 알려주는 모달창
  // $('.incomplete').click(function() {
  //   $('.modal, .overlay').addClass('modal_active')
  // })
  // $('.overlay').click(function() {
  //   $('.modal, .overlay').removeClass('modal_active')
  // })
  
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
  $().ready(function() {
    let skip = 0
    let all_count
    let loading = false
    let article, articles
    let boardType
    let hashtags = []
    let hashtag_template
    let template
    let comments
    let comment_cnt
    let nicknameList
    let nickname
    let email

    // 댓글 개수 가져오기
    $.get('/home/maincontent/commentcnt', function(response_of_comment) {
      comments = response_of_comment
    })

    // 닉네임 리스트 가져오기
    $.get('/home/maincontent/nickname', function(response_of_nicknames) {
      nicknameList = response_of_nicknames
    })
    
    const loadContents = function() {
      $.get('/home/maincontent', function(response) {
        articles = response
        console.log(skip, articles)
        all_count = response.length
        if (skip === 0) {
          for (let i = skip; i < skip + 10; i++) {
            article = articles[i]

            // 게시판의 타입 결정
            if (article.boardId.slice(-2) === '30') {
              boardType = 'qnaboard'
            }
            else {
              boardType = 'freeboard'
            }

            for (let j = 0; j < comments.length; j++) {
              if (comments[j].generalPostId === article.generalPostId) {
                comment_cnt = comments[j].commentCnt
              }
            }
            
            for (let j = 0; j < nicknameList.length; j++) {
              if (nicknameList[j].generalPostId === article.generalPostId) {
                nickname = nicknameList[j].nickname
                email = nicknameList[j].email
              }
            }

            template = `
              <article class="content_container">
                <div class="writer_info_area">
                  <div class="flex_left">
                    <img src="/images/꼬부기.png" alt="꼬부기" />
                    <div>
                      <div class="writer_name">
                        <a href="/memberinfo/view/\${email}">\${nickname}</a>
                        <button class="follow_btn">follow
                          <input type="hidden" class="followerEmail" value="${sessionScope._LOGIN_USER_.email}" />
                          <input type="hidden" class="followeeEmail" value="\${email}" />
                        </button>
                      </div>
                      <div class="posting_date">\${article.postDate}</div>
                    </div>
                  </div>
                  <div class="flex_right">
                    <div class="utility">
                      <button class="bookmarkBtn">
                        <input type="hidden" class="postId" value="\${article.generalPostId}"/>
                        <input type="hidden" class="boardId" value="\${article.boardId}" />
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:(--blue)}</style><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg></button>
                      <svg class="incomplete" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 128 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M64 360a56 56 0 1 0 0 112 56 56 0 1 0 0-112zm0-160a56 56 0 1 0 0 112 56 56 0 1 0 0-112zM120 96A56 56 0 1 0 8 96a56 56 0 1 0 112 0z"/></svg>
                    </div>
                  </div>
                </div>
                <div class="q_title">
                  <span class="big_letter">Q</span>
                  <div>  
                    <a href="/\${boardType}/view/\${article.generalPostId}" target="_blank">
                      <span class="title">\${article.postTitle}</span>
                    </a>
                    <span class="comment_number">[\${comment_cnt}]</span>
                    <span><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.1s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"/></svg></span>
                    <span class="thumbs_up_number">\${article.likeCnt}</span>
                  </div>
                </div>
                <div class="q_content">
                  <p>\${article.postContent}</p>
                  <ul class="hashtagList">
                  </ul>
                </div>
              </article>`
            let templateDom = $(template)

            // 북마크 상태 가져오기
            user_email = `${sessionScope._LOGIN_USER_.email}`

            $.get(`/bookmark/status/\${user_email}/\${article.generalPostId}`, function(response) {
              if (response.bookmarkYn === 'Y') {
                templateDom.find('.bookmarkBtn').find('svg').css('fill', 'var(--blue)').addClass('bookmark_on')
                templateDom.find('.bookmarkBtn').prepend(`<input type="hidden" class="bookmarkId" value="\${response.bookmarkId}"/>`)
              }
            })
            
//             let followee_email = $('.follow_btn').val()
            // 팔로우 상태 가져오기
            $.get(`/follow/status/\${user_email}/\${article.postWriter}`, function(state) {
            	if(state.followYn === 'Y') {
            	templateDom.find('.follow_btn').css({'background-color':'var(--blue)', 'color':'var(--white)'}).addClass('follow_on')
            	templateDom.find('.follow_btn').prepend($(`<input type="hidden" class="followId" value="\${state.followId}"/>`))
            	}
            })
            

            // 게시글 유형이 자유 유형이면 대문짝만한 Q 삭제
            if(article.boardId === 'CC-20231017-000029') {
              templateDom.find('.big_letter').text('').css('margin-right', '0px')
            }
            
            // 해시태그 표시할 AJAX 호출
            $.get(`/home/hashtag/\${article.generalPostId}`, function(response_of_hashtag) {
              if (response_of_hashtag.length > 0) {
                for (let j = 0; j < response_of_hashtag.length; j++) {
                  templateDom.find('.hashtagList').append(`<li>\${response_of_hashtag[j].commonCodeVO.codeContent}</li>`)
                }
              }
            })
            $('.body_left').append(templateDom)

          }
          
          skip += 10
        }



        $(window).scroll(function() {
          if ($(window).scrollTop() + $(window).height() >= $('body').height() - 200 && !loading) {
            if (skip < all_count) {
              for (let i = skip; i < skip + 10; i++) {
                if (i < all_count) {
                  article = articles[i]

                  if (article.boardId === 'CC-20231017-000030') {
                    boardType = 'qnaboard'
                  }
                  else {
                    boardType = 'freeboard'
                  }

                  for (let j = 0; j < comments.length; j++) {
                    if (comments[j].generalPostId === article.generalPostId) {
                      comment_cnt = comments[j].commentCnt
                    }
                  }
                  
                  for (let j = 0; j < nicknameList.length; j++) {
                    if (nicknameList[j].generalPostId === article.generalPostId) {
                      nickname = nicknameList[j].nickname
                      email = nicknameList[j].email
                    }
                  }

                  template = `
                    <article class="content_container">
                      <div class="writer_info_area">
                        <div class="flex_left">
                          <img class="incomplete" src="/images/꼬부기.png" alt="꼬부기" />
                          <div>
                            <div class="writer_name incomplete">
                            	<a href="/memberinfo/view/\${email}">\${nickname}</a>
                            	<button class="follow_btn">follow
                            	  <input type="hidden" class="followerEmail" value="${sessionScope._LOGIN_USER_.email}" />
                            	  <input type="hidden" class="followeeEmail" value="\${email}" />
                            	</button>
                            </div>
                            <div class="posting_date">\${article.postDate}</div>
                          </div>
                        </div>
                        <div class="flex_right">
                          <div class="utility">
                            <button class="bookmarkBtn">
                              <input type="hidden" class="postId" value="\${article.generalPostId}"/>
                              <input type="hidden" class="boardId" value="\${article.boardId}" />
                              <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:(--blue)}</style><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg></button>
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 128 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M64 360a56 56 0 1 0 0 112 56 56 0 1 0 0-112zm0-160a56 56 0 1 0 0 112 56 56 0 1 0 0-112zM120 96A56 56 0 1 0 8 96a56 56 0 1 0 112 0z"/></svg>
                          </div>
                        </div>
                      </div>
                      <div class="q_title">
                        <span class="big_letter">Q</span>
                        <div>
                          <a href="/\${boardType}/view/\${article.generalPostId}" target="_blank"">
                            <span class="title">\${article.postTitle}</span>
                          </a>
                          <span class="comment_number">[\${comment_cnt}]</span>
                          <span><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.1s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"/></svg></span>
                          <span class="thumbs_up_number">\${article.likeCnt}</span>
                        </div>
                      </div>
                      <div class="q_content">
                        <p>\${article.postContent}</p>
                        <ul class="hashtagList">
                        </ul>
                      </div>
                    </article>`

                    let templateDom = $(template);

                    // 북마크 상태 가져오기
                    user_email = `${sessionScope._LOGIN_USER_.email}`

                    $.get(`/bookmark/status/\${user_email}/\${article.generalPostId}`, function(response) {
                      if (response.bookmarkYn === 'Y') {
                        templateDom.find('.bookmarkBtn').find('svg').css('fill', 'var(--blue)').addClass('bookmark_on')
                        templateDom.find('.bookmarkBtn').prepend(`<input type="hidden" class="bookmarkId" value="\${response.bookmarkId}"/>`)
                      }
                    })

                   // 팔로우 상태 가져오기
                   $.get(`/follow/status/\${user_email}/\${email}`, function(state) {
                	   console.log(state)
                     if(state.followYn === 'Y') {
                       templateDom.find('.follow_btn').css({'background-color':'var(--blue)', 'color':'var(--white)'}).addClass('follow_on')
                       templateDom.find('.follow_btn').prepend($(`<input type="hidden" class="followId" value="\${state.followId}"/>`))
                     }
                   })
                    
                    // 게시글 유형이 자유 유형이면 대문짝만한 Q 삭제
                    if(article.boardId === 'CC-20231017-000029') {
                      templateDom.find('.big_letter').text('').css('margin-right', '0px')
                    }

                    // 해시태그 표시용 AJAX 호출
                    $.get(`/home/hashtag/\${article.generalPostId}`, function(response_of_hashtag) {
                      if (response_of_hashtag.length > 0) {
                        for (let j = 0; j < response_of_hashtag.length; j++) {
                          templateDom.find('.hashtagList').append(`<li>\${response_of_hashtag[j].commonCodeVO.codeContent}</li>`)
                        }
                      }
                      $('.body_left').append(templateDom)
                  })
                }
              }
              skip += 10
            }
          }
        })

        // 북마크 토글
        $(document).on('click', '.bookmarkBtn', function(e) {
       	  let userEmail = `${sessionScope._LOGIN_USER_}`
            if (userEmail === '') {
              if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?') ) {
                window.location.href="/member/auth"
              }
            }
            else {
            	
          let body = {
          "email": `${sessionScope._LOGIN_USER_.email}`,
          "postId": $(this).find(".postId").val(),
          "boardId": $(this).find(".boardId").val(),
          "bookmarkId": $(e.currentTarget).find('.bookmarkId').val()
          }
          console.log(body.email)
          console.log(body.postId)
          console.log(body.boardId)
          console.log(body.bookmarkId)
          console.log(e.currentTarget)
          if ($(e.currentTarget).find('svg').hasClass('bookmark_on')) {
            $.post('/unbookmark', body, function(result) {
              alert('북마크가 취소되었습니다.')
              $(e.currentTarget).find('svg').removeClass('bookmark_on')
              $(e.currentTarget).find('svg').css('fill', 'var(--gray)')
              $('.bookmarkId').remove()
            })
          }
          else {
            $.post('/bookmark/general-post', body, function(result) {
              if (result) {
                alert('북마크에 추가되었습니다.')
                $(e.currentTarget).find('svg').css('fill', 'var(--blue)')
                $(e.currentTarget).find('svg').addClass('bookmark_on')
                $('.bookmarkBtn').prepend(`<input type="hidden" class="bookmarkId" value="\${result.bookmarkId}"/>`)
              }
              else {
                alert('처리하지 못했습니다.')
              }
            })
            }
        	
          }
        })
        // 팔로우 토글
        $(document).on('click', '.follow_btn', function(e) {
        	let userEmail = `${sessionScope._LOGIN_USER_}`
        	if (userEmail === '') {
        		if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?') ) {
        			window.location.href="/member/auth"
        		}
        	}
        	else {
	       	  let content = {
	            "follower": `${sessionScope._LOGIN_USER_.email}`,
	            "followee": $(this).find(".followeeEmail").val(),
	            "followId": $(e.currentTarget).find('.followId').val()
	       	  }
	       	  console.log(content.follower)
	       	  console.log(content.followee)
	       	  console.log(content.followId)
	       	  console.log(e.currentTarget)
	       	  if ($(e.currentTarget).hasClass('follow_on')) {
	            $.post('/unfollow/member', content, function(result) {
	              $(e.currentTarget).removeClass('follow_on')
	              $(e.currentTarget).css({'background-color':'var(--gray)', 'color':'var(--blue)'})
	              $('.followId').remove()
	            })
	       	  }
	       	  else {
	            $.post('/follow/member', content, function(result) {
	              console.log(result)
	              if(result) {
	                $(e.currentTarget).css({'background-color':'var(--blue)', 'color':'var(--white)'})
	                $(e.currentTarget).addClass('follow_on')
	                $('.follow_btn').prepend(`<input type="hidden" class="followId" value="\${result.followId}"/>`)
	              }
	              else {
	                alert('처리하지 못했습니다.')
	              }
	            })
	       	  }
        	}
        })
      })
    }
    loadContents()

    // 랭킹 컨텐츠

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

    $.get('/home/ranking/\${formattedMonday}', function(response) {
      let list = response.rankings
      for (let i = 0; i < 10; i++) {

        if (list[i].boardId === 'CC-20231017-000029') {
          let ranking_template = `
            <li class="hot_post">
            <a href="/freeboard/view/\${list[i].generalPostId}" target="_blank"">\${list[i].postTitle}</a>
            </li>`
          let ranking_templateDom = $(ranking_template)
  
          $('.ranking_list').append(ranking_templateDom)
        }
        else {
          let ranking_template = `
            <li class="hot_post">
            <a href="/qnaboard/view/\${list[i].generalPostId}" target="_blank" >\${list[i].postTitle}</a>
            </li>`
          let ranking_templateDom = $(ranking_template)
  
          $('.ranking_list').append(ranking_templateDom)
        }
      }
    })

    // 랭킹 박스 아래에 해시태그 가져오기
    $.get('/code/해시태그', function(response) {
      for (let i = 0; i < response.length; i++) {
        let hash_template = `<button class="hashtag incomplete">#\${response[i].codeContent}</button>`
        $('.hashtag_wrap').append(hash_template)
      }
    })
  })
</script>
</html>