<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
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

	#container{
		display:flex;
		flex-direction: column;
		width:1080px;
		margin: 0 auto;
		margin-top: 100px;
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
	div.btn-group{
		margin-left: 895px;
	}
	
	div.btn-group > #revise,
	div.btn-group > #delete {
		width:80px;
		height:40px;		
		border:none;
		border-radius: 10px;
		cursor: pointer;
		margin: 20px 0px 40px 10px;
		transition: box-shadow 0.1s ease;
	}

	div.btn-group > #revise:hover,
	div.btn-group > #delete:hover{
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); 
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
		margin-top: 150px;
		border-radius: 5px;
		border: 1px solid;
		margin-bottom: 100px;
	}

	#contents > #contents_text{
		margin:20px;
	}
</style>
</head>
<body>
	<div id="container">
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

			<div class="btn-group">
				<!-- 로그인 하지 않았을 때 -->
				<c:if test="${empty sessionScope._LOGIN_USER_}">
					<a href="/member/auth">로그인하기</a>
				</c:if>
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
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>