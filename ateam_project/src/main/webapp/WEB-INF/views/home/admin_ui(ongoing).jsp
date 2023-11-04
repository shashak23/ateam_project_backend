<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업용 관리자 ui</title>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<style>
  .admin_container ul {
    list-style: none;
    padding: 0;
    margin: 0;
    width: 120px;
    overflow: hidden;
  }

  .admin_container .admin_mainmenu > li > button {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: rgb(141, 18, 18);
    color: #e5e5e5;
    width: 120px;
    height: 30px;
  }


  .admin_container ul li button {
    border: none;
    padding: 0;
    cursor: pointer;
  }

  .admin_submenu > li > button {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: rgb(153, 87, 87);
    color: #e5e5e5;
    width: 120px;
    height: 30px;
  }

  .personal_modal,
  .company_modal,
  .hashtag_modal,
  .notice_modal,
  .report_modal {
    position: fixed;
    max-height: 650px;
    top: 50%;
    left: 50%;
    transform: translate(-120%, -50%) scale(0.7) ;
    z-index: 10;
    opacity: 0;
    visibility: hidden;
    transition: all 0.5s;
    overflow: auto;
    box-shadow: 0 0 10px rgba(12, 12, 12, 0.178);
  }

  .personal_modal.active,
  .company_modal.active,
  .hashtag_modal.active,
  .notice_modal.active,
  .report_modal.active {
    opacity: 1;
    visibility: visible;
    transform: translate(-50%, -50%) scale(1);
  }

  .personal_modal_content,
  .company_modal_content,
  .hashtag_modal_content,
  .notice_modal_content,
  .report_modal_content  {
    display: flex;
    border-radius: 5px;
    overflow: hidden;
    background-color: #eee;
  }

  .personal_modal_content > div,
  .company_modal_content > div,
  .hashtag_modal > div,
  .notice_modal_content > div,
  .report_modal_content > div {
    padding: 20px;
  }

  .desc-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 15px 0 25px 0;
  }

  .desc-header > div:first-child {
    font-size: 14pt;
    border-left: 10px solid crimson;
    padding: 10px;
  }

  .desc-header .admin_company_search_wrap .admin_company_member_input,
  .admin_notice_input {
    outline: none;
    border: 0;
    padding: 5px;
    width: 200px;
    height: 25px;
  } 

  .desc-header .admin_company_search_wrap .admin_company_member_search,
  .admin_notice_search {
    border: #e07272;
    outline: none;
    background-color: #ebd9d9;
    color: #e05454;
    padding: 5px 10px;
    margin-left: 10px;
  }

  .desc-header .notice_crud {
    display: flex;
  }

  .member_container,
  .company_container,
  .notice_container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1080px;
    font-size: 9pt;
    margin-bottom: 5px;
  }

  .personal_modal .profile_group {
    display: grid;
    grid-template-columns: 45px 350px 80px 140px;
    align-items: center;
  }

  .personal_modal .profile_group_title {
    display: grid;
    grid-template-columns: 45px 350px 80px 140px;
    align-items: center;
    color: #888;
  }

  .personal_modal .admin_anchor {
    color: #191919;
    text-decoration: none;
  }
  
  .company_modal {
    width: 1140px;
  }

  .company_modal .profile_group {
    display: grid;
    grid-template-columns: 45px 815px 160px 60px;
    align-items: center;
  }

  .company_modal .profile_group_title {
    display: grid;
    grid-template-columns: 45px 815px 160px 60px;
    align-items: center;
    color: #888;
  }

  .notice_modal .desc-header {
    display: flex;
    justify-content: space-between;
  }

  .notice_modal .desc-header .create_notice {
    border: 0;
    padding: 5px;
    margin-left: 10px;
    color: white;
    background-color: #f12e2e;
    border-radius: 5px;
    cursor: pointer;
  }

  .notice_modal .desc-header .notice_search_wrap {
    display: flex;
  }

  .notice_modal .desc-header .notice_search_wrap input {
    margin-right: 10px;
    outline: none;
    border: 0;
    padding: 4px;
  }


  .notice_modal .notice_group_title {
    display: grid;
    grid-template-columns: 50px 605px 70px 70px 120px 120px;
    column-gap: 10px;
    align-items: center;
    color: #888;
    margin: 10px 0;
  }

  .notice_modal .notice_group_title .notice_content,
  .notice_modal .notice_group_title .notice_title {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }

  .notice_modal .notice_group_content {
    display: grid;
    grid-template-columns: 50px 605px 70px 70px 120px 120px;
    column-gap: 10px;
    align-items: center;
    color: #191919;
    margin: 10px 0;
    height: 32px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    font-size: 11pt;
  }

  .notice_modal .notice_group_content .notice_title {
    font-weight: bold;
    cursor: pointer;
    text-align: center;
  }

  .notice_modal .notice_group_content.notice_expired .notice_title {
    font-weight: normal;
  }

  .notice_modal .notice_group_content.notice_expired {
    color: #888;
  }

  .notice_modal .notice_group_content div {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }

  .notice_modal .notice_group_title div {
    text-align: center;
  }

  .profile_group > img {
    margin-right: 15px;
    width: 30px;
    height: 30px;
  }

  .profile_group .tier,
  .profile_group_title .tier,
  .profile_group_title .withdraw_txt {
    margin-left: 20px;
    text-align: center;
  }

  .btn_group {
    display: flex;
    justify-content: center;
  }

  .btn_group button {
    margin-left: 10px;
  }

  .company_modal .btn_group button {
    width: 80px;
  }
  
  .company_modal .btn_group .confirm_complete_btn {
    background-color: #888;
  }

  .company_modal .btn_group .company_member_withdraw_btn {
    background-color: #e2e2e2;
    color: #c9c9c9;
  }

  .admin_overlay {
    background-color: #00000034;
    position: fixed;
    width: 100%;
    height: 100vh;
    top: 0;
    left: 0;
    transition: 0.5s;
    opacity: 0;
    visibility: hidden;
    pointer-events: none;
  }

  .admin_overlay.active {
    opacity: 1;
    visibility: visible;
    pointer-events: all;
  }

  .btn-close,
  .notice_btn-close {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: transparent;
    border: none;
    font-size: 18px;
    color: #888;
    cursor: pointer;
  }

  .desc-title button,
  .desc-content button {
    display: block;
    width: 100%;
    border: none;
    background-color: crimson;
    color: #e5e5e5;
    padding: 8px;
  }

  .notice_group_content .notice_modify_btn {
    display: block;
    width: 100%;
    border: none;
    background-color: rgb(255, 137, 161);
    color: #e5e5e5;
    padding: 7px 1px;
  }

  .notice_group_content .notice_delete_btn {
    background-color: #e5e5e5;
    color: #ccc;
  }

  .notice_group_content .notice_date {
    text-align: center;
  }

  .notice_group_content .notice_off_btn,
  .notice_group_content .notice_del_btn   {
    background-color: #e5e5e5;
    color: #888;
  }

  .hashtag_content {
    border: 1px solid #ccc;
    border-radius: 5px;
    margin: 5px;
    padding: 5px;
    cursor: default;
  }

  .hashtag_wrap {
    display: flex;
    flex-wrap: wrap;
    width: 300px;
    border: 1px solid #e5e5e5;
    border-radius: 8px;
    margin-bottom: 10px;
    margin-top: 10px;
  }

  .hashtag_wrap > .hashtag_content {
    padding: 3px 10px;
    margin: 5px 6px;
    border-radius: 12px;
    border: 0;
    background-color: #b3d8f1;
    color: #fff;
    font-size: 9pt;
  }

  .hashtag_create_title {
    margin-bottom: 10px;
  }

  #codeContent {
    outline: none;
    border: 0;
    height: 20px;
  }

  #create_btn {
    outline: none;
    width: 70px;
    border: 0;
    border-radius: 5px;
    background-color: #75C2F6;
    color: #fff;
    padding: 5px;
    cursor: pointer;
    margin-left: 10px;
  }

  #create_btn:hover {
    background-color: #2251ec;
  }

  #create_btn:active {
    background-color: #07227a;
  }

  * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .mb10 {
        display: block;
        margin-bottom: 10px;
    }

    .ck-editor__editable { 
        height: 400px; 
    }

    .ck-content { 
        font-size: 12px; 
    }

    .create_btn {
        margin: 30px 15px;
    }

    .create_wrapper {
        display: flex;
        flex-direction: column;
        padding-bottom: 15px;
        border: 1px solid #888;
        margin: 0 15px;
    }
    .anchor {
        display: flex;
    }

    .create_btn, .certificate_download {
        padding: 5px 8px;
        text-decoration: none;
        color: #4052f7;
        margin-right: 15px;
        border-radius: 10px;
        border: 0px;
        font-weight: bold;
        cursor: pointer;
    }

    .create_container,
    .notice_view_container {
        visibility: hidden;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -80%);
        z-index: 100;
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

    .create_container.active,
    .notice_view_container.active {
			visibility: visible;
			opacity: 1;
			transform: translate(-50%, -50%);
	}

    .create_container > *,
    .notice_view_container > * {
        margin-bottom: 10px;
    }

    .notice_view_container {
      visibility: hidden;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate((-50%, -50%));
    }

    .notice_view_title {
      text-align: center;
    }

    .notice_view_overlay {
      background-color: #47474754;
      position: fixed;
      width: 100%;
      height: 100vh;
      top: 0;
      left: 0;
      transition: 0.5s;
      opacity: 0;
      pointer-events: none;
      z-index: 50;
    }
    
    .notice_view_overlay.active {
      opacity: 1;
      pointer-events: all;
    }

    .btn-close,
    .notice_btn-close {
        position: absolute;
        top: 6px;
        right: 10px;
        background-color: transparent;
        font-size: 18px;
        color: #888;
        cursor: pointer;
    }

    .btn-close:hover,
    .notice_btn-close:hover {
        color: #191919;
    }

    .create_title {
        text-align: center;
    }

    #postTitle {
        border: 0px;
        background-color: #e9f3ff;
        width: 100%;
        height: 35px;
        padding: 0 15px;
        outline: none;
        color: #333;
    }

    #noticeContent {
        border: 0px;
        background-color: #e9f3ff;
        width: 100%;
        height: 200px;
        padding: 15px 15px;
        outline: none;
        color: #333;
        resize: none;
    }

    #postTitle::placeholder,
    #noticeContent::placeholder {
        color: #bbb;
    }

    #postTitle:focus::placeholder,
    #noticeContent:focus::placeholder {
        visibility: hidden;
    }

    .date_wrap {
        display: flex;
        justify-content: space-around;
        align-items: center;
    }

    .dateSelector1,
    .dateSelector2 {
        width: 150px;
        height: 30px;
        outline: none;
        border: 1px solid #e5e5e5;
        padding: 0 10px;
        color: #191919;
    }

    #start-date, #end-date {
        outline: none;
    }

    .submit_btn_wrap {
        display: flex;
        justify-content: flex-end;
        margin-top: 30px;
    }

    .submit_btn {
        background-color: #e9f3ff;
        border: 0px;
        padding: 5px 10px;
        border-radius: 5px;
        color: #4052f7;
        font-weight: bold;
        text-align: center;
    }

    .notice_create_overlay  {
        background-color: #47474754;
        position: fixed;
        z-index: 50;
        width: 100%;
        height: 100vh;
        top: 0;
        left: 0;
        transition: 0.5s;
        opacity: 0;
        pointer-events: none;
    }

    .notice_create_overlay.active {
        opacity: 1;
        pointer-events: all;
    }

    .errors {
        background-color: rgb(255, 244, 244);
        padding: 5px 10px;
        color: #ffafaf;
        margin-bottom: 10px;
        font-size: 9pt;
        cursor: pointer;
    }

    .inactive {
        opacity: 0.6;
        cursor: not-allowed;
    }
</style>
<body>
  <nav class="admin_container">
    <ul class="admin_mainmenu">
      <li><button class="mainmenu_btn">회원</button>
        <ul class="admin_submenu">
          <li><button class="admin_person_btn">개인</button></li>
          <li><button class="admin_company_btn">기업</button></li>
        </ul>
      </li>
      <li><button class="mainmenu_btn">게시글</button>
        <ul class="admin_submenu">
          <li><button class="admin_freeboard_btn">자유 게시판</button></li>
          <li><button class="admin_qnaboard_btn">질답 게시판</button></li>
          <li><button class="admin_companynews_btn">기업소식 게시판</button></li>
          <li><button class="admin_algorithm_btn">알고리즘 게시판</button></li>
        </ul>
      </li>
      <li><button class="mainmenu_btn">통합</button>
        <ul class="admin_submenu">
          <li><button class="admin_notice_btn">공지</button></li>
          <li><button class="admin_report_btn">신고</button></li>
          <li><button class="admin_hashtag_btn">해시태그</button></li>
        </ul>
      </li>
      <li><button class="mainmenu_btn">환경설정</button>
        <ul class="admin_submenu">
          <li><button>임시</button></li>
        </ul>
      </li>
    </ul>
  </nav>
  <!-- 일반 계정 관리 모달 -->
  <div class="personal_modal">
    <div class="personal_modal_content">
      <div class="desc">
        <div class="desc-header">
          <div>일반 회원 명단</div>
          <div class="admin_company_search_wrap">
            <input class="admin_general_member_input" type="text" placeholder="홍길동"/>
            <button class="admin_general_member_search">검색</button>
          </div>
        </div>
        <button class="btn-close">&times;</button>
        <div class="desc-title">
          <div class="member_container">
            <div class="profile_group_title">
              <span>이미지</span> <div class="member_info" style="text-align: center;">회원 정보</div><div class=tier>티어</div><div class="withdraw_txt">탈퇴</div>
              <div class="btn_group">
              </div>
            </div>
          </div>
        </div>
        <div class="desc-content"></div>
      </div>
    </div>
  </div>

  <!-- 기업 계정 관리 모달 -->
  <div class="company_modal">
    <div class="company_modal_content">
      <div class="desc">
        <div class="desc-header">
          <div>기업명단</div>
          <div class="admin_company_search_wrap">
            <input class="admin_company_member_input" type="text" placeholder="기업 이름 및 이메일"/>
            <button class="admin_company_member_search">검색</button>
          </div>
          <button class="btn-close">&times;</button>
        </div>
        <div class="desc-title">
          <div class="company_container">
            <div class="profile_group_title">
              <span>이미지</span> <div class="member_info" style="text-align: center;">회원 정보</div><div class=tier>승인여부</div><div class="withdraw_txt">탈퇴</div>
              <div class="btn_group">
              </div>
            </div>
          </div>
        </div>
        <div class="desc-content"></div>
        <div class="admin_company_pagination"></div>
      </div>
    </div>
  </div>

  <!-- 공지 관리 모달 -->
  <div class="notice_modal">
    <div class="notice_modal_content">
      <div class="desc">
        <div class="desc-header">
          <div class="notice_crud">
            <div>공지 관리</div>
            <button class="create_notice">공지생성</button>
          </div>
          <div class="notice_search_wrap">
            <input class="admin_notice_input" type="text" placeholder="제목"/>
            <button class="admin_notice_search">검색</button>
            <button class="btn-close">&times;</button>
          </div>
        </div>
        <div class="desc-title">
          <div class="notice_container">
            <div class="notice_group_title">
              <div>온/오프</div><div>제목</div><div>수정</div><div>삭제</div><div>시작날짜</div><div>끝날짜</div>
            </div>
          </div>
        </div>
        <div class="desc-content"></div>
      </div>
    </div>
  </div>

  <!-- 공지 입력 폼 -->
  <form:form modelAttribute="noticeVO" method="post" action="/notice/create">
    <div class="create_container">
      <div class="btn-close">&times;</div>
      <h1 class="create_title">공지 생성</h1>
      <div>
        <label for="postTitle" class="mb10">제목</label>
        <input type="text" name="postTitle" id="postTitle" placeholder="제목을 입력해주세요"/>
        <!-- <form:errors path="postTitle" element="div" cssClass="errors" /> -->
      </div>
      <label for="noticeContent" class="mb10">내용</label>
      <div>
        <textarea name="noticeContent" id="editor" placeholder="내용을 입력해주세요."></textarea>
        <!-- <form:errors path="postTitle" element="div" cssClass="errors" /> -->
      </div>
      <div class="date_wrap">
        <label for="start-date">시작일</label>
        <input class="dateSelector1" placeholder="시작 날짜" id="start-date"
                name="releaseStartDate"/>
        <span>~</span>
        <label for="end-date">종료일</label>
        <input class="dateSelector2" placeholder="종료 날짜" id="end-date"
                name="releaseEndDate"/>
      </div>
      <div class="submit_btn_wrap">
        <input type="submit" value="생성" class="submit_btn"/>
      </div>
    </div>
  </form:form>
  <div class="notice_create_overlay"></div>

    <!-- 공지 수정 폼 -->
    <form:form modelAttribute="noticeVO" method="post" action="/notice/modify">
      <div class="modify_container">
        <div class="btn-close">&times;</div>
        <h1 class="create_title">공지 수정</h1>
        <div>
          <label for="postTitle" class="mb10">제목</label>
          <input type="text" name="postTitle" id="postTitle" placeholder="제목을 입력해주세요"/>
          <!-- <form:errors path="postTitle" element="div" cssClass="errors" /> -->
        </div>
        <label for="noticeContent" class="mb10">내용</label>
        <div>
          <textarea name="noticeContent" id="editor" placeholder="내용을 입력해주세요."
                    value="${noticeVO.noticeContent}"></textarea>
          <!-- <form:errors path="postTitle" element="div" cssClass="errors" /> -->
        </div>
        <div class="date_wrap">
          <label for="start-date">시작일</label>
          <input class="dateSelector1" placeholder="시작 날짜" id="start-date"
                  name="releaseStartDate" value="${noticeVO.releaseStartDate}"/>
          <span>~</span>
          <label for="end-date">종료일</label>
          <input class="dateSelector2" placeholder="종료 날짜" id="end-date"
                  name="releaseEndDate" value="${noticeVO.releaseEndDate}"/>
        </div>
        <div class="submit_btn_wrap">
          <input type="submit" value="생성" class="submit_btn"/>
        </div>
      </div>
    </form:form>
    <div class="notice_create_overlay"></div>

  <!-- 공지 조회 모달 -->
  <div class="notice_view_container">
    <div class="notice_btn-close">&times;</div>
    <h1 class="notice_view_title">공지</h1>
    <div>
      <label for="postTitle" class="notice_post_title_label">제목</label>
      <div class="notice_post_title"></div>
    </div>
    <label for="noticeContent" class="notice_post_content_label">내용</label>
    <p class="notice_post_content"></p>
  </div>
  <div class="notice_view_overlay"></div>

  <!-- 신고 관리 모달 -->
  <div class="report_modal">
    <div class="report_modal_content">
      <button class="btn-close">&times;</button>
      <div class="desc">
        <div class="desc-header">
          <div>신고 목록</div>
          <div class="admin_report_search_wrap">
            <input type="text" class="admin_report_input" />
            <button class="admin_report_search">검색</button>
          </div>
        </div>
        <div class="desc_title">
          <div class="report_container">
            <div class="report_title">
              <div>신고번호</div><div>내용</div><div>신고사유</div><div>신고일자</div><div>처리진행상황</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 해시태그 관리 모달 -->
  <div class="hashtag_modal">
    <div class="hashtag_modal_content">
      <button class="btn-close">&times;</button>
      <div class="desc">
        <div>
          <strong>해시태그 목록</strong>
        </div>
        <div class="hashtag_wrap"></div>
        <div class="hashtag_create_title"><strong>해시태그 생성</strong></div>
        <label for="codeContent">입력: </label>
        <input type="text" name="codeContent" id="codeContent" />
        <button id="create_btn">생성</button>
      </div>
    </div>
  </div>

  <div class="admin_overlay"></div>
</body>
<script>
  $('.mainmenu_btn').next('.admin_submenu').slideToggle(200)
  $('.mainmenu_btn').click(function() {
    let submenu = $(this).next('.admin_submenu')
    submenu.slideToggle(200)
  })

  $('.btn-close, .admin_overlay').click(function() {
    $('.personal_modal, .admin_overlay').removeClass('active')
    $('.company_modal, .admin_overlay').removeClass('active')
    $('.hashtag_modal, .admin_overlay').removeClass('active')
    $('.notice_modal, .admin_overlay').removeClass('active')
  })

  $('body').keyup(function(e) {
    if (e.key === 'Escape') {
      $('.personal_modal, .admin_overlay').removeClass('active')
      $('.company_modal, .admin_overlay').removeClass('active')
      $('.hashtag_modal, .admin_overlay').removeClass('active')
      $('.notice_modal, .admin_overlay').removeClass('active')
    }
  })
  
  // 일반 회원 계정 목록 열기
  $('.admin_person_btn').click(function() {
    $('.personal_modal, .admin_overlay').addClass('active')
  })

  // 기업 회원 계정 목록 열기
  $('.admin_company_btn').click(function() {
    $('.company_modal, .admin_overlay').addClass('active')
  })
  
  // 공지사항 관리 목록 열기
  $('.admin_notice_btn').click(function() {
    $('.notice_modal, .admin_overlay').addClass('active')
  })

  // 해시태그 목록 열기
  $('.admin_hashtag_btn').click(function() {
    $('.hashtag_modal, .admin_overlay').addClass('active')
  })

  // 일반 회원 조회
  function loadGeneralTypeMember(val = '') {
    $('.personal_modal').find('.desc-content').empty()
    $.get('/home/admin/person', function(response) {
      for (let i = 0; i < response.length; i++) {
        let member = response[i]
        generalMemberTemplate = 
          `<div class="member_container">
              <div class="profile_group">
              <img src="\${member.profilePic}" alt="."><div class="member_info"><a href="/memberinfo/view/\${member.email}" target="_blank" class="admin_anchor">\${member.nickname}(\${member.email})</a></div><div class=tier>\${member.generalMemberVO.tierId}</div>
              <div class="btn_group">
                  <button>경고</button>
                  <button class="general_member_withdraw_btn" id="\${member.email}">탈퇴</button>
              </div>
              </div>
          </div>`
        generalMemberTemplateDom = $(generalMemberTemplate)
        
        if (member.nickname.includes(val) || member.email.includes(val)) {
          $('.personal_modal').find('.desc-content').append(generalMemberTemplateDom)
        }
      }
    })
  }
  loadGeneralTypeMember()

  // 일반 회원 검색
  $('.admin_general_member_search').click(function() {
    let val = $('.admin_general_member_input').val()
    loadGeneralTypeMember(val)
  })

  $('.admin_general_member_input').keyup(function(e) {
    if (e.key === 'Enter') {
      let val = $('.admin_general_member_input').val()
      loadGeneralTypeMember(val)
    }
  })

  // 일반 회원 탈퇴 조치
  $(document).on('click', '.general_member_withdraw_btn', function(e) {
    let email = $(this).attr('id')
    let url = '/home/admin/person/delete/' + email
    if (confirm('정말 탈퇴 시키겠습니까?')) {
      $.get(url, function(response) {
        if (response.result === 'success') {
          alert('탈퇴가 완료되었습니다.')
          $('.personal_modal').find('.desc-content').empty()
          loadGeneralTypeMember()
        }
      })
    }
  })

  // 기업 회원 조회
  function loadCompanytypeMember(val = '') {
    $.get('/home/admin/company', function(response) {
      $('.company_modal').find('.desc-content').empty()
      for (let i = 0; i < response.length; i++) {
        let company = response[i]
        let companyTemplateDom
        if (company.companyInfoVO.confirmYn === 'N') {
          let companyTemplate = 
            `<div class="company_container">
              <div class="profile_group">
              <img src="\${company.profilePic}" alt="."><div class="company_info">
                <strong>\${company.nickname}</strong>(\${company.email})
                <a class="certificate_download" href='/company/file/download/\${company.email}'>[사업자등록증]</a>
                </div>
                <div class="btn_group">
                  <button class="company_approval" id="\${company.email}">승인</button>
                  <button class="company_refuse" id="\${company.email}">반려</button>
                </div>
                <div class="btn_group">
                  <button class="company_member_withdraw_btn" id="\${company.email}">탈퇴</button>  
                </div>
              </div>
            </div>`
          companyTemplateDom = $(companyTemplate)
        }
        else {
          let companyTemplate = 
            `<div class="company_container">
              <div class="profile_group">
              <img src="\${company.profilePic}" alt="."><div class="company_info">
                <strong>\${company.nickname}</strong>(\${company.email})
                <a class="certificate_download" href='\${company.companyInfoVO.companyRegistCertificateUrl}'>[사업자등록증]</a>
                </div>
                <div class="btn_group">
                  <button class="confirm_complete_btn">승인완료</button>
                </div>
                <div class="btn_group">
                  <button class="company_member_withdraw_btn" id="\${company.email}">탈퇴</button>
                </div>
              </div>
            </div>`
          companyTemplateDom = $(companyTemplate)
        }
        if (company.nickname.includes(val) || company.email.includes(val)) {
          $('.company_modal').find('.desc-content').append(companyTemplateDom)
        }
      }
    })
  }

  loadCompanytypeMember()

  // 기업 회원 검색
  $('.admin_company_member_search').click(function() {
    let val = $('.admin_company_member_input').val()
    loadCompanytypeMember(val)
  })

  $('.admin_company_member_input').keyup(function(e) {
    if (e.key === 'Enter') {
      let val = $('.admin_company_member_input').val()
    loadCompanytypeMember(val)
    }
  })

  // 기업 승인 처리
  $(document).on('click', '.company_approval', function() {
    let body = {
      companyEmail: $(this).attr('id'),
      val: 'approval'
    }
    let url = '/admin/companymember'

    if (confirm('정말 승인하시겠습니까?')) {
      $.post(url, body, function(response) {
        alert('승인 처리되었습니다.')
        $('.company_modal').find('.desc-content').empty()
        loadCompanytypeMember()
      })
    }
  })
  
  // 기업 반려 처리
  $(document).on('click', '.company_refuse', function() {
    let body = {
      companyEmail: $(this).attr('id'),
      val: 'refuse'
    }
    let url = '/admin/companymember'

    if (confirm('정말 반려하시겠습니까?')) {
      $.post(url, body, function(response) {
        alert('반려 처리되었습니다.')
        $('.company_modal').find('.desc-content').empty()
        loadCompanytypeMember()
      })
    }
  })

  // 기업 회원 탈퇴 조치
  $(document).on('click', '.company_member_withdraw_btn', function(e) {
    let email = $(this).attr('id')
    let url = '/home/admin/person/delete/' + email
    if (confirm('정말 탈퇴 시키겠습니까?')) {
      $.get(url, function(response) {
        if (response.result === 'success') {
          alert('탈퇴가 완료되었습니다.')
          $('.company_modal').find('.desc-content').empty()
          loadCompanytypeMember()
        }
      })
    }
  })

  // 공지 사항 목록 조회
  function loadAdminNoticeList(val = '') {
    $.get('/admin/noticelist', function(response) {
      for (let i = 0; i < response.length; i++) {
        let notice = response[i]

        let startDate = new Date(notice.releaseStartDate)
        let startYear = startDate.getFullYear()
        let startMonth = (startDate.getMonth() + 1).toString().padStart(2, '0')
        let startDay = startDate.getDate().toString().padStart(2, '0')
        let formattedStartDate = startYear + '-' + startMonth + '-' + startDay

        let endDate = new Date(notice.releaseEndDate)
        let endYear = endDate.getFullYear()
        let endMonth = (endDate.getMonth() + 1).toString().padStart(2, '0')
        let endDay = endDate.getDate().toString().padStart(2, '0')
        let formattedEndDate = endYear + '-' + endMonth + '-' + endDay

        let today = new Date()
        let noticeTemplate

        if (today < endDate && notice.onOff === 'On' && notice.deleteYn == 'N') {
          noticeTemplate = `
          <div class="notice_group_content">
            <button class="notice_on_btn" data-id="\${notice.noticeId}">On</button>
            <div class="notice_title" data-id="\${notice.noticeId}">\${notice.postTitle}</div>
            <button class="notice_modify_btn" data-id="\${notice.noticeId}">수정</button>
            <button class="notice_delete_btn" data-id="\${notice.noticeId}">삭제</button>
            <div class="notice_date">\${formattedStartDate}</div>
            <div class="notice_date">\${formattedEndDate}</div>
          </div>`
        }
        else if (today < endDate && notice.onOff === 'Off' && notice.deleteYn == 'N') {
          noticeTemplate = `
          <div class="notice_group_content">
            <button class="notice_off_btn" data-id="\${notice.noticeId}">Off</button>
            <div class="notice_title" data-id="\${notice.noticeId}">\${notice.postTitle}</div>
            <button class="notice_modify_btn" data-id="\${notice.noticeId}">수정</button>
            <button class="notice_delete_btn" data-id="\${notice.noticeId}">삭제</button>
            <div class="notice_date">\${formattedStartDate}</div>
            <div class="notice_date">\${formattedEndDate}</div>
          </div>`
        }
        else if (notice.deleteYn == 'N') {
          noticeTemplate = `
          <div class="notice_group_content notice_expired">
            <button class="notice_off_btn" data-id="\${notice.noticeId}">Off</button>
            <div class="notice_title" data-id="\${notice.noticeId}">\${notice.postTitle}</div>
            <button class="notice_modify_btn" data-id="\${notice.noticeId}">수정</button>
            <button class="notice_delete_btn" data-id="\${notice.noticeId}">삭제</button>
            <div class="notice_date">\${formattedStartDate}</div>
            <div class="notice_date">\${formattedEndDate}</div>
          </div>`
        }

        else {
          noticeTemplate = `
          <div class="notice_group_content notice_expired">
            <button class="notice_del_btn" data-id="\${notice.noticeId}">Del</button>
            <div class="notice_title" data-id="\${notice.noticeId}">\${notice.postTitle}</div>
            <button class="notice_modify_btn" data-id="\${notice.noticeId}">수정</button>
            <button class="notice_delete_btn" data-id="\${notice.noticeId}">삭제</button>
            <div class="notice_date">\${formattedStartDate}</div>
            <div class="notice_date">\${formattedEndDate}</div>
          </div>`
        }

        let noticeTemplateDom = $(noticeTemplate)

        if (notice.postTitle.includes(val) || notice.noticeContent.includes(val)) {
          $('.notice_modal').find('.desc-content').append(noticeTemplateDom)
        }
      }
    })
  }

  loadAdminNoticeList()

  // 공지사항 검색
  $('.admin_notice_search').click(function() {
    let val = $('.admin_notice_input').val()

    $('.notice_modal').find('.desc-content').empty()
    loadAdminNoticeList(val)
  })

  $('.admin_notice_input').keyup(function(e) {
    if(e.key === 'Enter') {
    let val = $('.admin_notice_input').val()

    $('.notice_modal').find('.desc-content').empty()
    loadAdminNoticeList(val)
    }
  })

  // 공지 off 버튼 클릭했을 때
  $(document).on('click', '.notice_off_btn', function() {
    let onoff = $(this).text()
    let id = $(this).data('id')
    let currBtn =$(this)

    if ($(this).parent().hasClass('notice_expired')) {
      alert('이 공지는 만료되었습니다. 날짜를 먼저 수정해주세요.')
    }
    else {
      $.get(`/admin/notice/onoff/\${onoff}/\${id}`, function(response) {
        $(currBtn).removeClass('notice_off_btn')
        $(currBtn).addClass('notice_on_btn')
        $(currBtn).text('On')
        $('.notice_group_content').removeClass('.notice_expired')
      })
    }
  })

  // 공지 on 버튼 클릭했을 때
  $(document).on('click', '.notice_on_btn', function() {
    let onoff = $(this).text()
    let id = $(this).data('id')
    let currBtn =$(this) 

    $.get(`/admin/notice/onoff/\${onoff}/\${id}`, function(response) {
      $(currBtn).removeClass('notice_on_btn')
      $(currBtn).addClass('notice_off_btn')
      $(currBtn).text('Off')
      $('.notice_group_content').addClass('.notice_expired')

    })
  })

  $(document).on('click', '.notice_del_btn', function() {
    alert('삭제된 공지입니다.')
  })

  // 공지 조회 기능(제목 클릭했을 때)
  $(document).on('click', '.notice_title', function() {
    let id = $(this).data('id')

    $.get(`/admin/notice/view/\${id}`, function(response) {
      $('.notice_post_title').text('')
      $('.notice_post_content').text('')
      $('.notice_post_title').text(response.postTitle)
      $('.notice_post_content').html(response.noticeContent)
      $('.notice_view_container, .notice_view_overlay').addClass('active')

      $('.notice_btn-close, .notice_view_overlay').click(function() {
        $('.notice_view_container, .notice_view_overlay').removeClass('active')
      })
    })
  })

  // 공지 수정 기능
  $(document).on('click', '.notice_modify_btn', function() {
    let id = $(this).data('id')
    $.get(`/admin/notice/view/\${id}`, function(response) {
      alert('곧 땡길 예정')
    })
  })

  // 공지 삭제 기능
  $(document).on('click', '.notice_delete_btn', function() {
    let noticeId = $(this).data('id')
    
    $.get(`/notice/delete/\${noticeId}`, function(response) {
      if (response.result === 'success') {
        alert('성공했삼ㅋ')
      }
      else {
        alert('실패했삼ㅋ')
      }
    })
  })

  // 신고 목록 조회
  function loadReportList() {
    $.get('/admin/reportlist', function(response) {

    })
  }

  loadReportList()

  // $(document).on('click', '.create_notice', function() {
  //   window.open('/notice/create', '공지 생성', 'width=500, height=800px')
  // })

  // 해시태그 조회
  let tag = {}
  let counter = 0

  function addTag(value) {
    tag[counter] = value
    counter++
  }

  function marginTag() {
    return Object.values(tag).filter(function(word) {
      return world !== ''
    })
  }

  // 해시태그 생성
  $('#create_btn').click(function() {
    let body = {'codeContent': $('#codeContent').val()}

    if(body === null || body === '' || $('#codeContent').val().trim() === '') {
      alert('해시태그를 입력해주세요')
    }

    else {
      $.post(
        "/code/create/해시태그",
        body,
        function(response) {
        let result = response.result
        if (result) {
          load_hashtag()
          alert('성공')
          $('#codeContent').val('')
        }
        else {
          alert('실패!')
        }
      })
    }
  })

  // 해시태그 목록 출력
  load_hashtag = function() {
    $('.hashtag_wrap').html('')
    $.get('/code/해시태그', function(response) {
      for (let i = 0; i < response.length; i++) {
        let template = `<div class="hashtag_content">
                          \${response[i].codeContent}
                        </div>`
        let templateDom = $(template)
        $('.hashtag_wrap').append(templateDom)
      }
    })
  }

  load_hashtag()


  // 신고 관리창으로 이동
  // $('.admin_report_btn').click(function() {
  //   window.open('/admin/report/list', '_blank')
  // })

  // 달력 포맷
  flatpickr.localize(flatpickr.l10ns.ko);

  $('.dateSelector1').flatpickr({
      minDate: 'today',
      local: 'ko'
  })

  $('.dateSelector2').flatpickr({
      minDate: 'today',
      local: 'ko'
  })
  // 달력 포맷 끝

  // 공지 생성 모달 실행을 위한 문장
  $('.create_notice').click(function() {
      $('.create_container, .notice_create_overlay').addClass('active')
  })

  $('.btn-close, .notice_create_overlay').click(function() {
      $('.create_container, .notice_create_overlay').removeClass('active')
  })

  $('.dateSelector1').click(function() {
  })

// ck 에디터
ClassicEditor.create( document.querySelector( '#editor' ), {
language: "ko"
})

// 유효성 체크
$('.submit_btn').addClass('inactive')
$('.submit_btn').prop('disabled', true)
let today = new Date()
let year = today.getFullYear()
let month = today.getMonth() + 1
let day = today.getDate()
if (month < 10) {
        month = '0' + month
    }
if (day < 10) {
    day = '0' + day
}
let formattedToday = year + '' + month + '' + day
let start_date
let end_date

$('#postTitle').change(function() {
    if ($('#postTitle').val().trim() === '') {
        const titleError = $('<div class="errors title_message">제목을 입력해주세요.</div>')
        $('.title_message').remove()
        $('#postTitle').after(titleError)
        $('.submit_btn').addClass('inactive')
        $('.submit_btn').prop('disabled', true)
    }
    else if (end_date < formattedToday || 
             end_date < start_date) {
        $('.title_message').remove()
        $('.submit_btn').addClass('inactive')
        $('.submit_btn').prop('disabled', true)
    }
    else {
        $('.title_message').remove()
        $('.submit_btn').prop('disabled', false)
        $('.submit_btn').removeClass('inactive')
    } 
})
$('#end-date').change(function() { 
    const start_date = parseInt($('#start-date').val().split('-').join(''))
    const end_date = parseInt($('#end-date').val().split('-').join(''))
    if (end_date < formattedToday || 
        end_date < start_date) {
        const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
        $('.date_message').remove()
        $('.date_wrap').after(dateError)
        $('.submit_btn').addClass('inactive')
        $('.submit_btn').prop('disabled', true)
    }
    else if ($('#postTitle').val().trim() === '') {
        $('.date_message').remove()
        $('.submit_btn').addClass('inactive')
        $('.submit_btn').prop('disabled', true)
    }
    else {
        $('.date_message').remove()
    }
})
</script>
</html>