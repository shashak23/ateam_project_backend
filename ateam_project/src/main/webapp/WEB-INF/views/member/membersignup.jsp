<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri ="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script src="/js/lib/jquery-3.7.1.js"></script>
<style type="text/css">
button, input {
    padding: 10px;
    border: 1px solid #ccc;
}

.available {
  background-color: #0f03;
}

.unusable {
  background-color: #f003;
}

.personal_signup.select {
    background-color: var(--blue);
}

.signup_container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
}

fieldset {
  width: 400px;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  border-left: 1px solid var(--light-blue);
  border-right: 1px solid var(--light-blue);
  border-bottom: 1px solid var(--light-blue);
  border-top: none;
  padding-top: 20px;
}

.signup_btn_wrap {
    display: flex;
    width: 412px;
    background-color: var(--light-blue);
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    overflow: hidden;
}

.signup_btn_wrap button {
  font-size: 15px;
  color: var(--white);
  text-align: center;
  width: 50%;
  background-color: var(--light-blue);
  border: none;
  cursor: pointer;
}

.signup_btn_wrap button:active {
    background-color: var(--deep-blue);
}

label {
    display: inline-block;
    width: 100px;
}

.line {
  display: block;
  margin: 10px 30px;
}

.line input {
    outline: none;
}

.err_password {
    color: var(--gray);
}

.personal_info_agree_title {
  display: block;
  font-weight: bold;
  margin: 10px 0;
}

.id_test_text {
  width: 350px;
  height: 180px;
  font-size: var(--font-x-small);
  overflow-y: auto;
  margin-bottom: 10px;
}

form .final_btn {
  text-align: center;
}

div.errors {
  background-color: #ff00004a;
  opacity: 0.8;
  padding: 10px;
  color: #333;
}
div.errors:last-child {
  margin-bottom: 15px;
}

#id_test_div {
  display: block;
  background-color: ghostwhite;
}
</style>
</head>
<body>
  <form:form method="post">
	  <div>
      <form:errors path="email" element="div" cssClass="errors" />
      <form:errors path="nickname" element="div" cssClass="errors" />
      <form:errors path="pw" element="div" cssClass="errors" />
      <form:errors path="confirmPw" element="div" cssClass="errors" />
    </div>	
    <div class="signup_container">
      <div class="signup_btn_wrap">
        <button class="personal_signup select">개인 회원가입</button>
        <button class="company_signup">기업 회원가입</button>
      </div>
      <fieldset>
        <div class="line">
          <label for="email" class="label">이메일</label>
          <input type="email" name="email" id="email" value="${memberVO.email}" />
        </div>
        <div class="line">
          <label for="pw" class="label">비밀번호</label>
          <input id="pw" type="password" name="pw" value="${memberVO.pw}"/>
          <br><span class="err_password"></span>
        </div>
        <div class="line">
          <label for="confirmPw" class="label">비밀번호 확인</label>
          <input id="confirmPw" type="password" name="confirmPw" value="${memberVO.confirmPw}"/>
          <br><span class="err_confirm_password"></span>
        </div>
        <div class="line">
          <label for="nickname" class="label">닉네임</label>
          <input type="text" name="nickname" id="nickname" value="${memberVO.nickname}">
        </div>
        <div class="line">
          <input type="checkbox" name="agree" id="agree">
          <label for="agree">모두 동의</label>
          <br>
        </div>
        <div class="line">
          <div>
            <span class="personal_info_agree_title">[ 개인정보 수집 및 이용 동의 ]</span>
          </div>
          <div id="id_test_div">
          </div>
          <div>
            <p class="final_btn">
            <input id="btn-regist" disabled="disabled" type="submit" value="작성완료" />
            </p>
          </div>     
        </div>
      </fieldset>
    </div>
  </form:form> 
</body>
<script type="text/javascript">
$().ready(function() {
    // 회원가입 창 이동
    $('.personal_signup').click(function(event) {
        event.preventDefault()
        // window.open('/member/signup')
        window.location.href = '/member/signup'
    })

    $('.company_signup').click(function(event) {
        event.preventDefault()
        // window.open('/member/companysignup2')
        window.location.href = '/member/companysignup'

    })

  function checkAvailability(inputId, paramName) {
    var inputValue = $(inputId).val();
    $.get("/member/signup/vaildation", {
      [paramName]: inputValue
    }, function(response) {
      var isAvailable = response.available;
      if (isAvailable) {
        $(inputId).addClass("available").removeClass("unusable");
        $("#btn-regist").removeAttr("disabled");
      } 
      else {
        $(inputId).addClass("unusable").removeClass("available");
        $("#btn-regist").attr("disabled", "disabled");
      }
      if (!$("#email").hasClass("unusable") && !$("#nickname").hasClass("unusable")) {
        $("#btn-regist").removeAttr("disabled");
      } 
      else {
        $("#btn-regist").attr("disabled", "disabled");
      }
      if (!$("#email").hasClass("unusable") && !$("#nickname").hasClass("unusable") && $('#agree').is(':checked')) {
        $("#btn-regist").removeAttr("disabled");
      } 
      else {
        $("#btn-regist").attr("disabled", "disabled");
      }
    })
  }
  $("#email").keyup(function() {
    checkAvailability("#email", "email");
  });

  $("#nickname").keyup(function() {
    checkAvailability("#nickname", "nickname");
  });
  $('#agree').click(function() {
    checkAvailability("#agree", "agree");
  })
  // 비밀번호 확인 입력란의 입력 이벤트를 모니터링
  $("#confirmPw").on("input", function() {
      var pw = $("#pw").val();
      var confirmPw = $(this).val();
      var errConfirmPassword = $(".err_confirm_password");
      
      
      if (pw === confirmPw) {
          errConfirmPassword.text(""); 
      } else {
          errConfirmPassword.text("* 비밀번호가 일치하지 않습니다.");
      }

      // 비밀번호 길이 확인
      if (pw.length >= 5 && pw.length <= 10) {
          $(".err_password").text(""); 
      } else {
          $(".err_password").text("* 5~10글자까지만 입력 가능합니다.");
      }
  });
});

  
// 개인정보 동의 텍스트
let personal_info_text = `<pre class=id_test_text>
DevGround가 취급하는 모든 개인정보는 개인정보보호법 등
관련법령상의 개인정보보호 규정을 준수하여 수집·보유·처리하고
있습니다.

DevGround는 개인정보보호법 제30조에 따라 이용자의 개인정보
보호 및 권익을 보호하고 이와 관련한 고충을 신속하고 원활하게
처리할 수 있도록 다음과 같이 개인정보 처리방침을 두고 있습니다.

<strong>제1조 (개인정보의 처리 목적)</strong>
DevGround는 회원제 서비스 이용에 따른 본인확인 및 상담처리
관리, 진단/자문 서비스 관리, 홈페이지 이용 통계 등을 목적으로
개인정보를 처리합니다.

<strong>제2조 (개인정보의 처리 및 보유 기간)</strong>
DevGround에서 처리하는 개인정보는 원칙적으로 개인정보의
처리목적이 달성되거나 정보주체의 요청이 있을 시 지체
없이(5일이내) 파기합니다.
단, 다음의 개인정보는 수집․이용 목적으로 명시한 범위 내에서
처리합니다.

가. 개인정보 파일명 : 공동주택관리 홈페이지 회원정보
 ○ 개인정보항목 : 이름, 주소, 이메일, 일반전화번호,
 휴대전화번호, 생년월일, 본인인증정보
 ○ 보유근거 : 정보주체의 동의
 ○ 보유기간 : 2년(회원 탈퇴 시 지체없이 파기)

나. 개인정보 파일명 : 공동주택관리 인터넷/전화상담 신청정보
 ○ 개인정보항목 : 아이디(회원의 경우),
 본인인증정보(비회원의 경우), 이름, 주소, 이메일,
 일반전화번호, 휴대전화번호
  (※ 전화 상담만 하는 경우 : 일반전화번호, 휴대전화번호)
 ○ 보유근거 : 정보주체의 동의
 ○ 보유기간 : 3년

다. 개인정보 파일명 : 공동주택관리 관리진단/기술자문 서비스
신청정보
 ○ 개인정보항목 : 아이디(회원의 경우),
 본인인증정보(비회원의 경우),
 이름, 일반전화번호, 휴대전화번호
 ○ 보유근거 : 정보주체의 동의
 ○ 보유기간 : 3년

라. 개인정보 파일명 : 공동주택관리 열린강좌 신청정보
 ○ 개인정보항목 : 아이디(회원의 경우),
 본인인증정보(비회원의 경우),
 이름, 일반전화번호, 휴대전화번호
 ○ 보유근거 : 정보주체의 동의
 ○ 보유기간 : 1년

마. 개인정보 파일명 : 공동주택 주민활동가 양성교육 신청정보
 ○ 개인정보항목 : 아이디(회원의 경우),
 본인인증정보(비회원의 경우),
 이름,  휴대전화번호, 주소, 출생년도
 ○ 보유근거 : 정보주체의 동의
 ○ 보유기간 : 2년
 
<strong>제3조 (개인정보의 목적 외 이용 및 제3자 제공)</strong>
DevGround는 원칙적으로 정보주체의 개인정보를 수집·이용
목적으로 명시한 범위 내에서 처리하며, 아래의 경우를 제외하고는
정보주체의 사전 동의 없이는 본래의 목적 범위를 초과하여
처리하거나 제3자에게 제공하지 않습니다.

가. 정보주체로부터 별도의 동의를 받는 경우
나. 법률에 특별한 규정이 있는 경우
다. 정보주체 또는 법정대리인이 의사표시를 할 수 없는 상태에
있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히
정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여
필요하다고 인정되는 경우 라. 통계작성 및 학술연구 등의 목적을
위하여 필요한 경우로서 특정 개인을 알아 볼 수 없는 형태로
개인정보를 제공하는 경우
마. 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게
제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수
없는 경우로서 보호위원회의 심의·의결을 거친 경우
바. 조약, 그 밖의 국제협정의 이행을 위하여 외국정보 또는
국제기구에 제공하기 위하여 필요한 경우
사. 범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우
아. 법원의 재판업무 수행을 위하여 필요한 경우
자. 형 및 감호, 보호처분의 집행을 위하여 필요한 경우</pre>`
 let tempDom = $(personal_info_text)
  $('#id_test_div').append(tempDom)
</script>
</html>