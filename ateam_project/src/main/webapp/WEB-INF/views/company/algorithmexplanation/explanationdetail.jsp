<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO" %>
<jsp:include page="../../layout/header.jsp"/>
<script type="text/javascript">
    // 모달창 열고 닫기
  $(document).on('click', '.incomplete', function() {
    $('.modal, .overlay').addClass('modal_active')
  })
  $(document).on('click', '.overlay', function() {
    $('.modal, .overlay').removeClass('modal_active')
  })

  $(document).on('keyup', function(e) {
    if (e.key === 'Escape') {
      $('.modal, .overlay').removeClass('modal_active')
    }
  })

  // 스크롤 버튼, IDE
  let calcScrollValue = () => {
  let scrollProgress = document.getElementById('progress')
  let progressValue = document.getElementById('progress-value')
  let pos = document.documentElement.scrollTop
  let calcHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight
  let scrollValue = Math.round((pos * 100) / calcHeight)

  scrollProgress.addEventListener('click', () => {
    document.documentElement.scrollTop = 0
  })
  }
  
  window.onscroll = calcScrollValue

  // 서브 리스트가 있다면? 아래로 떨군다.
  $('.visible').hide()
  $('.list_company').mouseover(function() {
    $('.visible').show()
    $(this).find('a').css({'background-color': 'var(--blue)',
                           'color': 'white',
                           'box-shadow': '0 0 5px var(--gray)'})
  })
  $('.list_company').mouseleave(function() {
    $('.visible').hide()
    $(this).find('a').css({'background-color': 'white',
                           'color': 'var(--blue)',
                           'box-shadow': 'none'})
  })
</script>
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
    }

    /* Main Contents 오른쪽 여백*/
    body > .body_container > .body_right_aside {
        grid-column: 3/4;
    }
#container{
    display: flex;
    flex-direction: column;
    margin: 0 auto;
    margin-top: 60px;
    margin-bottom: 100px;
    width: 1000px;
}

#header{
    display: grid;
    grid-template-columns: 200px 1fr;
    margin-bottom: 13px;
}

.info{
    font-size:small
    
}

#pointLine{
    border: 3px solid #FF8C00;
    width: 100px;
    position: relative;
    top: 22px;
}

.title{
    font-weight: bold;
    font-size: xxx-large;
}

#tip{
    margin-left:400px ;
}

#postList{
    display: grid;
    grid-template-rows: 1fr 1fr;
    border-top: 0.0625rem solid rgb(231,231,231);
    margin-top: 20px;
    padding-top: 10px;
}

.postTitle{
    font-weight: bold;
    font-size: x-large;
}

.postWriter{
    margin-top: 30px;
}

.postWriter,
.postInfo{
    font-size: medium;
    color:	#A9A9A9;
}
</style>
<body>
    <div class="body_container">
        <div class="body_left_aside"></div>
        <div class="body">
        <div id="header">
            <div id="algorithmName">
            <c:choose>
			    <c:when test="${not empty algorithmExplanationList.algorithmExplanationList}">
			        <div class="title">${algorithmExplanationList.algorithmExplanationList[0].commonCodeVO.codeContent}</div>
			    </c:when>
			</c:choose>
            </div>   
            <div id="tip">
                <c:choose>
                    <c:when test="${algorithmCategoryId eq 'CC-20231017-000001'}">
                        매 순간 최선의 선택을 하세요! 
                    </c:when>
                    <c:when test="${algorithmCategoryId eq 'CC-20231017-000002'}">
                        문제를 단계적으로 정의하고 해결하세요
                    </c:when>
                    <c:when test="${algorithmCategoryId eq 'CC-20231017-000003'}">
                        깊이와 너비, 어느 것이 좋을까요?
                    </c:when>
                    <c:when test="${algorithmCategoryId eq 'CC-20231017-000004'}">
                        조직화와 효율적인 검색을 경험해 보세요
                    </c:when>
                    <c:when test="${algorithmCategoryId eq 'CC-20231017-000005'}">
                        시작이 반이다! 중간부터 탐색해보시죠
                    </c:when>
                    <c:when test="${algorithmCategoryId eq 'CC-20231017-000006'}">
                        문제를 조각조각 나눠 시작합니다
                    </c:when>
                    <c:when test="${algorithmCategoryId eq 'CC-20231017-000007'}">
                        가장 빠른 길을 찾아 보아요!
                    </c:when>
                    <c:when test="${algorithmCategoryId eq 'CC-20231017-000008'}">
                        엣지를 경유해 노드를 따라가죠
                    </c:when>
                    <c:when test="${algorithmCategoryId eq 'CC-20231017-000009'}">
                        더욱 많은 알고리즘의 세계를 경험해보세요
                    </c:when>
                    <c:otherwise>
                        한 줄 평을 기입하시오.
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div id="pointLine"></div>
        <ul id="list">
        	<c:choose>
        		<c:when test="${not empty algorithmExplanationList.algorithmExplanationList}">
        			<c:forEach items="${algorithmExplanationList.algorithmExplanationList}" var="algorithmquestion">
	        			<li>
		        			<div id="postList">
		        				<a class="postTitle" href="/algorithm/explanation/view/${algorithmquestion.companyAlgorithmExplanationId}">
			        				<c:out value="${algorithmquestion.postTitle}" />    				
		        				</a>
		        			</div>
		        			<div class="postWriter">${algorithmquestion.memberVO.nickname}</div>
		        			<div class="postInfo">${algorithmquestion.viewCnt} views</div>
	        			</li>
	        		</c:forEach>
        		</c:when>
        	</c:choose>
        </ul>
        </div>
        <div class="body_right_aside"></div>
    </div>
    <jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>