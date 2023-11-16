<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(function() {
		
		$.get("/code/알고리즘카테고리", function(response) {
			for (var i = 0; i < response.length; i++) {
				var code = response[i]
				var option = $("<option value='" +code.codeId+"'>"+code.codeContent+"</option>");
				$("#algorithm_category").append(option);
			}
		// 이전에 선택한 select option 불러오기
        $("select[name=algorithmCategoryId]").val("${algorithmExplanationVO.commonCodeVO.codeId}")
		});
	    
	    $("").keyup(function() {
	    	$.get("/")
	    })
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
            <div id="tip">Key-value쌍으로 데이터를 빠르게 찾아보세요.</div>
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
            <!-- <li>
                <div id="postList">
                    <a href="/algorithm/explanation/view/AE-20231029-000131">
                    <div class="postTitle">최단 경로를 찾는 알고리즘</div>
                   </a>
                    <div class="postWriter">페이타랩</div>
                    <div class="postInfo">31 views</div>
                </div>
            </li> -->
        </ul>
        
        
    </div>
    <jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>