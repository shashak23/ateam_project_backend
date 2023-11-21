<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <jsp:include page="../layout/header.jsp"/>
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
        
        $(document).on('click', '.introduce-modify', function() {
        	$.sweetModal({
        		title: '자기소개',
        		content: `
        			<form method="post" action="/memberInfo/modify/update-introduction">
        			<input type="hidden" name="generalMemberEmail" value="${sessionScope._LOGIN_USER_.email}"/>
        			<label>자기소개 </label>
        			  <textarea name="selfIntro" id="selfIntro" placeholder="간단한 문구를 입력해 주세요 😊" style="height: 50px">
        			  ${generalMemberVO.selfIntro}
        			  </textarea>
        			<input type="submit" value="수정" />
        			<button id="modalCloseIntro">닫기</button>
        		</form>`
        	})
        });
    </script>
</head>
								
</body>
</html>

 --%>