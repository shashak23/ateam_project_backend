<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // 페이지가 로드된 후 실행될 JavaScript 코드
            var selfIntroTextarea = $("#selfIntro");
            var selfIntroValue = selfIntroTextarea.val();
            
            // 공백 제거 함수
            function removeSpaces(inputText) {
                return inputText.replace(/\s/g, '');
            }
            
            // 초기 텍스트 설정
            selfIntroTextarea.val(removeSpaces(selfIntroValue));
        });
    </script>
    <style>
    #modalContainerIntroduction.hidden {
	  display: none;
	  }
	
    #modalContainerIntroduction {
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgba(0, 0, 0, 0.5);
    }

    #modalContentIntroduction {
      position: absolute;
      background-color: #ffffff;
      width: 500px;
      height: 200px;
      padding: 15px;
    }
    </style>
</head>
	<form method="post" action="/memberInfo/modify/update-introduction">
		<input type="hidden" name="generalMemberEmail" value="${sessionScope._LOGIN_USER_.email}"/>
		<label>자기소개 </label>
		  <textarea name="selfIntro" id="selfIntro" placeholder="간단한 문구를 입력해 주세요 😊" style="height: 50px">
		  ${generalMemberVO.selfIntro}
		  </textarea>
		<input type="submit" value="수정" />
	</form>								
</body>
</html>





