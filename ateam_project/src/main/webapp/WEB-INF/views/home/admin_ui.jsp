<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
  .admin_container ul {
    list-style: none;
    padding: 0;
    margin: 0;
    width: 120px;
    overflow: hidden;
  }
  .admin_container .admin_mainmenu > .admin_main_list {
    display: block;
  }

  .admin_container .admin_mainmenu > li > button {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #E55604;
    color: #e5e5e5;
    width: 120px;
    height: 30px;
    border-radius: 0px;
  }


  .admin_container ul li button {
    border: none;
    padding: 0;
    cursor: pointer;
    border-radius: 0px;
  }

  .admin_submenu > li > button {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #ee9d6e;
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
    transform: translate(120%, -50%) scale(0.7) ;
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
    font-size: 12pt;
    border-left: 10px solid #E55604;
    padding: 10px;
  }

  .desc-header .admin_company_search_wrap .admin_company_member_input,
  .admin_general_member_input,
  .admin_notice_input,
  .admin_report_input {
    outline: none;
    border: 0;
    padding: 5px;
    width: 200px;
    height: 25px;
  } 

  .desc-header .admin_company_search_wrap .admin_company_member_search,
  .admin_general_member_search,
  .admin_notice_search,
  .admin_report_search {
    border: none;
    outline: none;
    background-color: #E55604;
    color: #eee;
    padding: 5px 10px;
    margin-left: 10px;
  }

  .desc-header_left {
    display: flex;
    align-items: center;
  }

  .desc-header_left .admin_member_manage_toggle_wrap {
    margin-left: 10px;
  }

  .desc-header_left .admin_member_manage_toggle_wrap button {
    background-color: #ee9d6e;
    color: #eee;
    border: none;
    padding: 5px;
    font-size: 10pt;
  }
  
  .desc-header_left .admin_member_manage_toggle_wrap button.selected {
    color: #eee;
    background-color: #E55604;
  }

  .desc-header .notice_crud {
    display: flex;
  }

  .desc-header .export_btn {
    border: 0;
    background-color: #ee9d6e;
    color: #eee;
    padding: 5px 10px;
    cursor: default;
  }

  .member_container.selected,
  .tier_management_head.selected,
  .company_container,
  .notice_container,
  .report_container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1080px;
    font-size: 9pt;
    margin-bottom: 5px;
  }

  .member_container,
  .tier_management_head {
    display: none;
  }

  .personal_modal .profile_group_title, 
  .personal_modal .profile_group {
    display: grid;
    grid-template-columns: 50px 750px 80px 80px 80px;
    align-items: center;
    margin-bottom: 10px;
  }

  .personal_modal .profile_group_title {
    color: #888;
  }

  .personal_modal .profile_group_title > div {
    text-align: center;
  }

  .personal_modal .profile_tier_group_title,
  .personal_modal .profile_tier_group {
    display: grid;
    grid-template-columns: 30px 650px 50px 90px 90px 80px 60px 60px;
    align-items: center;
    margin-bottom: 10px;
  }

  .personal_modal .profile_tier_group_title {
    text-align: center;
  }

  .personal_modal .profile_tier_group_title * {
    text-align: center;
  }

  .member_container_body .member_info {
    margin-left: 15px;
    font-weight: bold;
    font-size: 11pt;
  }

  .member_container_body .tier {
    font-size: 10pt;
    text-align: center;
  }

  .personal_modal .admin_anchor {
    color: #191919;
    text-decoration: none;
  }

  .member_container_body .admin_member_warn_btn,
  .member_container_body .general_member_withdraw_btn {
    width: 70%;
    padding: 5px 10px;
    margin: 0 auto;
  }

  .member_container_body .general_member_withdraw_btn {
    background-color: #ccc;
    color: #eee;
  }

  .tier_management_body .member_info {
    font-weight: bold;
  }

  .tier_management_body .tier_management_body,
  .tier_management_body .member_tier_score,
  .tier_management_body .current_tier,
  .tier_management_body .next_tier {
    text-align: center;
    font-size: 10pt;
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

  .company_modal .profile_group_title div {
    text-align: center;
  }

  .company_modal .profile_group_title .withdraw_txt {
    margin-left: 10px;
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
    background-color: #E55604;
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
    margin: 0 10px;
    width: 30px;
    height: 30px;
  }

  .profile_group .company_info {
    padding: 0 10px;
  }

  .report_title,
  .report_list_group {
    display: grid;
    grid-template-columns: 80px 100px 590px 170px 120px;
    column-gap: 10px;
    color: #888;
  }

  .report_title > div {
    text-align: center;
  }

  .report_list_group > div {
    text-align: center;
    font-size: 11pt;
    color: #333;
  }

  .report_container {
    padding: 5px 0;
  }

  .report_list_group > .report_content {
    padding-left: 15px;
    text-align: inherit;
  }

  .report_list_group > .report_content > a {
    color: #191919;
    text-decoration: none;
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

  .company_modal .btn_group .company_refuse {
    background-color: rgb(240, 186, 196);
    color: #eee;
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
    z-index: 2;
  }

  .admin_overlay.active {
    opacity: 1;
    visibility: visible;
    pointer-events: all;
  }

  .btn-close,
  .notice_btn-close,
  .notice_create_btn-close {
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
    background-color: rgb(245, 103, 131);
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

  .admin_hashtag_wrap {
    display: flex;
    flex-wrap: wrap;
    width: 300px;
    border: 1px solid #e5e5e5;
    border-radius: 8px;
    margin-bottom: 10px;
    margin-top: 10px;
  }

  .admin_hashtag_wrap > .hashtag_content {
    padding: 3px 10px;
    margin: 5px 6px;
    border-radius: 12px;
    border: 0;
    background-color: var(--light-gray);
    color: #E55604;
    font-size: 9pt;
  }

  .hashtag_create_title {
    margin-bottom: 10px;
  }

  #codeContent {
    outline: none;
    border: 0;
    width: 210px;
    height: 20px;
  }

  #create_btn {
    outline: none;
    width: 70px;
    border: 0;
    border-radius: 5px;
    background-color: #E55604;
    color: #fff;
    padding: 5px;
    cursor: pointer;
    margin-left: 10px;
  }

  #create_btn:hover {
    background-color: #ee9d6e;
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
    .notice_view_container,
    .modify_container,
    .report_view_container,
    .member_activity_log_modal {
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

    .member_activity_log_modal {
      height: 700px;
      overflow: auto;
    }

    .create_container.active,
    .notice_view_container.active,
    .modify_container.active,
    .report_view_container.active,
    .member_activity_log_modal.active {
			visibility: visible;
			opacity: 1;
			transform: translate(-50%, -50%);
	}

    .create_container > *,
    .notice_view_container > *,
    .modify_container > *,
    .report_view_container > * {
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

    .notice_view_overlay,
    .notice_create_overlay,
    .notice_modify_overlay,
    .report_view_overlay,
    .member_activity_log_overlay  {
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
    
    .notice_view_overlay.active,
    .notice_create_overlay.active,
    .notice_modify_overlay.active,
    .report_view_overlay.active,
    .member_activity_log_overlay.active {
      opacity: 1;
      pointer-events: all;
    }

    .btn-close,
    .notice_btn-close,
    .notice_modify_btn-close,
    .report_close_btn,
    .member_activity_log_close_btn {
        position: absolute;
        top: 6px;
        right: 10px;
        background-color: transparent;
        font-size: 18px;
        color: #888;
        cursor: pointer;
    }

    .btn-close:hover,
    .notice_btn-close:hover,
    .notice_modify_btn-close:hover,
    .report_close_btn:hover
    .member_activity_log_close_btn:hover {
        color: #191919;
    }

    .create_title {
        text-align: center;
    }

    #postTitle,
    #postTitle_mdfy {
        border: 0px;
        background-color: #e9f3ff;
        width: 100%;
        height: 35px;
        padding: 0 15px;
        outline: none;
        color: #333;
    }

    .member_activity_log_wrap h1 {
      margin-bottom: 15px;
    }

    .member_activity_log_head,
    .activity_content {
      display: flex;
      justify-content: space-around;
      margin-bottom: 10px;
    }

    .member_activity_log_head div:first-child,
    .activity_content div:first-child {
      width: 180px;
      text-align: center;
    }

    .member_activity_log_head div:last-child,
    .activity_content div:last-child {
      width: 80px;
      text-align: center;
    }

    .activity_content a {
      color: #4052f7;
    }

    #noticeContent,
    .notice_modify_content {
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
    #noticeContent::placeholder,
    #postTitle_mdfy::placeholder,
    .notice_modify_content::placeholder {
        color: #bbb;
    }

    #postTitle:focus::placeholder,
    #noticeContent:focus::placeholder,
    #postTitle_mdfy::placeholder,
    #notice_modify_content::placeholder {
        visibility: hidden;
    }

    .date_wrap {
        display: flex;
        justify-content: space-around;
        align-items: center;
    }

    .dateSelector1,
    .dateSelector2,
    .modify_dateSelector1,
    .modify_dateSelector2 {
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

    .notice_submit_btn,
    .modify_submit_btn {
        background-color: #e9f3ff;
        border: 0px;
        padding: 5px 10px;
        border-radius: 5px;
        color: #4052f7;
        font-weight: bold;
        text-align: center;
    }

    .notice_post_title_label,
    .notice_post_content_label {
      display: block;
      margin-bottom: 10px;
      color: #888;
    }
 

  .report_view_container h1 {
    text-align: center;
    margin-bottom: 20px;
  }

  .report_view_grid {
    display: grid;
    grid-template-columns: 120px 300px;
    grid-template-rows: 40px 40px 40px 40px 40px 40px 40px 40px 150px 40px 40px;
    gap: 10px;
    align-items: center;
  }

  .report_view_container .report_member,
  .report_view_container .report_received_member {
    display: flex;
    justify-content: space-between;
  }

  .report_view_container .punishment_btn_wrap,
  .report_btn_wrap {
    display: flex;
    justify-content: flex-end;
    padding: 0;
  }

  .report_view_container .punishment_btn_wrap button,
  .report_btn_wrap button {
    margin-left: 5px;
    border: 1px solid #ffafaf;
    color: #e05454;
    font-size: 9pt;
  }
  
  .report_container .report_confirm div {
    display: inline-block;
    text-align: center;
    width: 70px;
    color: var(--dark);
  }

  .report_container .report_confirm.progressing div {
    color: red;
    font-weight: bold;
  }

  .report_container .report_view_btn,
  .report_view_container .report_content_id {
    cursor: pointer;
  }

  .report_view_container .report_content_id {
    color: #4052f7;
  }

  .report_view_grid * {
    padding: 5px;
  }

  .report_view_grid label {
    color: #888;
    font-size: 10pt;
  }

  .report_view_grid .attached_img {
    overflow: auto;
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
      <li class="admin_main_list"><button class="mainmenu_btn">회원</button>
        <ul class="admin_submenu">
          <li><button class="admin_person_btn">개인</button></li>
          <li><button class="admin_company_btn">기업</button></li>
        </ul>
      </li>
      <li class="admin_main_list"><button class="mainmenu_btn">게시글</button>
        <ul class="admin_submenu">
          <li><button class="admin_freeboard_btn">자유 게시판</button></li>
          <li><button class="admin_qnaboard_btn">질답 게시판</button></li>
          <li><button class="admin_companynews_btn">기업소식 게시판</button></li>
          <li><button class="admin_algorithm_btn">알고리즘 게시판</button></li>
        </ul>
      </li>
      <li class="admin_main_list"><button class="mainmenu_btn">통합</button>
        <ul class="admin_submenu">
          <li><button class="admin_notice_btn">공지</button></li>
          <li><button class="admin_report_btn">신고</button></li>
          <li><button class="admin_hashtag_btn">공통코드</button></li>
        </ul>
      </li>
      <li class="admin_main_list"><button class="mainmenu_btn">환경설정</button>
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
          <div class="desc-header_left">
            <div>일반 회원 명단</div>
            <div class="admin_member_manage_toggle_wrap">
              <button class="admin_general_mode selected">일반조회</button>
              <button class="admin_tier_mode">티어관리</button>
            </div>
          </div>
          <div class="admin_general_member_search_wrap">
            <input class="admin_general_member_input" type="text" placeholder="홍길동"/>
            <button class="admin_general_member_search">검색</button>
            <a class="export_btn small" href="/generalmember/excel/download">엑셀다운로드</a>
          </div>
        </div>
        <button class="btn-close">&times;</button>
        <div class="desc-title">
          <!-- 일반 조회 시 -->
          <div class="member_container selected">
            <div class="profile_group_title">
              <span>이미지</span>
              <div class="member_info">회원 정보</div>
              <div class="tier">티어</div>
              <div class="admin_member_warn_title">경고</div>
              <div class="admin_member_withdraw_title">탈퇴</div>
            </div>
          </div>
          <!-- 티어 조회 시 -->
          <div class="tier_management_head">
            <div class="profile_tier_group_title">
              <span>번호</span>
              <div class="member_info">회원 이메일</div>
              <div class="member_tier_score_title">점수</div>
              <div class="current_tier_title">현재 티어</div>
              <div class="next_tier_title">다음 티어</div>
              <div class="admin_member_tier_log_btn_title">활동내역</div>
              <div class="admin_member_tier_upgrade_access_btn_title">승인</div>
              <div class="admin_member_tier_upgrade_deny_btn_title">거절</div>
            </div>
          </div>
        </div>
        <div class="desc-content"></div>
      </div>
    </div>
  </div>

  <!-- 회원 티어 승급 활동 내역 조회 모달 -->
  <div class="member_activity_log_modal">
    <div class="member_activity_log_close_btn">&times;</div>
    <div class="member_activity_log_wrap">
      <h1>멤버 활동 내역 조회</h1>
      <div class="member_activity_log_head">
        <div>게시글 번호</div>
        <div>활동 타입</div>
      </div>
      <div class="member_activity_log_content"></div>
    </div>
  </div>
  <div class="member_activity_log_overlay"></div>

  <!-- 기업 계정 관리 모달 -->
  <div class="company_modal">
    <div class="company_modal_content">
      <div class="desc">
        <div class="desc-header">
          <div>기업명단</div>
          <div class="admin_company_search_wrap">
            <input class="admin_company_member_input" type="text" placeholder="기업 이름 및 이메일"/>
            <button class="admin_company_member_search">검색</button>
            <a class="export_btn small" href="/companymember/excel/download">엑셀다운로드</a>
          </div>
          <button class="btn-close">&times;</button>
        </div>
        <div class="desc-title">
          <div class="company_container">
            <div class="profile_group_title">
              <div>이미지</div><div class="member_info">회원 정보</div><div class=tier>승인여부</div><div class="withdraw_txt">탈퇴</div>
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
      <div class="notice_create_btn-close">&times;</div>
      <h1 class="create_title">공지 생성</h1>
      <div>
        <label for="postTitle" class="mb10">제목</label>
        <input type="text" name="postTitle" id="postTitle" placeholder="제목을 입력해주세요"/>
        <!-- <form:errors path="postTitle" element="div" cssClass="errors" /> -->
      </div>
      <label for="noticeContent" class="mb10">내용</label>
      <div>
        <textarea name="noticeContent" id="editor1" placeholder="내용을 입력해주세요."></textarea>
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
        <input type="submit" value="생성" class="notice_submit_btn"/>
      </div>
    </div>
  </form:form>
  <div class="notice_create_overlay"></div>

  <!-- 공지 수정 폼 -->
  <form:form modelAttribute="noticeVO" method="post" action="/notice/modify">
    <div class="modify_container">
      <input type="hidden" name="noticeId" class="notice_id">
      <div class="notice_modify_btn-close">&times;</div>
      <h1 class="create_title">공지 수정</h1>
      <div>
        <label for="postTitle" class="mb10">제목</label>
        <input type="text" name="postTitle" id="postTitle_mdfy" class="notice_modify_title" placeholder="제목을 입력해주세요"/>
        <!-- <form:errors path="postTitle" element="div" cssClass="errors" /> -->
      </div>
      <label for="noticeContent" class="mb10">내용</label>
      <div>
        <textarea name="noticeContent" id="editor2" class="notice_modify_content" placeholder="내용을 입력해주세요."
                  value="${noticeVO.noticeContent}"></textarea>
        <!-- <form:errors path="postTitle" element="div" cssClass="errors" /> -->
      </div>
      <div class="date_wrap">
        <label for="start-date_mdfy">시작일</label>
        <input class="modify_dateSelector1" placeholder="시작 날짜" id="start-date_mdfy"
                name="releaseStartDate" value="${noticeVO.releaseStartDate}"/>
        <span>~</span>
        <label for="end-date_mdfy">종료일</label>
        <input class="modify_dateSelector2" placeholder="종료 날짜" id="end-date_mdfy"
                name="releaseEndDate" value="${noticeVO.releaseEndDate}"/>
      </div>
      <div class="submit_btn_wrap">
        <input type="submit" value="수정" class="modify_submit_btn"/>
      </div>
    </div>
  </form:form>
  <div class="notice_modify_overlay"></div>

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
            <input type="text" class="admin_report_input" placeholder="내용 또는 사유 검색"/>
            <button class="admin_report_search">검색</button>
          </div>
        </div>
        <div class="desc_title">
          <div class="report_container">
            <div class="report_title">
              <div>신고번호</div><div>처리진행상황</div><div>내용</div><div>신고사유</div><div>신고일자</div>
            </div>
          </div>
        </div>
        <div class="desc-content"></div>
      </div>
    </div>
  </div>

  <!-- 신고 상세 조회 모달 -->
  <div class="report_view_container">
    <div class="report_close_btn">&times;</div>
    <h1>신고물 조회</h1>
    <div class="report_view_grid">
      <label for="report_id">신고ID</label>
      <div class="detail_report_id"></div>
      <label for="detail_report_date">신고 날짜</label>
      <div class="detail_report_date"></div>
      <label for="report_member">신고한 유저</label>
      <div class="report_member">
        <div class="punishment_btn_wrap">
          <button class="report_btn member_warn">경고누적</button>
          <button class="report_btn report_member_withdraw">회원탈퇴</button>
        </div>
      </div>
      <label for="report_received_member">신고당한 유저</label>
      <div class="report_received_member">
        <div class="punishment_btn_wrap">
          <button class="report_btn member_warn">경고누적</button>
          <button class="report_btn received_report_member_withdraw">회원탈퇴</button>
        </div>
      </div>
      <label for="report_content_id">신고물 ID</label>
      <div class="report_content_id"></div>
      <label for="report_type">신고 유형</label>
      <div class="report_type"></div>
      <label for="detail_report_reason">신고 사유</label>
      <div class="detail_report_reason"></div>
      <label for="report_reason_content">신고 상세 사유</label>
      <div class="report_reason_content"></div>
      <label for="attached_img">첨부 파일</label>
      <div class="attached_img"></div>
      <label for="progress_yn">처리 여부</label>
      <div class="progress_yn"></div>
      <div></div>
      <div class="report_btn_wrap">
        <button>처리상태 변경</button>
      </div>
    </div>
  </div>
  <div class="report_view_overlay"></div>

  <!-- 해시태그 관리 모달 -->
  <div class="hashtag_modal">
    <div class="hashtag_modal_content">
      <button class="btn-close">&times;</button>
      <div class="desc">
        <div>
          <strong>공통코드 목록</strong>
        </div>
        <div class="admin_hashtag_wrap"></div>
        <div class="hashtag_create_title"><strong>공통코드 생성</strong></div>
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
    $('.report_modal, .admin_overlay').removeClass('active')
  })

  $('body').keyup(function(e) {
    if (e.key === 'Escape') {
      $('.personal_modal, .admin_overlay').removeClass('active')
      $('.company_modal, .admin_overlay').removeClass('active')
      $('.hashtag_modal, .admin_overlay').removeClass('active')
      $('.notice_modal, .admin_overlay').removeClass('active')
      $('.report_modal, .admin_overlay').removeClass('active')
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

  // 신고 관리 목록 열기
  $('.admin_report_btn').click(function() {
    $('.report_modal, .admin_overlay').addClass('active')
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
        let tier = ''
        let member = response[i]
        
        // 멤버 티어 get
        $.get(`/admin/member/tier/\${member.email}`, function(tier_response) {
          tier = tier_response.tierName
          
          generalMemberTemplate = 
            `<div class="member_container_body">
              <div class="profile_group">
                <img src="/member/file/download/\${member.email}" onerror="this.src='/images/gray_man.png';" >
                <div class="member_info"><a href="/memberinfo/view/\${member.email}" target="_blank" class="admin_anchor">\${member.nickname}(\${member.email})</a></div>
                <div class="tier">\${tier}</div>
                <button class="admin_member_warn_btn">경고</button>
                <button class="general_member_withdraw_btn" id="\${member.email}">탈퇴</button>
              </div>
            </div>`
          generalMemberTemplateDom = $(generalMemberTemplate)
          
          if (member.nickname.includes(val) || member.email.includes(val)) {
            $('.personal_modal').find('.desc-content').append(generalMemberTemplateDom)
          }
        })
      }
    })
  }
  loadGeneralTypeMember()

  // 회원 티어 관리 모드 조회
  function loadMemberTierManagement(val = '') {
    $.get('/admin/management/tier', function(response) {
      $('.personal_modal').find('.desc-content').empty()

      for (let i = 0; i < response.length; i++) {
        let member = response[i]

        let tierManagementTemplate = `
        <div class="tier_management_body">
          <div class="profile_tier_group">
            <div class="tier_row_num">\${response.length - i}</div>
            <div class="member_info"><a href="/memberinfo/view/\${member.memberEmail}" target="_blank" class="admin_anchor">\${member.memberEmail}</a></div>
            <div class="member_tier_score">\${member.score}</div>
            <div class="current_tier">\${member.tierVO.tierName}</div>
            <div class="next_tier">\${member.tierVOTemp.tierNameTemp}</div>
            <button class="admin_member_tier_log_btn" data-email="\${member.memberEmail}">활동내역</button>
            <button class="admin_member_tier_upgrade_access_btn" data-email="\${member.memberEmail}" data-tier-id="\${member.tierVOTemp.tierIdTemp}">승인</button>
            <button class="admin_member_tier_upgrade_deny_btn" data-email="\${member.memberEmail}" data-tier-id="\${member.tierVOTemp.tierIdTemp}">거절</button>
          </div>
        </div>`

        let tierManagementTemplateDom = $(tierManagementTemplate)

        if (member.memberEmail.includes(val)) {
          $('.personal_modal').find('.desc-content').append(tierManagementTemplateDom)
        }
      }
    })
  }

  // 일반 회원 관리 모드 변경
  $('.admin_general_mode').click(function() {
    $('.admin_general_mode').addClass('selected')
    $('.member_container').addClass('selected')
    $('.admin_tier_mode').removeClass('selected')
    $('.tier_management_head').removeClass('selected')
    loadGeneralTypeMember()
  })

  $('.admin_tier_mode').click(function() {
    $('.admin_tier_mode').addClass('selected')
    $('.tier_management_head').addClass('selected')
    $('.admin_general_mode').removeClass('selected')
    $('.member_container').removeClass('selected')
    loadMemberTierManagement()
  })

  // 일반 회원 검색
  $('.admin_general_member_search').click(function() {
    if ($('.personal_modal').find('.admin_general_mode').hasClass('selected')) {
      let val = $('.admin_general_member_input').val()
      loadGeneralTypeMember(val)
    }
    else if ($('.personal_modal').find('.admin_tier_mode').hasClass('selected')) {
      let val = $('.admin_general_member_input').val()
      loadMemberTierManagement(val)
    }
  })

  $('.admin_general_member_input').keyup(function(e) {
    if ($('.personal_modal').find('.admin_general_mode').hasClass('selected') && e.key === 'Enter') {
      let val = $('.admin_general_member_input').val()
      loadGeneralTypeMember(val)
    }
    else if ($('.personal_modal').find('.admin_tier_mode').hasClass('selected') && e.key === 'Enter') {
      let val = $('.admin_general_member_input').val()
      loadMemberTierManagement(val)
    }
  })

  // 일반 회원 경고 조치
  $(document).on('click', '.admin_member_warn_btn', function() {
  	Swal.fire({
     	  text: "경고 1회 적립",
     	  icon: "warning"
     	});
  })

  // 일반 회원 탈퇴 조치
  $(document).on('click', '.general_member_withdraw_btn', function(e) {
    let email = $(this).attr('id')
    let url = '/home/admin/person/delete/' + email
     $.get(url, function(response) {
       if (response.result === 'success') {
       	Swal.fire({
          	  text: "탈퇴처리 하였습니다.",
          	  icon: "success"
          	});
         $('.personal_modal').find('.desc-content').empty()
         loadGeneralTypeMember()
       }
     })
  })

  // 일반 회원 승급 활동 내역 조회
  $(document).on('click', '.admin_member_tier_log_btn', function() {
    let email = $(this).data('email')
    $.get(`/admin/management/tier/log/\${email}`, function(response) {

      for (let i = 0; i < response.length; i++) {
        let activity = response[i]
        let postId = activity.GENERAL_POST_ID

        let tierActivityLogTemplate = `
          <div class="activity_content">
            <div><a href="/freeboard/view/\${postId}" target="_blank">\${postId}</a></div>
            <div>\${activity.TYPE}</>
          </div>`
        
        tierActivityLogTemplateDom = $(tierActivityLogTemplate)
        $('.member_activity_log_modal').find('.member_activity_log_content').append(tierActivityLogTemplateDom)

        $('.member_activity_log_modal, .member_activity_log_overlay').addClass('active')

        $('.member_activity_log_close_btn, .member_activity_log_overlay').click(function() {
          $('.member_activity_log_modal, .member_activity_log_overlay').removeClass('active')
        })
      }
    })
  })

  // 일반 회원 승급 승인 처리
  $(document).on('click', '.admin_member_tier_upgrade_access_btn', function() {
    let body = {
      memberEmail: $(this).data('email'),
      tierId: $(this).data('tier-id'),
    }

     $.post('/admin/management/tier/upgrade', body, function(response) {

       if (response.result === 'success') {
       	Swal.fire({
          	  text: "성공적으로 승급처리하였습니다",
          	  icon: "success"
          	});
         loadMemberTierManagement()
       }
       else {
       	Swal.fire({
          	  text: "승급처리를 성공하지 못했습니다",
          	  icon: "error"
          	});
       }
     })
  })

  // 일반 회원 승급 거절 처리
  $(document).on('click', '.admin_member_tier_upgrade_deny_btn', function() {

   	Swal.fire({
      	  text: "거절 처리 성공",
      	  icon: "success"
      	});
     loadMemberTierManagement()
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
              <img src="/member/file/download/\${company.email}" onerror="this.src='/images/gray_man.png';" /><div class="company_info">
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
     $.post(url, body, function(response) {
   	  Swal.fire({
        	  text: "승인 처리 성공!",
        	  icon: "success"
        	});
       $('.company_modal').find('.desc-content').empty()
       loadCompanytypeMember()
     })
  })
  
  // 기업 반려 처리
  $(document).on('click', '.company_refuse', function() {
    let body = {
      companyEmail: $(this).attr('id'),
      val: 'refuse'
    }
    let url = '/admin/companymember'
     $.post(url, body, function(response) {
       alert('반려 처리되었습니다.')
       $('.company_modal').find('.desc-content').empty()
       loadCompanytypeMember()
     })
  })

  // 기업 회원 탈퇴 조치
  $(document).on('click', '.company_member_withdraw_btn', function(e) {
    let email = $(this).attr('id')
    let url = '/home/admin/person/delete/' + email
     $.get(url, function(response) {
       if (response.result === 'success') {
       	Swal.fire({
          	  text: "탈퇴 처리 성공!",
          	  icon: "success"
          	});
         $('.company_modal').find('.desc-content').empty()
         loadCompanytypeMember()
       }
     })
  })

  // 공지 사항 목록 조회
  function loadAdminNoticeList(val = '') {
    $.get('/admin/noticelist', function(response) {
      $('.notice_modal').find('.desc-content').empty()
      
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
    	Swal.fire({
       	  text: "이 공지는 만료됐습니다. 날짜를 수정 해주세요",
       	  icon: "error"
       	});
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
	  Swal.fire({
     	  text: "삭제된 공지입니다만?!",
     	  icon: "error"
     	});
  })

  // 공지 조회 기능(제목 클릭)
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
  CKEDITOR.ClassicEditor.create(document.getElementById("editor2"), {
    toolbar: {
      items: [
        'findAndReplace', 'selectAll', '|',
        'bold', 'italic', 'strikethrough', 'underline', 'removeFormat', '|',
        'bulletedList', 'numberedList', 'todoList', '|',
        'outdent', 'indent', '|',
        'undo', 'redo', 'fontSize', 'alignment', 'insertImage'
      ],
      shouldNotGroupWhenFull: true
    },
    removePlugins: [
      'CKBox',
      'CKFinder',
      'EasyImage',
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
      'MathType'
    ]
  })
  .then(editor => {
    $(document).on('click', '.notice_modify_btn', function() {
      $('.modify_container, .notice_modify_overlay').addClass('active')
      let id = $(this).data('id')
  
      $.get(`/admin/notice/view/\${id}`, function(response) {
        let startDate = new Date(response.releaseStartDate)
        let startYear = startDate.getFullYear()
        let startMonth = (startDate.getMonth() + 1).toString().padStart(2, '0')
        let startDay = startDate.getDate().toString().padStart(2, '0')
        let formattedStartDate = `\${startYear}-\${startMonth}-\${startDay}`
  
        let endDate = new Date(response.releaseEndDate)
        let endYear = endDate.getFullYear()
        let endMonth = (endDate.getMonth() + 1).toString().padStart(2, '0')
        let endDay = endDate.getDate().toString().padStart(2, '0')
        let formattedEndDate = `\${endYear}-\${endMonth}-\${endDay}`
        
        $('.modify_container').find('.notice_id').val(id)
        $('.notice_modify_title').val(response.postTitle)
        // $('.notice_modify_content').val(response.noticeContent)
        $('.modify_dateSelector1').val(formattedStartDate)
        $('.modify_dateSelector2').val(formattedEndDate)
  
        editor.setData(response.noticeContent)
  
  
        $('.modify_container, .notice_modify_overlay').addClass('active')
  
        $('.notice_modify_btn-close, .notice_modify_overlay').click(function() {
          $('.modify_container, .notice_modify_overlay').removeClass('active')
        })
      })
    })

  })

  // 공지 삭제 기능
  $(document).on('click', '.notice_delete_btn', function() {
    let noticeId = $(this).data('id')
  
    $.get(`/notice/delete/\${noticeId}`, function(response) {
      if (response.result === 'success') {
      	Swal.fire({
         	  text: "삭제 성공!",
         	  icon: "success"
         	});
        loadAdminNoticeList()
      }
      else {
      	Swal.fire({
         	  text: "삭제 실패!",
         	  icon: "warning"
         	});
      }
    })
  })

  // 신고 목록 조회
  function loadReportList(val = '') {
    $.get('/admin/reportlist', function(response) {
      $('.report_modal').find('.desc-content').empty()

      let reportTemplate, reportTemplateDom

      for (let i = 0; i < response.length; i++) {
        report = response[i]
        report_reason = report.commonCodeVO.codeContent

        if (report.reportReasonContent === null) {
          report.reportReasonContent = '[내용 없음]'
        }
        reportTemplate = `
        <div class="report_container">
          <div class="report_list_group">
            <div class="report_id">\${response.length - i}</div>
            <div class="report_confirm">
              <div>\${report.progressYn}</div>
            </div>
            <div class="report_content">
              <span class="report_view_btn" data-id="\${report.reportId}" data-progress="\${report.progressYn}">
                \${report.reportReasonContent}
              </span>
            </div>
            <div class="report_reason">\${report_reason}</div>
            <div class="report_date">
              \${report.reportDate}
            </div>
          </div>
        </div>`
        reportTemplateDom = $(reportTemplate)

        if (reportTemplateDom.find('.report_view_btn').data('progress') === 'Y') {
          reportTemplateDom.find('.report_view_btn').css('color', 'var(--gray)')
        }
        else {
          reportTemplateDom.find('.report_view_btn').css('font-weight', 'bold')
        }

        if (report.reportReasonContent.includes(val) || report_reason.includes(val)) {
          $('.report_modal').find('.desc-content').append(reportTemplateDom)
        }
        if (reportTemplateDom.find('.report_confirm').text().trim() === 'N') {
          reportTemplateDom.find('.report_confirm').addClass('progressing')
        }
      }
    })
  }

  loadReportList()

  // 신고글 검색
  $('.admin_report_search').click(function() {
    let val = $('.admin_report_input').val()
    loadReportList(val)
  })

  $('.admin_report_input').keyup(function(e) {
    if (e.key === 'Enter') {
      let val = $('.admin_report_input').val()
      loadReportList(val)
    }
  })

  // 신고 상세 조회
  $(document).on('click', '.report_view_btn', function() {
    $(this).data('progress')
    if ($(this).data('progress') === 'Y') {
    	Swal.fire({
       	  text: "이미 처리가 완료된 건입니다만?!",
       	  icon: "warning"
       	});
    }
    else {
      let reportId = $(this).data('id')
  
      $.get(`/admin/report/view/\${reportId}`, function(response) {
        $('.detail_report_id').html('')
        $('.detail_report_id').html(response.reportId)
        $('.detail_report_date').html('')
        $('.detail_report_date').html(response.reportDate)
        $('.report_member').contents().filter(function() {
          return this.nodeType === 3
        }).remove()
        $('.report_member').prepend(response.reportMember)

        $('.report_received_member').contents().filter(function() {
          return this.nodeType === 3
        }).remove()
        $('.report_received_member').prepend(response.receivedReportMember)
        $('.report_content_id').html('')
        $('.report_content_id').html(response.reportContentId)
        $('.report_type').html('')
        $('.report_type').html(response.commonCodeVOTemp.codeContentTemp)
        $('.detail_report_reason').html('')
        $('.detail_report_reason').html(response.commonCodeVO.codeContent)
        $('.report_reason_content').html('')
        $('.report_reason_content').html(response.reportReasonContent)
        $('.attached_img').html('')
        $('.attached_img').html(response.attachedImg)
        $('.progress_yn').html('')
        $('.progress_yn').html(response.progressYn)
      })

      // 신고 게시글로 이동
      $('.report_content_id').click(function() {
        let reportContentId = $('.report_content_id').html()
        window.open(`/freeboard/view/\${reportContentId}`, 'DevGround')
      })

      // 멤버 경고
      $('.report_btn.member_warn').click(function() {
    	  Swal.fire({
         	  text: "경고를 주었습니다",
         	  icon: "success"
         	});
      })

      // 회원 탈퇴
      $('.report_member_withdraw').click(function() {
        let emailNode = $(this).closest('.report_member').contents().filter(function() {
          return this.nodeType === 3
        })

        let url = '/home/admin/person/delete/' + emailNode[0].nodeValue
        
        $.get(url, function(response) {
          if (response.result === 'success') {
        	  Swal.fire({
             	  text: "탈퇴 처리 성공",
             	  icon: "success"
             	});
          }
          else {
        	  Swal.fire({
             	  text: "탈퇴 처리 실패",
             	  icon: "error"
             	});
          }
        })
      })

      $('.received_report_member_withdraw').click(function() {
        let emailNode = $(this).closest('.report_received_member').contents().filter(function() {
          return this.nodeType === 3
        })

        let url = '/home/admin/person/delete/' + emailNode[0].nodeValue
        $.get(url, function(response) {
          if (response.result === 'success') {
            Swal.fire({
             	  text: "탈퇴 처리 성공!",
             	  icon: "success"
             	});
          }
          else {
            Swal.fire({
             	  text: "탈퇴 처리 실패!",
             	  icon: "error"
             	});
          }
        })
      })

      $('.report_btn_wrap button').click(function() {
        let reportId = $(this).closest('.report_view_container').find('.detail_report_id').html()

        $.get(`/admin/report/progress/\${reportId}`, function(response) {
          if (response.result === 'success') {
            Swal.fire({
              text: "처리 완료",
              icon: "success"
            });
            $('.report_close_btn').trigger('click')
            loadReportList()
          }
        })
      })
  
      $('.report_view_container, .report_view_overlay').addClass('active')
  
      $('.report_close_btn, .report_view_overlay').click(function() {
        $('.report_view_container, .report_view_overlay').removeClass('active')
      })
    }
  })

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
    	Swal.fire({
         	  text: "탈퇴 처리 실패!",
         	  icon: "warning"
         	});
    }

    else {
      $.post(
        "/code/create/해시태그",
        body,
        function(response) {
        let result = response.result
        if (result) {
          load_hashtag()
          Swal.fire({
         	  text: "해시태그 입력 성공",
         	  icon: "success"
         	});
          $('#codeContent').val('')
        }
        else {
        	Swal.fire({
           	  text: "해시태그 입력 실패",
           	  icon: "warning"
           	});
        }
      })
    }
  })

  // 해시태그 목록 출력
  load_hashtag = function() {
    $('.admin_hashtag_wrap').html('')
    $.get('/code/해시태그', function(response) {
      for (let i = 0; i < response.length; i++) {
        let template = `<div class="hashtag_content">
                          \${response[i].codeContent}
                        </div>`
        let templateDom = $(template)
        $('.admin_hashtag_wrap').append(templateDom)
      }
    })
  }

  load_hashtag()

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

  $('.modify_dateSelector1').flatpickr({
      minDate: 'today',
      local: 'ko'
  })

  $('.modify_dateSelector2').flatpickr({
      minDate: 'today',
      local: 'ko'
  })
  // 달력 포맷 끝

  // 공지 생성 모달 실행을 위한 문장
  $('.create_notice').click(function() {
      $('.create_container, .notice_create_overlay').addClass('active')
  })

  $('.notice_create_btn-close, .notice_create_overlay').click(function() {
      $('.create_container, .notice_create_overlay').removeClass('active')
  })

  $('.dateSelector1').click(function() {
  })

  // ck 에디터
  CKEDITOR.ClassicEditor.create(document.getElementById("editor1"), {
    toolbar: {
      items: [
        'findAndReplace', 'selectAll', '|',
        'bold', 'italic', 'strikethrough', 'underline', 'removeFormat', '|',
        'bulletedList', 'numberedList', 'todoList', '|',
        'outdent', 'indent', '|',
        'undo', 'redo', 'fontSize', 'alignment', 'insertImage'
      ],
      shouldNotGroupWhenFull: true
    },
    removePlugins: [
      'CKBox',
      'CKFinder',
      'EasyImage',
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
      'MathType'
    ]
  });

// 유효성 체크
$('.notice_submit_btn').addClass('inactive')
$('.notice_submit_btn').prop('disabled', true)
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
        $('.notice_submit_btn').addClass('inactive')
        $('.notice_submit_btn').prop('disabled', true)
    }
    else if (end_date < formattedToday || 
             end_date < start_date) {
        $('.title_message').remove()
        $('.notice_submit_btn').addClass('inactive')
        $('.notice_submit_btn').prop('disabled', true)
    }
    else {
        $('.title_message').remove()
        $('.notice_submit_btn').prop('disabled', false)
        $('.notice_submit_btn').removeClass('inactive')
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
        $('.notice_submit_btn').addClass('inactive')
        $('.notice_submit_btn').prop('disabled', true)
    }
    else if ($('#postTitle').val().trim() === '') {
        $('.date_message').remove()
        $('.notice_submit_btn').addClass('inactive')
        $('.notice_submit_btn').prop('disabled', true)
    }
    else {
        $('.date_message').remove()
    }
})
</script>