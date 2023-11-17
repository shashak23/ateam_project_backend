<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(function() {
	
	})

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
</head>
<style>
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
    <div id="container">
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
                    <c:when test="${categoryId eq 1}">
                        Key-value쌍으로 데이터를 빠르게 찾아보세요. (첫 번째 카테고리 팁)
                    </c:when>
                    <c:when test="${categoryId eq 2}">
                        다른 팁이 필요한 경우 여기에 표시하세요. (두 번째 카테고리 팁)
                    </c:when>
                    <!-- 필요에 따라 다른 categoryId에 대한 case를 추가하세요. -->
            
                    <c:otherwise>
                        기본 팁을 표시하세요.
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div id="pointLine"></div>
        <!-- 여기까지 해당 카테고리 상단 내용 -->
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
    <jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>