<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 푼 알고리즘 문제</title>
<jsp:include page="../layout/header.jsp" />
<script src="/js/lib/jquery-3.7.1.js"></script>
<style>
   
    .flex_button {
		
		margin-top: 100px;
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

}
table.table {
		border-collapse: collapse;
		
		width: 900px;
		margin: 0 auto;
       margin-bottom: 200px;
	}

	table th{
		background-color: var(--light-gray);
		border-bottom: 1px solid var(--dark-gray);
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
		padding: 10px;
		color: #333;
		text-align: center;
		color: var(--dark-gray);
	}
    caption {
		font-weight: bold;
		font-size: 20px;
        margin: 0 auto;
        margin-bottom: 30px;
		text-align: left;
	}
    .controller {
        margin: 0 auto;
        margin-left: 300px;
    }
    .search_form {
    margin: 0 auto;
    margin-left: 980px;
    margin-bottom: -40px;
   
    
}
.search_btn {
     margin: 0 auto;
     background-color: var(--light-blue);
     border: none;
     border-radius: 5px;
     width: 60px;
     height: 30px;    
}
#body_controller {
    margin: 0 auto;
    margin-top: -260px;
}
</style>
</head>
<body>
    <div class="flex_button">
        <button id="myprofile">마이페이지</button>
        <button>북마크</button>
        <button id="modify_info">정보 수정</button>
        <button id="mypost">내가 쓴 게시글</button>
        <button id="solve">내가 푼 문제</button>
        <button>탈퇴</button>
    </div>
<div id="body_controller">
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
            <button class="search_btn">검색</button>
        </div>
    </form>
    <!-- 일단 -->
    <table class="table">
        <caption>알고리즘 문제 게시판</caption>
        <thead>
            <colgroup>
                <col width="10%" />
                <col width="20%" />
                <col width="10%" />
                <col width="40%" />
                <col width="20%" />
            </colgroup>
            <tr id="table-tr">
                <th scope="col">번호</th>
                <th scope="col">카테고리</th>
                <th scope="col">난이도</th>
                <th scope="col">문제 제목</th>
                <th scope="col">작성자</th>
            </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty algorithmQuestionList.algorithmQuestionList}">
                <c:forEach items="${algorithmQuestionList.algorithmQuestionList}" var="algorithmquestion" varStatus="index">
                    <tr>
                        <td>${index.index + 1}</td>
                        <td>${algorithmquestion.commonCodeVO.codeContent}</td>
                        <td>${algorithmquestion.algorithmTierId}</td>
                        <td style="font-weight: bold;">
                            <a href="/algorithm/question/view/${algorithmquestion.companyAlgorithmQuestionId}">
                                <c:out value="${algorithmquestion.algorithmTitle}" />
                            </a>
                        </td>
                        <td>${algorithmquestion.memberVO.nickname}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5">조회된 게시글이 없습니다.</td>
                </tr>
                
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
    <!-- 일단 -->

    <div class="container">
        <c:forEach items="${myAlgorithmList.myAlgorithmList}" var="myAlgo">
            <div class="box">
                <div style="background-color: var(--blue);">
                    <a href="/algorithm/question/view/${myAlgo.algorithmQuestionVO.companyAlgorithmQuestionId}">제목: ${myAlgo.algorithmQuestionVO.algorithmTitle}</a>
                </div>
                <div>제출회사: ${myAlgo.companyInfoVO.companyName}</div>
                <div>카테고리: ${myAlgo.commonCodeVO.codeContent}</div>
                <p>내용: ${myAlgo.algorithmQuestionVO.algorithmContent}</p>
                <p>조회수: ${myAlgo.algorithmQuestionVO.viewCnt}</p>
                <p>좋아요 수: ${myAlgo.algorithmQuestionVO.likeCnt}</p>
                <p>난이도: ${myAlgo.algorithmQuestionVO.algorithmTierId}</p>
                <p>정답여부: ${myAlgo.correctAnswerYn}</p>
                <p>제출한 답: ${myAlgo.myAnswer}</p>
            </div>
            <a href="/home/myalgorithm/delete/${myAlgo.myAlgorithmQuestionId}">삭제</a>
        </c:forEach>
        <div>
			<div>
				<ul class="page-nav">
				    <c:if test="${not empty myAlgorithmList.myAlgorithmList}">
					    <!-- 이전 페이지 그룹 -->
					    <c:if test="${searchMyAlgorithmVO.hasPrevGroup}">
					        <li>
					            <a href="javascript:void(0)" onclick="movePage(0)">처음</a>
					        </li>
					        <li>
					            <a href="javascript:void(0)" onclick="movePage(${searchMyAlgorithmVO.prevGroupStartPageNo})">이전</a>
					        </li>
					    </c:if>
					    
	                    <c:forEach begin="${searchMyAlgorithmVO.groupStartPageNo}"
	                               end="${searchMyAlgorithmVO.groupEndPageNo}"
	                               step="1"
	                               var="p">
							<li class="${searchMyAlgorithmVO.pageNo eq p ? 'active': ''}">
								<a href="javascript:void(0)" onclick="movePage(${p})">${p + 1}</a>
							</li>
	                    </c:forEach>
	                    
	                    <!-- 다음 페이지 그룹 -->
	                    <c:if test="${searchMyAlgorithmVO.hasNextGroup}">
	                        <li>
	                            <a href="javascript:void(0)" onclick="movePage(${searchMyAlgorithmVO.nextGroupStartPageNo})">다음</a>
	                        </li>
	                        <li>
	                            <a href="javascript:void(0)" onclick="movePage(${searchMyAlgorithmVO.pageCount-1})">마지막</a>
	                        </li>
	                    </c:if>
                    </c:if>
				</ul>
			</div>
		</div>

    </div>
</div>   
    <script>
        	function redirectToURL(url) {
	        window.location.href = url;
	    }
	    
		function redirectToURL(url) {
	        window.location.href = url;
	    }
	    /* 비밀번호, 닉네임 수정 버튼 */
        $("#myprofile").click(function() {
			redirectToURL(`/memberinfo/view/${sessionScope._LOGIN_USER_.email}`);
		});
	    $("#mypost").click(function() {
	        redirectToURL(`/member/mypost`);
	    });
	    $("#modify_info").click(function() {
	        redirectToURL(`/member/selectmember/${sessionScope._LOGIN_USER_.email}`);
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
        
         
         function redirectToURL(url) {
 	        window.location.href = url;
 	    }
 	    /* 비밀번호, 닉네임 수정 버튼 */
 	    $("#myprofile").click(function() {
 			redirectToURL(`/memberinfo/view/${memberVO.email}`);
 		});
 	    $("#mypost").click(function() {
 	        redirectToURL(`/member/mypost`);
 	    });
 	    $("#modify_info").click(function() {
 	        redirectToURL(`/member/selectmember/${memberVO.email}`);
 	    });
 		$("#quit").click(function() {
 	        redirectToURL(`/member/logout`);
 	    });
    </script>
     <jsp:include page="../layout/footer.jsp" />
</body>
</html>