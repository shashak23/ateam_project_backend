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

fieldset {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 30px;
    border-radius: 10px;
    
    border: 1px solid var(--light-blue);
}

form legend {
  font-size: 20px;
  text-align: center;
}

label {
    display: inline-block;
    width: 100px;
}

.line {
    margin-bottom: 10px;
}

.line input {
    outline: none;
}

.err_password {
    color: var(--gray);
}

form p span {
  font-size: 13px;
  color: rgb(0, 60, 255);
  font-style: italic;
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
</style>
<script src="/js/lib/jquery-3.7.1.js"></script>
</head>
<body>
  <form:form modelAttribute="memberVO" method="post">
	<div>
      <form:errors path="email" element="div" cssClass="errors" />
      <form:errors path="nickname" element="div" cssClass="errors" />
      <form:errors path="pw" element="div" cssClass="errors" />
      <form:errors path="confirmPw" element="div" cssClass="errors" />
    </div>	
    <fieldset>
      <legend>개인회원 회원가입</legend>
        <div class="line">
          <label for="email" class="label">이메일</label>
          <input type="email" name="email" id="email" value="${memberVO.email}">
        </div>
        <div class="line">
          <label for="pw" class="label">비밀번호</label>
          <input id="pw" type="password" name="pw"
                   value="${memberVO.pw}"/>
          <br><span class="err_password">* 8~10글자까지만 입력 가능합니다.</span>
        </div>
		<div class="line">
          <label for="confirmPw" class="label">비밀번호 확인</label>
          <input id="confirmPw" type="password" name="confirmPw"
                 value="${memberVO.confirmPw}"/>
		</div>
        <div class="line">
          <label for="nickname" class="label">닉네임</label>
          <input type="text" name="nickname" id="nickname" value="${memberVO.nickname}">
        </div>
        <div>
          <input type="checkbox" name="agree" id="agree">
          <label for="agree">모두 동의</label>
          <br>
          <span class="err_agree">* 필수</span>
        </div>
        <p>
          <div>
            <span style="cursor:pointer;" onclick="showHide('id_test_div');">
              [ 개인정보 수집 및 이용 동의 ] 
            </span>
          </div>
          <div id="id_test_div" style="display:block;">
            <p>모이락 서비스 이용을 위해 아래와 같이 개인정보를 수집 및 이용합니다.</p> 
            동의를 거부할 권리가 있으며, 동의 거부 시 모이락 회원서비스 이용이 불가합니다.
            </div>
		<div>
        <p class="final_btn">
   		  <input id="btn-regist" disabled="disabled" type="submit" value="작성완료" />
        </p>
        </div>     
      </fieldset>
    </form:form> 
</body>
<script type="text/javascript">
$().ready(function() {
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
  })
}
$("#email").keyup(function() {
  checkAvailability("#email", "email");
});

$("#nickname").keyup(function() {
    checkAvailability("#nickname", "nickname");
  });
});
</script>
</html>