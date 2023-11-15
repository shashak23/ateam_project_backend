<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내가 푼 알고리즘 문제</title>
    <jsp:include page="../layout/header.jsp" />
    <script src="/js/lib/jquery-3.7.1.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
</head>
<style>
    

</style>
</head>
<body>
    <div class="flex_button">
        <button id="myprofile">마이페이지</button>
        <button id="bookmark">북마크</button>
        <button id="modify_info">정보 수정</button>
        <button id="mypost">내가 쓴 게시글</button>
        <button id="solve">내가 푼 문제</button>
        <button>탈퇴</button>
    </div>
<div class="body_container">
    <form action="/codingtest/mylist" class="search_form" method="get">
        <div>
            <select name="searchType">
				<option value="subject" ${searchMyAlgorithmVO.searchType eq 'subject' ? 'selected' : ''}>제목</option>
                <option value="content" ${searchMyAlgorithmVO.searchType eq 'content' ? 'selected' : ''}>내용</option>
                <option value="category" ${searchMyAlgorithmVO.searchType eq 'category' ? 'selected' : ''}>카테고리</option>
                <option value="tier" ${searchMyAlgorithmVO.searchType eq 'tier' ? 'selected' : ''}>티어</option>
                <option value="company_name" ${searchMyAlgorithmVO.searchType eq 'company_name' ? 'selected' : ''}>기업명</option>
                <option value="correctYN" ${searchMyAlgorithmVO.searchType eq 'correctYN' ? 'selected' : ''}>정답여부별</option>
            </select>
            <input type="text" name="searchKeyword" value="${searchMyAlgorithmVO.searchKeyword}"/>
            <input type="hidden" name="pageNo" class="pageNo" value="0"/>
            <button class="btn">검색</button>
        </div>
    </form>
</div>     
    <!-- 일단 -->
    <div class="container">
        <table class="grid">
            <caption>내가 푼 문제</caption> 
            <thead>
                <tr id="table-tr">
                    <th>제목</th>
                    <th>제출회사</th>
                    <th>카테고리</th>
                    <th>내용</th>
                    <th>조회수</th>
                    <th>난이도</th>
                    <th>정답여부</th>
                    <th>제출한 답</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${myAlgorithmList.myAlgorithmList}" var="myAlgo">
                    <tr>
                        <td><a href="/algorithm/question/view/${myAlgo.algorithmQuestionVO.companyAlgorithmQuestionId}">${myAlgo.algorithmQuestionVO.algorithmTitle}</a></td>
                        <td>${myAlgo.memberVOTemp.nicknameTemp}</td>
                        <td>${myAlgo.commonCodeVO.codeContent}</td>
                        <td>${myAlgo.algorithmQuestionVO.algorithmContent}</td>
                        <td>${myAlgo.algorithmQuestionVO.viewCnt}</td>
                        <td>${myAlgo.algorithmQuestionVO.algorithmTierId}</td>
                        <td>${myAlgo.correctAnswerYn}</td>
                        <td>${myAlgo.myAnswer}</td>
                        <td><a href="/home/myalgorithm/delete/${myAlgo.myAlgorithmQuestionId}">삭제</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
        <c:choose>
            <c:when test="${empty myAlgorithmList.myAlgorithmList}">
                <div>데이터가 없습니다.</div>
            </c:when>
            <c:otherwise>
                <div><!-- 다른 내용이 있으면 여기에 추가 --></div>
            </c:otherwise>
        </c:choose>
    </div> 
			</div>
		</div>

    </div>
  
    <script>
		  function redirectToURL(url) {
	        window.location.href = url;
          }
	        
	    /* 비밀번호, 닉네임 수정 버튼 */
	    $("#myprofile").click(function() {
			redirectToURL("/memberinfo/view/${sessionScope._LOGIN_USER_.email}");
		});
	    $("#mypost").click(function() {
	        redirectToURL(`/member/mypost`);
	    });
	    $("#bookmark").click(function(){
			redirectToURL(`/member/bookmark`);
			
		});
	    $("#modify_info").click(function() {
	        redirectToURL("/member/selectmember/${sessionScope._LOGIN_USER_.email}");
	    });
		$("#quit").click(function() {
	        redirectToURL(`/member/logout`);
	    });
		$("#solve").click(function(){
			redirectToURL(`/codingtest/mylist`);
		});
        
        function movePage(pageNo) {
            $('.pageNo').val(pageNo)
            $('.search_form').attr({
                'method': 'get',
                'action': '/codingtest/mylist'
            }).submit()
        }
  
       
         // 미완성된 기능을 알려주는 모달창
         $('.incomplete').click(function() {
             $('.modal, .overlay').addClass('modal_active');
         });
         $('.overlay').click(function() {
             $('.modal, .overlay').removeClass('modal_active');
         });
     
         // 스크롤 버튼, IDE
         let calcScrollValue = () => {
             let scrollProgress = document.getElementById('progress');
             let progressValue = document.getElementById('progress-value');
             let pos = document.documentElement.scrollTop;
             let calcHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
             let scrollValue = Math.round((pos * 100) / calcHeight);
     
             scrollProgress.addEventListener('click', () => {
                 document.documentElement.scrollTop = 0;
             });
         };
         
         window.onscroll = calcScrollValue;
     
         // 서브 리스트가 있다면? 아래로 떨군다.
         $('.visible').hide();
         $('.list_company').mouseover(function() {
             $('.visible').show();
             $(this).find('a').css({'background-color': 'var(--blue)', 'color': 'white', 'box-shadow': '0 0 5px var(--gray)'});
         });
         $('.list_company').mouseleave(function() {
             $('.visible').hide();
             $(this).find('a').css({'background-color': 'white', 'color': 'var(--blue)', 'box-shadow': 'none'});
         });      
    </script>
     <jsp:include page="../layout/footer.jsp" />
</body>
</html>