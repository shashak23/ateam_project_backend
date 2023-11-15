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
    <style>
    
	#content_wrapper{
		display: flex;
		justify-content: center;
	}
	#container{
		width: 1100px;
		display: flex; 
		flex-direction: column;
		justify-content: center;
	}

	/* .flex_button {	
		margin: 100px 50px 0px 0px;
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
	background-color: var(--light-blue);
  	color: white;
	} */

	table th{
		background-color: var(--light-gray);
		height:35px;
		color: var(--dark-gray);
	}

	table td{
		border-bottom: 1px solid #D3D3D3;
		color: var(--dark-gray);
	}
	table.table th:last-child, table.table td:last-child {
		border-right: none;
	}
	
	table.table > tbody td {
		text-align: center;
	}
    table {
        text-align: center;
    }
 
       

    
    </style>
</head>
<body>
    <div id="content_wrapper">
        <!-- <div class="flex_button">
            <button id="myprofile">마이페이지</button>
            <button id="bookmark">북마크</button>
            <button id="modify_info">정보 수정</button>
            <button id="mypost">내가 쓴 게시글</button>
            <button id="solve">내가 푼 문제</button>
            <button>탈퇴</button>
        </div> -->
        <div class="body_container">
            <form action="/codingtest/mylist" class="search_form" method="get">
                <!-- <div>
                    <select name="searchType">
                        <option value="subject" ${searchMyAlgorithmVO.searchType eq 'subject' ? 'selected' : ''}>제목</option>
                    </select>
                    <input type="text" name="searchKeyword" value="${searchMyAlgorithmVO.searchKeyword}"/>
                    <input type="hidden" name="pageNo" class="pageNo" value="0"/>
                    <button class="btn">검색</button>
                </div> -->
            </form>
        </div>  
        <!-- 테이블 및 데이터 출력 부분 -->
        <div id="container">
            <table class="grid">
                <caption>내가 푼 문제</caption> 
                <thead>
					<colgroup>
                        <col width="5%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="40%" />
                        <col width="10%" />
                        <col width="20%" />
                        <col width="10%" />
                        <col width="10%" />
                    </colgroup>
                    <tr>
                        <th scope="col">제목</th>
                        <th scope="col">제출회사</th>
                        <th scope="col">카테고리</th>
                        <th scope="col">내용</th>
                        <th scope="col">조회수</th>
                        <th scope="col">난이도</th>
                        <th scope="col">정답여부</th>
                        <th scope="col">삭제</th>
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
                            <td><a href="/home/myalgorithm/delete/${myAlgo.myAlgorithmQuestionId}">삭제</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- 데이터가 없을 때의 처리 -->
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