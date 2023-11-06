<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
$().ready(function() {
	$.get("/code/알고리즘카테고리", function(response) {
		var ul = $("<ul></ul>");
		for (var i = 0; i < response.length; i++) {
			var code = response[i]
			var li = $("<li></li>");
			var checkbox = $("<input type='checkbox' id='"+code.codeId+"' name='algorithmCategoryIdList' value='"+code.codeId+"' />");
			var label = $("<label for='"+code.codeId+"'>"+code.codeContent+"</label>");
			var space = $("<span class='checkbox-space'> </span>");

			 // 새로 추가된 부분
			var infoDiv = li.find('.info');
			var companySpan = infoDiv.find('.companyName');
			var dateSpan = infoDiv.find('.postDate');
			var viewsSpan = infoDiv.find('.viewCnt');
			 // AJAX에서 받아온 데이터로 채워넣기
			companySpan.text("회사명: " + algorithmexplanation.companyName);
			dateSpan.text("작성일: " + algorithmexplanation.postDate);
			viewsSpan.text("조회수: " + algorithmexplanation.viewCnt);

			// $("#algorithm_category").append(checkbox);
			// $("#algorithm_category").append(label);
			// $("#algorithm_category").append(space);
			// li.append(checkbox);
            // li.append(label);
            // li.append(space);
            ul.append(li);
		}
		$("#algorithm_category").append(ul);
	});
	
	document.querySelectorAll('input[type="checkbox"]:checked')
	const ul = document.querySelector('ul')
	let selected = [];
	
	ul.addEventListener('change', event => {
		if(event.target.type == 'checkbox') {
			const checked = document.querySelectorAll('input[type="checkbox"]:checked')
			selected = Array.from(checked).map(x => x.value)

			console.log(selected);
			const resultElement = document.getElementById('result');
            resultElement.innerText = `선택된 값: ${selected.join(', ')}`;
		}
	})
	
	$("#search_btn").click(function() {
		$("#search_form").attr({
			"method": "get",
			"action": "/algorithm/explanation/list"
		}).submit()
	});
	
})

$(document).on('click', '.register', function(e) {
	let userEmail = `${sessionScope._LOGIN_USER_}`
	let memberType = `${sessionScope._LOGIN_USER_.memberType}`
	if (userEmail === '') {
		if(confirm('로그인이 필요한 서비스입니다. 로그인하시겠습니까?') ) {
			window.location.href="/member/auth"
		}
	}
	if (memberType === 'GENERAL') {
		alert('기업회원만 이용하실 수 있는 서비스입니다.')
		window.location.href="/algorithm/explanation/list"
	}
	if (memberType === 'COMPANY') {
		window.location.href="/algorithm/explanation/create"
	}

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

//   $("#myprofile").click(function() {
// 			redirectToURL(`/memberinfo/view/${memberVO.email}`);
// 		});

$("#quit").click(function() {
	        redirectToURL(`/member/logout`);
	    });

$('.seeMore').click(function() {
	redirectToURL(`/algorithm/explanation/detail/CC-20231017-000002`);
        });
</script>
</head>
<style>
	#overall{
		display: flex;
		justify-content: center;
		margin: 10px 300px 0px 0px;
		min-width: 1200px;	
	}

	#pageName{
		font-weight: bold;
		font-size:x-large;
		margin-bottom: 10px;
	}

	label{
		margin-left: 5px;
	}

	#left_container{
		display: flex;
		justify-content: center;
		width:300px;
		min-height: 500px;
		margin-top: 8px;
	}

	#toolbar{
		width: 300px;
		position: fixed;
		margin: 25px 0px 0px 20px;
		width: 200px;
		padding: 15px;
		align-items: center; 
	}

	#toolbar > #registerArticle{
		width:180px;	
	}

	#toolbar > #registerArticle > .register{
		width: 220px;
		height:35px;
		margin-top: 9px;
		color:black;
		background-color: var(--light-gray);
		border-radius: 6px;
		border:none;
		transition: box-shadow 0.1s ease;
	}

	#toolbar > #registerArticle > .register:hover{
		border: 2px solid #1E90FF;
	}

	#container{
		width: 1000px;		
		margin: 40px 0px 100px 0px;
		display: flex;
		flex-direction: column;		
	} 

	#pageInfo{
		width: 1000px;
		height:180px;
		margin-left:50px;
	}

	.pageTitle{
		font-size: xx-large;
		font-weight: bold;
	}

	.image{
	    position: relative;
		top: -130px;
		left: 780px;
		width: 190px;
		margin: 0px 0px px 750px;
		transform: rotate(20deg);
	}

	.seeMore{
		margin: 0px 0px 10px 240px;
	}

	.more{
		width: 8px;
   		height: 10px;
	}

	.pageExplanation{
		margin-top: 15px;
		font-size: larger;
	}

	#algorithmList ul{
		display:grid;
		grid-template-columns: 1fr 1fr 1fr;
		grid-template-rows: 1fr 1fr 1fr;
		width:1000px;
		height: 550px;
		column-gap: 20px;
		margin-left:50px;
		/* border-top: 0.0625rem solid rgb(231,231,231); */
	}

	.col_item{
		display: grid;
		grid-template-rows: 40px 1fr;
		border-top: 0.0625rem solid rgb(231,231,231);
		transition: box-shadow 0.3s ease;
	}

	.col_item:hover {
   	 	border: 2px solid #1E90FF; 
	}

	.col_item > .algorithmName{
		font-weight: bold;
		padding: 15px;
	}

	.col_item > .briefing{
		margin-left:15px;
		color: #98A8B9;
	}

	.type{
		width: 47px;
		height: 27px;
		transition: box-shadow 0.3s ease;
		border-radius: 4px;
	}

	.type:hover{
		border: 2px solid #1E90FF; 
	}

	.sc_text{
		padding-left: 6px;
		height: 27px;
		font-size: 12px;
		transition: box-shadow 0.3s ease;
	}

	.sc_text:hover{
		border: 2px solid #1E90FF; 
	}

	h4{
		width: 60px;
		height: 20px;
		margin: 0px 0px 0px 10px;
	}

	#algorithm_category{
		width: 500px;
		margin-top: 10px;
		margin-bottom: 20px;
		overflow-y: auto;
	}
	a:link, a:hover, a:active, a:visited {
		color: #333;
		text-decoration: none;
	}

	.search_area{
		margin-bottom: 20px;
	}

	.search_area > #search_form{
		width:200px;
	}

	#category_area{
		display:flex;
		width: 180px;
		margin-left: 10px;
		margin-top: 5px;
	}

	.search_area > #search_form > .gohome > .reset{	
		height:40px;	
		vertical-align: middle; 
  		margin-top: 0; 
	}

	.button_list{
		display: flex;
		height: 30px;
		width: 222px;
		margin-top: 10px;
		justify-content: space-around;
	}

	.search_icon{
		width: 20px;
		height: 20px;
		position: absolute;
		top: 118px;
		left: 210px;
		opacity: 0.4;
	}

	.btn_st_2{
		background-color: var(--light-blue);
		border: none;
		width: 70px;
		height: 30px;
		border-radius: 5px;
		cursor: pointer;
		margin-left: 6px;
	}


</style>
<body>
	<div id="overall">
		<div id="left_container">
			<div id="toolbar">
				<div id="pageName">알고리즘 해설</div>
				<div id="registerArticle">
					<button class="register" type="button" >글작성</button>
				</div>
				<div class="search_area">
					
					<form id="search_form"
						method="get"
						action="/algorithm/explanation/list">
						<div class="button_list">
							<select class="type" name="searchType">
								<option value="postTitle" ${searchAlgorithmExplanationVO.searchType eq 'postTitle' ? 'selected' : ''}>제목</option>
								<option value="postContent" ${searchAlgorithmExplanationVO.searchType eq 'postContent' ? 'selected' : ''}>내용</option>
								<option value="postWriter" ${searchAlgorithmExplanationVO.searchType eq 'postWriter' ? 'selected' : ''}>작성자</option>
							</select>
							<input class="sc_text" type="text" placeholder="검색어를 입력해주세요." name="searchKeyword" value="${SearchAlgorithmExplanationVO.searchKeyword}" />
							<img src="/images/search.svg" alt="search" class="search_icon">									
						</div>					
					</form>					
				</div>				
			</div>
		</div>
	<!-- <div id="container">		
		<div class="btn-group">
			<div class="right-align">
				로그인 하지 않았을 때
				<c:if test="${empty sessionScope._LOGIN_USER_}">
					<a href="/member/auth">로그인하기</a>
				</c:if> -->
				<!-- 기업회원에게만 보임
				<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'COMPANY'}">
					<a href="/algorithm/explanation/create">게시글 등록</a>
				</c:if>
			</div>
		</div>
			<tbody>
				<c:choose>
					<c:when test="${not empty algorithmExplanationList.algorithmExplanationList}">
						<c:forEach items="${algorithmExplanationList.algorithmExplanationList}" var="algorithmexplanation" varStatus="index">
							<tr>
								<td>${(index.index + 1) * (searchForumVO.pageNo + 1)}</td>
								<td>
									<a href="/algorithm/explanation/view/${algorithmexplanation.companyAlgorithmExplanationId}">
										<c:out value="${algorithmexplanation.postTitle}" />
									</a>
								</td>
								<td>${algorithmexplanation.commonCodeVO.codeContent}</td>
								<td>${algorithmexplanation.memberVO.nickname}</td>
								<td>${algorithmexplanation.postDate}</td>
								<td>${algorithmexplanation.viewCnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div> -->
	<div id="container">
		<div id="pageInfo">
			<div class="pageTitle">기초를 탄탄히: 알고리즘 해설</div>
			<div class="pageExplanation">코테 합격은 아무나 하나. 근!본!을 키우자</div>
			<img src="/images/알고리즘 해설.png" alt="알고리즘 해설 이미지" class="image">
		</div>
		<div id="algorithmList">
			
			<ul>				
				<li class="col_item">
						<div class="algorithmName">해시</div>
					
						<div class="briefing">
							각 단계에서 최선의 선택을 하는 방식으로 문제를 해결하는 알고리즘입니다. 
						</div>
						<a id="detailLink" href="/algorithm/explanation/detail/CC-20231017-000002">
					<div class="seeMore">보러가기
						
						<!-- <a href="/algorithm/explanation/detail/${algorithmexplanationVO.algorithmCategoryId}">보러가자</a> -->
						<!-- console.log(${algorithmexplanationVO.algorithmCategoryId}); -->
						<img class="more" src="/images/화살표.png/" alt="more">
						
					</div>
				</a>
				</li>
				
				<li class="col_item">
					<div class="algorithmName">구현</div>
					<div class="briefing">
						어떤 알고리즘을 사용할지, 어떤 자료구조를 활용할지 등을 결정하고 이를 코드로 옮기는 과정을 학습해보세요.
					</div>
					<div class="seeMore">보러가기
						<img class="more" src="/images/화살표.png/" alt="more">
					</div>
				</li>
				<li class="col_item">
					<div class="algorithmName">DFS/BFS</div>
					<div class="briefing">
						깊이 우선 탐색(DFS)과 너비 우선 탐색(BFS)으로 그래프를 탐색해보세요.	
					</div>
					<div class="seeMore">보러가기
						<img class="more" src="/images/화살표.png/" alt="more">
					</div>
				</li>
				<li class="col_item">
					<div class="algorithmName">정렬</div>
					<div class="briefing">데이터를 특정한 기준에 따라 순서대로 나열하는 알고리즘입니다. </div>
					<div class="seeMore">보러가기
						<img class="more" src="/images/화살표.png/" alt="more">
					</div>
				</li>
				<li class="col_item">
					<div class="algorithmName">이진탐색</div>
					<div class="briefing">
						탐색 범위를 절반씩 줄여가며 배열의 특정한 원소를 찾아가는 방법을 공부해보세요.
					</div>
					<div class="seeMore">보러가기
						<img class="more" src="/images/화살표.png/" alt="more">
					</div>
				</li>
				<li class="col_item">
					<div class="algorithmName">다이나믹 프로그래밍</div>
					<div class="briefing">
						작은 부분 문제들의 해결책으로 전체 문제의 해결책을 구하는 방식으로 동작하는 알고리즘을 얻어 가세요.
					</div>
					<div class="seeMore">보러가기
						<img class="more" src="/images/화살표.png/" alt="more">
					</div>
				</li>
				<li class="col_item">
					<div class="algorithmName">최단경로</div>
					<div class="briefing">
						그래프에서 두 정점 간의 가장 짧은 경로를 찾는 알고리즘입니다. 
					</div>
					<div class="seeMore">보러가기
						<img class="more" src="/images/화살표.png/" alt="more">
					</div>
				</li>
				<li class="col_item">
					<div class="algorithmName">그래프 이론</div>
					<div class="briefing">
						 그래프는 정점(Vertex)과 간선(Edge)의 집합으로 이루어져 있습니다. 간선들을 연결해볼까요?
					</div>
					<div class="seeMore">보러가기
						<img class="more" src="/images/화살표.png/" alt="more">
					</div>
				</li>
				<li class="col_item">
					<div class="algorithmName">기타</div>
					<div class="briefing">이외에도 코딩 테스트에 출제되는 알고리즘들을 공부해보세요.</div>
					<div class="seeMore">보러가기
						<img class="more" src="/images/화살표.png/" alt="more">
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>