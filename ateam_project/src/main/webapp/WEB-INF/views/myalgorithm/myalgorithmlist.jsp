<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="../layout/header.jsp" />
    <style>
    body > .body_container {
    width: 100%;
    min-height: 75vh;
    display: grid;
    grid-template-columns: 1fr 1080px 1fr;
	}
	
	/* Main Contents */
	body > .body_container > .body {
	    grid-column: 2/3;
	    margin: 40px 0 100px 0;
	}
	
	/* Main Contents 왼쪽 여백*/
	body > .body_container > .body_left_aside {
	    grid-column: 1/2;
	    display: flex;
    	justify-content: flex-end; 
	}
	
	/* Main Contents 오른쪽 여백*/
	body > .body_container > .body_right_aside {
	    grid-column: 3/4;
	}
    
	.flex_button {	
		margin: 50px 120px 0px 0px;
		display: flex;
		flex-direction: column;
	}

	.flex_button button {
        color: white;	
        background-color: var(--gray);
        width: 150px;
        height: 40px;
        margin-bottom: 15px;
        cursor: pointer;
        border: 2px;
	}

	.flex_button button:hover {
        background-color: #26577C;
        color: white;
	} 

    tbody {
        text-align: center;
    }

    .top{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .searchArea{
        display: flex;
        align-items: center;
    }

    input[type="text"] {
    height: 27px;
    width: 150px;
    margin-right: 5px;
    }

    select {
    height: 27px;
    margin-right: 5px;
    }
    </style>
</head>
<body>
    <div class="body_container">
        <div class="body_left_aside">
            <div class="flex_button">
                <button id="myprofile">마이프로필</button>
                <button id="bookmark">북마크</button>
                <button id="modify_info">정보 수정</button>
                <button id="mypost">내가 쓴 게시글</button>
                <button id="solve">내가 푼 문제</button>
                <button>탈퇴</button>
            </div>
        </div>             
        <div class="body">
            <table class="grid">
                <div class="top">
                    <h3>내가 푼 문제</h3>
                    <form action="/codingtest/mylist" class="search_form" method="get">
                        <div class="searchArea">
                            <select name="searchType">
                                <option value="subject" ${searchMyAlgorithmVO.searchType eq 'subject' ? 'selected' : ''}>제목</option>
                            </select>
                            <input type="text" name="searchKeyword" value="${searchMyAlgorithmVO.searchKeyword}"/>
                            <input type="hidden" name="pageNo" class="pageNo" value="0"/>
                            <button class="btn">검색</button>
                        </div>
                    </form>
                </div>
                
                <thead>
                    <tr>
                        <th scope="col">제목</th>
                        <th scope="col">제출회사</th>
                        <th scope="col">카테고리</th>
                        <!-- <th scope="col">내용</th> -->
                        <th scope="col">조회수</th>
                        <th scope="col">난이도</th>
                        <th scope="col">정답여부</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${myAlgorithmList.myAlgorithmList}" var="myAlgo">
                        <tr>
                            <td style="font-weight:bold"><a href="/algorithm/question/view/${myAlgo.algorithmQuestionVO.companyAlgorithmQuestionId}">${myAlgo.algorithmQuestionVO.algorithmTitle}</a></td>
                            <td>${myAlgo.memberVOTemp.nicknameTemp}</td>
                            <td>${myAlgo.commonCodeVO.codeContent}</td>
                            <!-- <td>${myAlgo.algorithmQuestionVO.algorithmContent}</td> -->
                            <td>${myAlgo.algorithmQuestionVO.viewCnt}</td>
                            <td>${myAlgo.algorithmQuestionVO.algorithmTierId}</td>
                            <td>${myAlgo.correctAnswerYn}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:choose>
                <c:when test="${empty myAlgorithmList.myAlgorithmList}">
                    <div>데이터가 없습니다.</div>
                </c:when>
                <c:otherwise>
                    <div><!-- 다른 내용이 있으면 여기에 추가 --></div>
                </c:otherwise>
            </c:choose>
        </div> 
        <div class="body_right_aside"></div>
    </div>
    <jsp:include page="../layout/footer.jsp" />
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
</body>
</html>