<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
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
<style type="text/css">
	* {
		color: #333;
		
	}

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

	#postTitle{
		font-size:40px;
		display: flex;
		justify-content: center;
	}

	#info{
		display: flex;
		color:  var(--light-gray);
		font-size: 13px;
		justify-content: center;
		margin-top: 20px;
	}

	#info > .space{
		margin: 0px 10px 0px 10px;
		
	}
	
	div.right-align {
		text-align: right;
	}
	label {
		padding-left: 10px;
	}
	button, input, textarea {
		padding: 10px;
	}

	#category {
		color: #3BBFC3;
		display: flex;
		justify-content: center;
		font-size: 17px;
		margin-bottom: 15px;
	}

	#contents{
		margin-top: 100px;
		border-radius: 5px;
		/* border: 1px solid; */
		background-color: #fafafa;
	}

	#contents > #contents_text{
		margin:20px;
	}

	button{
		border: none;
		padding: 5px;
		border-radius: 5px;
		cursor: pointer;
		width: 70px;
		height: 30px;
	}

	button#back {
		position: relative;
		left: 1000px;
		top: 10px;
	}

	.btn-group {
		position: relative;
		top: -19px;
		left: 820px;
	}

	button#revise {
		margin-right: 15px;
	}
</style>
</head>
<body>
	<div class="body_left_aside"></div>
	<div class="body_container">
		<div class="body">
			<div id="category">
				<label for="algorithmCategoryId"></label>
				<div>${algorithmExplanationVO.commonCodeVO.codeContent}</div>
			</div>
			<div id="postTitle">${algorithmExplanationVO.postTitle}</div>
			<div id="info">
				<label for="algorithmWriter"></label>
				<div>${algorithmExplanationVO.memberVO.nickname}</div>
				<div class="space">|</div>
				<label for="postDate"></label>
				<div>${algorithmExplanationVO.postDate}</div>
				<div class="space">|</div>
				<div>${algorithmExplanationVO.viewCnt}</div>
				<label for="viewCnt">views</label>
			</div>

			<div id="contents">
				<div id="contents_text">${algorithmExplanationVO.postContent}</div>
			</div>
			<button id="back" onclick="location.href='/algorithm/explanation/list';">목록</button>
				<!-- <a href="/algorithm/question/list" id="back">목록</a> -->
			

				<div class="btn-group">
					<!-- 해당 게시글을 작성한 기업회원이 로그인 했을 시 -->
					<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq algorithmExplanationVO.postWriter}">
						<button id="revise">
							<a href="/algorithm/explanation/update/${algorithmExplanationVO.companyAlgorithmExplanationId}">수정</a>
						</button>
						<button id="delete">
							<a href="/algorithm/explanation/delete/${algorithmExplanationVO.companyAlgorithmExplanationId}">삭제</a>
						</button>					
					</c:if>
				</div>
			</div>
	</div>
	<div class="body_right_aside"></div>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>