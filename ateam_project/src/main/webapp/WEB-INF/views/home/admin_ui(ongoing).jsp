<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업용 관리자 ui</title>
<script src="/js/lib/jquery-3.7.1.js"></script>
</head>
<style>
  .business_license {
    text-decoration: none;
    color: #67869b;
    font-size: 8pt;
    padding: 2px;
  }
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
  .hashtag_modal {
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
  }

  .personal_modal.active,
  .company_modal.active,
  .hashtag_modal.active {
    opacity: 1;
    visibility: visible;
    transform: translate(-50%, -50%) scale(1);
  }

  .personal_modal_content,
  .company_modal_content,
  .hashtag_modal_content  {
    display: flex;
    border-radius: 5px;
    overflow: hidden;
    background-color: #eee;
    box-shadow: 0 0 10px rgba(12, 12, 12, 0.178);
  }

  .personal_modal_content > div,
  .company_modal_content > div,
  .hashtag_modal > div {
    padding: 20px;
  }

  .desc-header {
    float: right;
    margin: 15px 0;
  }

  .member_container,
  .company_container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 615px;
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

  .company_modal .profile_group {
    display: grid;
    grid-template-columns: 45px 350px 160px 60px;
    align-items: center;
  }

  .company_modal .profile_group_title {
    display: grid;
    grid-template-columns: 45px 350px 160px 60px;
    align-items: center;
    color: #888;
  }

  .profile_group > img {
    margin-right: 15px;
    width: 30px;
    height: 30px;
  }

  .profile_group .tier {
    margin-left: 20px;
    text-align: center;
  }

  .profile_group_title .tier {
    margin-left: 20px;
    text-align: center;
  }

  .profile_group .member_info,
  .profile_group .company_info {
    font-weight: bold;
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
  
  .company_modal .btn_group .confirm_complete {
    background-color: #888;
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

  .btn-close {
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
          <input type="text" placeholder="홍길동"/>
          <button class="admin_general_member_search">검색</button>
          <button class="btn-close">&times;</button>
        </div>
        <div class="desc-title">
          <div class="member_container">
            <div class="profile_group_title">
              <span>이미지</span> <div class="member_info" style="text-align: center;">회원 정보</div><div class=tier>티어</div>
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
        <input type="text" placeholder="홍길동"/>
        <button class="admin_company_member_search">검색</button>
        <button class="btn-close">&times;</button>
      </div>
      <div class="desc-title">
        <div class="company_container">
          <div class="profile_group_title">
            <span>이미지</span> <div class="member_info" style="text-align: center;">회원 정보</div><div class=tier>승인여부</div>
            <div class="btn_group">
            </div>
          </div>
        </div>
      </div>
      <div class="desc-content"></div>
    </div>
  </div>
</div>

<!-- 공지 관리 모달 -->
<div class="notice_modal"></div>

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
  })

  $('body').keyup(function(e) {
    if (e.key === 'Escape') {
      $('.personal_modal, .admin_overlay').removeClass('active')
      $('.company_modal, .admin_overlay').removeClass('active')
      $('.hashtag_modal, .admin_overlay').removeClass('active')
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

  // 해시태그 목록 목록 열기
  $('.admin_hashtag_btn').click(function() {
    $('.hashtag_modal, .admin_overlay').addClass('active')
  })

  // 일반 회원 조회
  function loadGeneralTypeMember() {
    $.get('/home/admin/person', function(response) {
      for (let i = 0; i < response.length; i++) {
          let member = response[i]
          generalMemberTemplate = 
              `<div class="member_container">
                  <div class="profile_group">
                  <img src="\${member.profilePic}" alt="."><div class="member_info">\${member.nickname}(\${member.email})</div><div class=tier>\${member.generalMemberVO.tierId}</div>
                  <div class="btn_group">
                      <button>경고</button>
                      <button class="general_member_withdraw_btn" id="\${member.email}">탈퇴</button>
                  </div>
                  </div>
              </div>`
          generalMemberTemplateDom = $(generalMemberTemplate)
          
          $('.personal_modal').find('.desc-content').append(generalMemberTemplateDom)
      }
    })
  }
  loadGeneralTypeMember()

  // 일반 회원 탈퇴 조치
  $(document).on('click', '.general_member_withdraw_btn', function(e) {
    let email = $(this).attr('id')
    let url = '/home/admin/person/delete/' + email
    if (confirm('정말 탈퇴 시키겠습니까?')) {
      $.get(url, function(response) {
        if (response.result === 'success') {
          alert('탈퇴가 완료되었습니다.')
          $('.desc-content').empty()
          loadGeneralTypeMember()
        }
      })
    }
  })

  // 기업 회원 조회
  function loadCompanytypeMember() {
    $.get('/home/admin/company', function(response) {
      console.log(response)
      for (let i = 0; i < response.length; i++) {
          let company = response[i]
          let companyTemplateDom
          if (company.companyInfoVO.confirmYn === 'N') {
            let companyTemplate = 
              `<div class="company_container">
                <div class="profile_group">
                <img src="\${company.profilePic}" alt="."><div class="company_info">
                  \${company.nickname}(\${company.email})
                  <a href='\${company.companyInfoVO.companyRegistCertificateUrl}' download='\${company.nickname}'" class="business_license">[사업자등록증]</a>
                  </div>
                  <div class="btn_group">
                    <button>승인</button>
                    <button>반려</button>
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
                  \${company.nickname}(\${company.email})
                  <a href='\${company.companyInfoVO.companyRegistCertificateUrl}' download='\${company.nickname}'" class="business_license">[사업자등록증]</a>
                  </div>
                  <div class="btn_group">
                    <button class="confirm_complete">승인완료</button>
                  </div>
                  <div class="btn_group">
                    <button class="company_member_withdraw_btn" id="\${company.email}">탈퇴</button>
                  </div>
                </div>
              </div>`
            companyTemplateDom = $(companyTemplate)
          }
          
          $('.company_modal').find('.desc-content').append(companyTemplateDom)
      }
    })
  }
  loadCompanytypeMember()

  // 기업 회원 탈퇴 조치
  $(document).on('click', '.company_member_withdraw_btn', function(e) {
    let email = $(this).attr('id')
    let url = '/home/admin/person/delete/' + email
    if (confirm('정말 탈퇴 시키겠습니까?')) {
      $.get(url, function(response) {
        if (response.result === 'success') {
          alert('탈퇴가 완료되었습니다.')
          $('.desc-content').empty()
          loadCompanytypeMember()
        }
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
          console.log($('#codeContent').val())
          console.log(body)
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

  // 공지사항 관리창으로 이동
  $('.admin_notice_btn').click(function() {
    window.open('/notice/list', '_blank')
  })

  // 신고 관리창으로 이동
  $('.admin_report_btn').click(function() {
    window.open('/admin/report/list', '_blank')
  })

</script>
</html>