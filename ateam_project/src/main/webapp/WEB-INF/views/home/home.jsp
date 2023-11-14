<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- 작성자: 김태현
     작성일자: 2023-10-20
     내용: 메인 페이지 -->


<jsp:include page="../layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<c:choose>
  <c:when test="${sessionScope._LOGIN_USER_.memberType eq 'ADMIN'}">
    <jsp:include page="./admin_ui.jsp" />
  </c:when>
</c:choose>

<style>
  .ml10 {
    margin-left: 10px;
  }
  .admin_container {
    position: fixed;
    top: 170px;
    left: 50px;
    z-index: 1;
  }

  	/* 글쓰기 영역 */
	.home_edit_container {
		position: sticky;
    top: -10px;
    width: 100%;
    min-width: 1080px;
		padding: 20px 30px 10px 30px;
    background-color: var(--white);
	}

  .home_edit_container .home_edit_wrap {
    width: 1080px;
    margin: 0 auto;
		cursor: pointer;
  }

	.home_edit_container .text_area {
		width: 990px;
		height: 80px;
		border: 1px solid var(--gray);
		border-radius: 5px;
		margin-right: 10px;
    padding: 10px;
    color: var(--gray);
	}

	.home_edit_container .edit_btn {
		width: 80px;
		height: 80px;
		border: 1px solid;
		display: flex;
		justify-content: center;
		align-items: center;
		border: 1px solid var(--gray);
		border-radius: 5px;
	}

	.home_edit_container .edit_btn svg {
		fill: var(--dark-gray);
	}
  
  /* 메인 컨텐츠 영역 */
	.body_container {
		padding: 10px 30px 30px;
	}

	.body_container .body {
		display: flex;
	}

	/* 왼쪽 */
	.body_container .body .body_left {
		width: 800px;
		margin-right: 10px;
	}

	/* 게시글 영역 */
	.body_left .content_container {
		width: 100%;
		border: 1px solid var(--light-gray);
		margin-bottom: 10px;
		border-radius: 10px;
		padding: 12px 18px;
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
		color: var(--blue);
		cursor: pointer;
	}

	.body_left .content_container .writer_info_area .flex_left .posting_date {
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
		font-weight: bold;
		margin-right: 8px;
		color: var(--deep-blue);
	}

	.body_left .content_container .q_title > div {
		display: flex;
		align-items: center;
	}

	.body_left .content_container .q_title > div .title {
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
    margin-bottom: 5px;
    min-height: 38px;
	}

	.body_left .content_container .q_content p {
		color: var(--dark);
	}

  .body_left .content_container .q_content img {
    max-width: 300px !important;
	}

	.body_left .content_container .q_content .hashtagList {
		display: flex;
    flex-wrap: wrap;
    margin: 10px 0 0;
	}

	.body_left .content_container .q_content .hashtag_each {
		padding: 3px 10px;
		margin-right: 20px;
    margin-bottom: 10px;
		border-radius: 50px;
		background-color: var(--hashtag-blue);
		color: var(--blue);
    cursor: default;
	}


	/* 오른쪽 */
	.body_container .body .body_right {
		width: 270px;
	}

  .body_right .ranking_wrap {
    display: flex;
    flex-direction: column;
    border: 1px solid var(--light-gray);
    border-radius: 10px;
  }

  .body_right .ranking_wrap h2 {
    display: flex;
    justify-content: center;
    padding: 10px 0;
    border-bottom: 1px solid var(--gray);
    width: 100%;
  }

  .body_right .ranking_wrap ul {
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 100%;
    margin-bottom: 20px;
  }

  .body_right .ranking_wrap ul .hot_post {
    flex: 1;
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
    width: 270px;
    color: var(--dark);
    display: block;
    padding: 15px 20px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .body_right .hashtag_wrap {
    display: flex;
    width: 270px;
    flex-wrap: wrap;
    margin-top: 10px;
    border: 1px solid var(--light-gray);
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
  }

  .body_right .hashtag_wrap .hashtag:hover {
    box-shadow: 0 0 2px var(--dark-gray);
    cursor: pointer;
  }

  .recommend_container {
    display: flex;
    flex-direction: column;
    border: 1px solid var(--light-gray);
    border-radius: 10px;
    margin: 10px;
  }

  .recommend_container:hover, .member_profile:hover {
    box-shadow: 0 0 8px var(--gray);
  }

  .title {
    font-weight: bold;
  }

  .member_info_area {
      grid-template-columns: 1fr 1fr 1fr;
      column-gap: 10px;
      margin: 10px;
  }

  .member_profile {
      display: flex;
      flex-direction: column;
      border: 1px solid var(--light-gray);
      border-radius: 10px;
      margin: 5px;
      padding: 10px;
  }

  .member_profile > button {
      width: 120px;
      color: var(--blue);
      background-color: var(--light-gray);
  }

  .member_profile > img {
    width: 50px;
    height: 50px;
  }

  .rand_notice_container {
    visibility: hidden;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -80%);
    z-index: 10;
    box-shadow: 0 0 10px #19191948;
    border: 1px solid;
    width: 500px;
    padding: 30px;
    opacity: 0;
    border: none;
    border-radius: 5px;
    background-color: #ffffff;
    transition: 0.5s;
  }

  .rand_notice_container.active {
    visibility: visible;
    opacity: 1;
    transform: translate(-50%, -50%);
  }

  .create_container > * {
			margin-bottom: 10px;
	}

  .post_title_label,
	.post_content_label {
		color: gray;
		display: block;
		margin-bottom: 10px;
	}

  .rand_notice_close_btn {
    position: absolute;
    top: 6px;
    right: 10px;
    background-color: transparent;
    color: #888;
    cursor: pointer;
	}

  .rand_notice_close_btn {
    color: #191919;
  }

  .title_area,
  .content_area {
    margin-bottom: 15px;
  }

  .post_title_label + div {
    font-weight: bold;
  }

  .rand_notice_overlay {
		background-color: #47474754;
		position: fixed;
		width: 100%;
		height: 100vh;
		top: 0;
		left: 0;
		transition: 0.5s;
		opacity: 0;
		pointer-events: none;
    z-index: 2;
	}

	.rand_notice_overlay.active {
			opacity: 1;
			pointer-events: all;
	}

  .editor_wrap {
    visibility: hidden;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -80%);
    z-index: 10;
    box-shadow: 0 0 10px #19191948;
    border: 1px solid;
    width: 1000px;
    padding: 30px;
    opacity: 0;
    border: none;
    border-radius: 5px;
    background-color: #ffffff;
    transition: 0.5s;
  }

  .editor_wrap.active {
    visibility: visible;
    opacity: 1;
    transform: translate(-50%, -50%);
  }

  .editor_overlay {
		background-color: #47474754;
		position: fixed;
		width: 100%;
		height: 100vh;
		top: 0;
		left: 0;
		transition: 0.5s;
		opacity: 0;
		pointer-events: none;
  }

  .editor_overlay.active {
    opacity: 1;
    pointer-events: all;
  }

  .editor_close_btn {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: transparent;
    border: none;
    color: #888;
    cursor: pointer;
  }

  .editor_head {
    display: flex;
    justify-content: center;
  }

  .editor_head {
    margin-bottom: 15px;
    margin-top: 15px;
  }

  #editor_title {
    margin-left: 10px;
    width: 830px;
    height: 30px;
    outline: none;
    border: 1px solid var(--gray);
    padding: 10px;
  }
  
  .editor_body {
    display: flex;
    align-items: center;
    flex-direction: column;
  }

  .editor_content_label {
    display: block;
    margin-bottom: 10px;
    width: 880px;
  }

  .editor_body .ck.ck-editor {
    width: 875px;
  }

  .ck-rounded-corners .ck.ck-editor__main>.ck-editor__editable, .ck.ck-editor__main>.ck-editor__editable.ck-rounded-corners {
    min-height: 300px;
  }

  .submit_wrap {
    display: flex;
    justify-content: flex-end;
    width: 908px;
    margin-top: 15px;
  }

  .submit_wrap .select_wrap {
    display: flex;
    margin-right: 15px;
  }

  .submit_wrap .select_wrap .free_land_btn,
  .submit_wrap .select_wrap .qna_land_btn {
    padding: 5px 10px;
    background-color: var(--white);
    color: var(--dark);
    border: 1px solid var(--light-blue);
  }

  .submit_wrap .select_wrap .free_land_btn {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top: 1px solid var(--light-blue);
    border-bottom: 1px solid var(--light-blue);
    border-left: 1px solid var(--light-blue);
    border-right: 0;
  }

  .submit_wrap .select_wrap .qna_land_btn {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    border-top: 1px solid var(--light-blue);
    border-bottom: 1px solid var(--light-blue);
    border-right: 1px solid var(--light-blue);
    border-left: 0;
  }

  .submit_wrap .select_wrap .free_land_btn.selected,
  .submit_wrap .select_wrap .qna_land_btn.selected {
    background-color: var(--hashtag-blue);
  }

  .submit_wrap .submit_btn {
    padding: 5px 10px;
    background-color: var(--white);
    color: var(--dark);
    border: 1px solid var(--light-blue);
  }

  .submit_wrap .submit_btn:hover {
    background-color: var(--hashtag-blue);
  }

  .submit_wrap .submit_btn:active {
    background-color: var(--light-blue);
  }
</style>

  <!-- 메인 컨텐츠 영역 -->
  <div class="home_edit_container">
    <div class="home_edit_wrap flex">
      <div class="text_area small">자유롭게 글을 작성하세요.</div>
      <div class="edit_btn x-large">
        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><path d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"/></svg>
      </div>
    </div>
  </div>

  <section class="body_container">
    <div class="body">
      <div class="body_left">
      </div>
      <div class="body_right">
        <div class="ranking_wrap">
          <h2 class="align-center">주간랭킹</h2>
          <ul class="ranking_list">
          </ul>
        </div>
        <div class="hashtag_wrap">
        </div>
      </div>
    </div>
  </section>

  <!-- 에디터 생성 -->
  <div class="editor_container">
    <div class="editor_wrap">
      <div class="editor_close_btn large">&times;</div>
      <h1>게시글 작성</h1>
      <div class="editor_head">
        <label for="editor_title">제목</label>
        <input type="text" id="editor_title"></input>
      </div>
      <div class="editor_body">
        <label for="editor_content" class="editor_content_label">내용</label>
        <textarea id="editor_content"></textarea>
      </div>
      <div class="submit_wrap">
        <div class="select_wrap">
          <button class="free_land_btn selected">자유</button>
          <button class="qna_land_btn">질답</button>
        </div>
        <button class="submit_btn">작성</button>  
      </div>
    </div>
    <div class="editor_overlay"></div>
  </div>
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
  $('.home_edit_wrap').mouseenter(function() {
    $('.edit_btn').css('background-color', 'var(--gray)')
  })
  $('.home_edit_wrap').mouseleave(function() {
    $('.edit_btn').css('background-color', '')
  })

  let editorContent

  // 메인 에디터 생성
  $('.home_edit_wrap').click(function() {

    $('.editor_wrap, .editor_overlay').addClass('active')

    $('.editor_close_btn, .editor_overlay').click(function() {
      $('.editor_wrap, .editor_overlay').removeClass('active')
    })

    $('body').keyup(function(e) {
      if(e.key === 'Escape') {
        $('.editor_wrap, .editor_overlay').removeClass('active')
      }
    })
  })

  // 에디터 작성 글 랜딩 장소 선택
  $('.qna_land_btn').click(function() {
    $('.free_land_btn').removeClass('selected')
    $('.qna_land_btn').addClass('selected')
  })
  $('.free_land_btn').click(function() {
    $('.qna_land_btn').removeClass('selected')
    $('.free_land_btn').addClass('selected')
  })

  // 게시글 작성 ajax
  $('.submit_btn').click(function() {
    let userEmail = `${sessionScope._LOGIN_USER_.email}`

    if (userEmail === '') {
      alert('로그인을 먼저 진행해주세요.')
    }
    else {
      let body = {
        'postWriter': `${sessionScope._LOGIN_USER_.email}`,
        'postTitle': $('#editor_title').val(),
        'postContent': getDataFromTheEditor(),
      }

      if ($('.free_land_btn').hasClass('selected')) {
        $.post('/home/create/freeboard', body, function(response) {
          if (response.result === 'success') {
            alert('자유게시글을 성공적으로 등록했습니다.')
            location.reload()
          }
          else {
            alert('등록에 실패했습니다.')
            console.log(body)
          }
        })
      }
      else {
        $.post('/home/create/qnaboard', body, function(response) {
          if (response.result === 'success') {
            alert('질답게시글을 성공적으로 등록했습니다.')
            location.reload()
          }
          else {
            alert('등록에 실패했습니다.')
          }
        })
      }
    }
  })
  // 게시글 클릭 시 단건 조회 창으로 이동

  // 무한 스크롤 컨텐츠
  $().ready(function() {
    let skip = 0
    let all_count
    let loading = false
    let article, articles
    let boardType
    let hashtagArr = []
    let haveHashtag = []
    let template
    let comments
    let comment_cnt
    let nicknameList
    let nickname
    let email
    let members
    let profilePic
    let page = 0
    let innerCounter

    const pokemonUrl = [
      '/images/꼬부기.png',
      '/images/날쌩마.png',
      '/images/딱구리.png',
      '/images/이상해씨.png',
      '/images/파라스.png',
      '/images/파이리.png',
      '/images/피카츄.png',
      '/images/갸라도스.png',
      '/images/고라파덕.png',
      '/images/구구.png',
      '/images/근육몬.png',
      '/images/라플레시아.png',
      '/images/망나뇽.png',
      '/images/버터플.png',
      '/images/썬더.png',
      '/images/파이어.png',
      '/images/프리져.png',
    ]
    
    

    // 댓글 개수 가져오기
    $.get('/home/maincontent/commentcnt', function(response_of_comment) {
      comments = response_of_comment
    })

    // 닉네임 리스트 가져오기
    $.get('/home/maincontent/nickname', function(response_of_nicknames) {
      nicknameList = response_of_nicknames
    })
    
    function loadContents(hashtagArr = []) {
      $('.body_left').empty()

      $.get('/home/maincontent', function(response) {
        articles = response
        all_count = response.length

        if (skip === 0) {
          for (let i = skip; i < skip + 5; i++) {
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

            $.get(`/home/profilepic/\${article.postWriter}`, function(profileResponse) {
              console.log(profilePic = profileResponse.profilePic)
            })

            let randomNumber = Math.floor(Math.random() * pokemonUrl.length)
            let pokemon = pokemonUrl[randomNumber]
            // <img src="/member/file/download/\${email}" alt="\${pokemon}"/>
            template = `
              <article class="content_container">
                <div class="writer_info_area">
                  <div class="flex_left">
                    <img src="\${pokemon}" />
                    <div>
                      <div class="writer_name">
                        <a href="/memberinfo/view/\${email}">\${nickname}</a>
                        <button class="follow_btn small">follow
                          <input type="hidden" class="followerEmail" value="${sessionScope._LOGIN_USER_.email}" />
                          <input type="hidden" class="followeeEmail" value="\${email}" />
                        </button>
                      </div>
                      <div class="posting_date small">\${article.postDate}</div>
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
                  <span class="big_letter x-large">Q</span>
                  <div>  
                    <a href="/\${boardType}/view/\${article.generalPostId}" target="_blank">
                      <span class="title large">\${article.postTitle}</span>
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
            
            // 팔로우 상태 가져오기
            $.get(`/follow/status/\${user_email}/\${article.postWriter}`, function(state) {

            	if(state.followYn === 'Y') {
            	templateDom.find('.follow_btn').css({'background-color':'var(--blue)', 'color':'var(--white)'}).addClass('follow_on')
            	templateDom.find('.follow_btn').prepend($(`<input type="hidden" class="followId" value="\${state.followId}"/>`))
            	}
            })

            if (article.postWriter === user_email) {
              templateDom.find('.follow_btn').css('visibility', 'hidden')
            }
            

            // 게시글 유형이 자유 유형이면 대문짝만한 Q 삭제
            if(article.boardId === 'CC-20231017-000029') {
              templateDom.find('.big_letter').text('').css('margin-right', '0px')
            }
            
            // 해시태그 표시할 AJAX 호출
            $.get(`/home/hashtag/\${article.generalPostId}`, function(response_of_hashtag) {
              if (response_of_hashtag.length > 0) {
                for (let j = 0; j < response_of_hashtag.length; j++) {
                  haveHashtag.push(response_of_hashtag[j].commonCodeVO.codeContent)
                  templateDom.find('.hashtagList').append(`<li class="hashtag_each x-small">\${response_of_hashtag[j].commonCodeVO.codeContent}</li>`)
                }
              }
            })

            // 해시태그 필터링
            if (hashtagArr.length === 0) {
              $('.body_left').append(templateDom)
            }
            else {
              let isExist = false

              for (let i = 0; i < hashtagArr.length; i++) {
                for (let j = 0; j < haveHashtag.length; j++) {
                  if (isExist === false && hashtagArr[i] === haveHashtag[j]) {
                    $('.body_left').append(templateDom)
                    isExist = true

                    break
                  }
                }
              }
            }
            haveHashtag = []
          }          
          skip += 5

          let userEmail = `${sessionScope._LOGIN_USER_}`

          if (userEmail != '') {
            let recommendTemplate = '';

            function loadRecFollower() {
              $.get(`/recommend/follower/\${user_email}`, function(response) {
                let recommendList = response.recommendList;
                const totalMembers = recommendList.length;

                if (totalMembers > 0) {
                  recommendTemplate = `
                    <article class="recommend_container">
                      <div class="title">
                          <h4>알 수도 있는 사람</h4>
                      </div>
                      <div class="member_info_area grid"></div>
                    </article>`
        
                  $('.body_left').append(recommendTemplate)

                  if (page < totalMembers ) {
                    let memberTemplate = '';
                    for(let i = page; i < page + 3; i++) {
                      if(i < totalMembers) {
                        let member = recommendList[i]
                        const profilePic = member.memberVO.profilePic;
                        const nickname = member.memberVO.nickname;
                        const email = member.memberVO.email;
                       
                      memberTemplate += 
                        `<div class="memberList">
                            <div class="member_profile align-center">
                              <div>
                                <img class="profile_pic" src="\${profilePic}" />
                              </div>
                              <div class="nickname">
                                <p>\${nickname}</p>
                              </div>
                              <button class="follow_btn">팔로우
                                <input type="hidden" class="followerEmail" value="${sessionScope._LOGIN_USER_.email}" />
                                <input type="hidden" class="followeeEmail" value="\${email}"/>   
                              </button>
                            </div>
                        </div>`
        
                      // let memberTemplateDom = $(memberTemplate)
  
                      }
                    } 
                    $('.member_info_area').append(memberTemplate)
                    page += 3
                  } 
                }    
              })
            }
            loadRecFollower()
          }
        }

        $(window).scroll(function() {
          if ($(window).scrollTop() + $(window).height() >= $('body').height() - 200 && !loading) {
            if (skip < all_count) {
              for (let i = skip; i < skip + 5; i++) {
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

                  let randomNumber = Math.floor(Math.random() * pokemonUrl.length)
                  let pokemon = pokemonUrl[randomNumber]

                  // <img src="/member/file/download/\${email}" alt="\${pokemon}" />
                  template = `
                    <article class="content_container">
                      <div class="writer_info_area">
                        <div class="flex_left">
                          <img src="\${pokemon}" />
                          <div>
                            <div class="writer_name">
                            	<a href="/memberinfo/view/\${email}">\${nickname}</a>
                            	<button class="follow_btn small">follow
                            	  <input type="hidden" class="followerEmail" value="${sessionScope._LOGIN_USER_.email}" />
                            	  <input type="hidden" class="followeeEmail" value="\${email}" />
                            	</button>
                            </div>
                            <div class="posting_date small">\${article.postDate}</div>
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
                        <span class="big_letter x-large">Q</span>
                        <div>
                          <a href="/\${boardType}/view/\${article.generalPostId}" target="_blank"">
                            <span class="title large">\${article.postTitle}</span>
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
                    if(state.followYn === 'Y') {
                      templateDom.find('.follow_btn').css({'background-color':'var(--blue)', 'color':'var(--white)'}).addClass('follow_on')
                      templateDom.find('.follow_btn').prepend($(`<input type="hidden" class="followId" value="\${state.followId}"/>`))
                    }
                  })

                  if (article.postWriter === user_email) {
                    templateDom.find('.follow_btn').css('visibility', 'hidden')
                  }
                    
                  // 게시글 유형이 자유 유형이면 대문짝만한 Q 삭제
                  if(article.boardId === 'CC-20231017-000029') {
                    templateDom.find('.big_letter').text('').css('margin-right', '0px')
                  }

                  // 해시태그 표시용 AJAX 호출
                  $.get(`/home/hashtag/\${article.generalPostId}`, function(response_of_hashtag) {
                    if (response_of_hashtag.length > 0) {
                      for (let j = 0; j < response_of_hashtag.length; j++) {
                        haveHashtag.push(response_of_hashtag[j].commonCodeVO.codeContent)
                        templateDom.find('.hashtagList').append(`<li class="hashtag_each x-small">\${response_of_hashtag[j].commonCodeVO.codeContent}</li>`)
                      }
                    }
                  })

                  // 해시태그 필터링
                  if (hashtagArr.length === 0) {
                    $('.body_left').append(templateDom)
                  }
                  else {
                    let isExist = false

                    for (let i = 0; i < hashtagArr.length; i++) {
                      for (let j = 0; j < haveHashtag.length; j++) {
                        if (isExist === false && hashtagArr[i] === haveHashtag[j]) {
                          $('.body_left').append(templateDom)
                          isExist = true

                          break
                        }
                      }
                    }
                  }
                  haveHashtag = []
                }
              }

              skip += 5

              let userEmail = `${sessionScope._LOGIN_USER_}`

              if (userEmail != '') {
                let recommendTemplate = '';
                function loadRecFollower() {
                  $.get(`/recommend/follower/\${user_email}`, function(response) {
                    let recommendList = response.recommendList;
                    const totalMembers = recommendList.length;

                    if (totalMembers > 0 && totalMembers >= page) {
                      recommendTemplate = `
                      <article class="recommend_container">
                        <div class="title">
                            <h4>알 수도 있는 사람</h4>
                        </div>
                        <div class="member_info_area2"></div>
                      </article>`
            
                      $('.body_left').append(recommendTemplate)
                  
                      
                      if(page < totalMembers) {
                        let memberTemplate = '';
                        for(let i = page; i < page + 3; i++) {
                          if(i < totalMembers) {
                            let member = recommendList[i]
                            const profilePic = member.memberVO.profilePic;
                            const nickname = member.memberVO.nickname;
                            const email = member.memberVO.email;
                          
                            memberTemplate = 
                              `<div class="memberList">
                                  <div class="member_profile">
                                    <div>
                                      <img class="profile_pic" src="\${profilePic}" />
                                    </div>
                                    <div class="nickname">
                                      <p>\${nickname}</p>
                                    </div>
                                    <button class="follow_btn">팔로우
                                      <input type="hidden" class="followerEmail" value="${sessionScope._LOGIN_USER_.email}" />
                                      <input type="hidden" class="followeeEmail" value="\${email}"/>   
                                    </button>
                                  </div>
                              </div>`
  
                              //let memberTemplateDom = $(memberTemplate)
                          }         
                        }
                        $('.member_info_area2').append(memberTemplate)
                        page += 3
                      } 
                    }
                  })
                }
                loadRecFollower()
              }
            }
          }
        })
      })
    }

    loadContents()

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
        "followee": $(e.currentTarget).find(".followeeEmail").val(),
        "followId": $(e.currentTarget).find('.followId').val()
        }
        if ($(this).hasClass('follow_on')) {
          $.post('/unfollow/member', content, function(result) {
            alert('팔로우를 취소합니다.')
            $(e.currentTarget).removeClass('follow_on')
            $(e.currentTarget).css({'background-color':'var(--gray)', 'color':'var(--blue)'})
            $('.followId').remove()
          })
        }
        else {
          $.post('/follow/member', content, function(result) {
            if(result) {
              alert('팔로우 합니다.')
              $(e.currentTarget).css({'background-color':'var(--blue)', 'color':'var(--white)'})
              $(e.currentTarget).addClass('follow_on')
              $('.follow_btn').prepend(`<input type="hidden" class="followId" value="\${result.followId}"/>`)
              send({
	         	roomName: "main",
	            sendType: "follow",
	            userName: "${sessionScope._LOGIN_USER_.nickname}",
	            userEmail: "${sessionScope._LOGIN_USER_.email}",
	            message: "${sessionScope._LOGIN_USER_.nickname}님이 팔로우 했습니다.",
	            to: "${memberVO.email}"
	        })
            }
            else {
              alert('처리하지 못했습니다.')
            }
          })
        }
      }
    })

    // 해시태그 선택 필터링  
    $(document).on('click', '.hashtag', function() {
      let cutHashtag = $(this).text().replace('#', '')

      if ($(this).hasClass('hashtag_selected')) {

        for (let i = 0; i < hashtagArr.length; i++) {
          if (hashtagArr[i] === cutHashtag) {
            hashtagArr.splice(i, 1)
          }
        }
        $(this).removeClass('hashtag_selected')
      }
      else {
        hashtagArr.push(cutHashtag)
        $(this).addClass('hashtag_selected')
      }
      loadContents(hashtagArr)
    })

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
          <a href="/freeboard/view/\${list[i].generalPostId}" target="_blank" class="small">\${list[i].postTitle}</a>
          </li>`
        let ranking_templateDom = $(ranking_template)

        $('.ranking_list').append(ranking_templateDom)
      }
      else {
        let ranking_template = `
          <li class="hot_post">
          <a href="/qnaboard/view/\${list[i].generalPostId}" target="_blank" class="small">\${list[i].postTitle}</a>
          </li>`
        let ranking_templateDom = $(ranking_template)

        $('.ranking_list').append(ranking_templateDom)
      }
    }
  })

  // 랭킹 박스 아래에 해시태그 가져오기
  $.get('/code/해시태그', function(response) {
    for (let i = 0; i < response.length; i++) {
      let hash_template = `<button class="hashtag align-center x-small">#\${response[i].codeContent}</button>`
      $('.hashtag_wrap').append(hash_template)
      }
    })
  })

  // 랜덤 공지 생성
  $.get('/notice/random', function(response) {
    if (response.postTitle !== undefined) {
      let randNoticeTemplate = `
        <div class="rand_notice_container">
          <div class="rand_notice_close_btn x-large">&times;</div>
          <h1 class="align-center">공지</h1>
          <div class="title_area">
            <label for="postTitle" class="post_title_label small">제목</label>
            <div>\${response.postTitle}</div>
          </div class=content_area>
          <label for="noticeContent" class="post_content_label small">내용</label>
          <div class="noticeContent"></div>
        </div>
        <div class="rand_notice_overlay"></div>`
  
      let randNoticeTemplateDom = $(randNoticeTemplate)
      randNoticeTemplateDom.find('.noticeContent').html(response.noticeContent)
  
      $('body').append(randNoticeTemplateDom)
    }


    $('.rand_notice_container, .rand_notice_overlay').addClass('active')

    // 공지를 이리저리 옮겨보자
    $('.rand_notice_container').mousedown(function(e) {
      let noticeOffset = $(this).offset()
      $(this).data('select', 'true')

      $(this).data('x', e.pageX)
      $(this).data('y', e.pageY)
      $(this).css("transform", "unset")
      $(this).css("transition", "0s")

      $(this).css({
          left: noticeOffset.left + 'px',
          top: noticeOffset.top + 'px' 
        })
    })
    .mousemove(function(e) {
      if ($(this).data('select') === 'true') {

        let prevX = $(this).data('x')
        let prevY = $(this).data('y')

        let x = e.pageX - prevX
        let y = e.pageY - prevY
        
        let noticeOffset = $(this).offset()
        
        x += noticeOffset.left
        y += noticeOffset.top
        console.log("after", x, y)

        $(this).css({
          left: x + 'px',
          top: y + 'px' 
        })

        $(this).data('x', e.pageX)
        $(this).data('y', e.pageY)
      }
    })
    .mouseup(function() {
      $(this).data('select', 'false')
    })


    $('.rand_notice_close_btn, .rand_notice_overlay').click(function() {
      $('.rand_notice_container, .rand_notice_overlay').removeClass('active')
    })

    $('body').keyup(function(e) {
      if (e.key === 'Escape') {
        $('.rand_notice_container, .rand_notice_overlay').removeClass('active')
      }
    })

  })

  // 메인 글 작성 ck에디터
  CKEDITOR.ClassicEditor.create(document.getElementById("editor_content"), {
    // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
    toolbar: {
      items: [
        'exportPDF','exportWord', '|',
        'findAndReplace', 'selectAll', '|',
        'heading', '|',
        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
        'bulletedList', 'numberedList', 'todoList', '|',
        'outdent', 'indent', '|',
        'undo', 'redo',
        '-',
        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
        'alignment', '|',
        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
        'textPartLanguage', '|',
        'sourceEditing'
      ],
      shouldNotGroupWhenFull: true
    },
    // Changing the language of the interface requires loading the language file using the <script> tag.
    // language: 'es',
    list: {
      properties: {
        styles: true,
        startIndex: true,
        reversed: true
      }
    },
    // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
    heading: {
      options: [
        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
      ]
    },
    // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
    placeholder: '원하는 글을 작성하세요.',
    // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
    fontFamily: {
      options: [
        'default',
        'Arial, Helvetica, sans-serif',
        'Courier New, Courier, monospace',
        'Georgia, serif',
        'Lucida Sans Unicode, Lucida Grande, sans-serif',
        'Tahoma, Geneva, sans-serif',
        'Times New Roman, Times, serif',
        'Trebuchet MS, Helvetica, sans-serif',
        'Verdana, Geneva, sans-serif'
      ],
      supportAllValues: true
    },
    // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
    fontSize: {
      options: [ 10, 12, 14, 'default', 18, 20, 22 ],
      supportAllValues: true
    },
    // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
    // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
    htmlSupport: {
      allow: [
        {
          name: /.*/,
          attributes: true,
          classes: true,
          styles: true
        }
      ]
    },
    // Be careful with enabling previews
    // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
    htmlEmbed: {
      showPreviews: true
    },
    // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
    link: {
      decorators: {
        addTargetToExternalLinks: true,
        defaultProtocol: 'https://',
        toggleDownloadable: {
          mode: 'manual',
          label: 'Downloadable',
          attributes: {
            download: 'file'
          }
        }
      }
    },
    // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
    mention: {
      feeds: [
        {
          marker: '@',
          feed: [
            '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
            '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
            '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
            '@sugar', '@sweet', '@topping', '@wafer'
          ],
          minimumCharacters: 1
        }
      ]
    },
    // The "super-build" contains more premium features that require additional configuration, disable them below.
    // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
    removePlugins: [
      // These two are commercial, but you can try them out without registering to a trial.
      // 'ExportPdf',
      // 'ExportWord',
      'CKBox',
      'CKFinder',
      'EasyImage',
      // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
      // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
      // Storing images as Base64 is usually a very bad idea.
      // Replace it on production website with other solutions:
      // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
      // 'Base64UploadAdapter',
      'RealTimeCollaborativeComments',
      'RealTimeCollaborativeTrackChanges',
      'RealTimeCollaborativeRevisionHistory',
      'PresenceList',
      'Comments',
      'TrackChanges',
      'TrackChangesData',
      'RevisionHistory',
      'Pagination',
      'WProofreader',
      // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
      // from a local file system (file://) - load this site via HTTP server if you enable MathType
      'MathType'
    ]
  })
  .then(editor_content => {
    editorContent = editor_content
  })

  function getDataFromTheEditor() {
    return editorContent.getData()
  }
</script>
</html>