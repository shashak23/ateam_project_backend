<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
$().ready(function() {
	$.get("/code/알고리즘카테고리", function(response) {
		for (var i = 0; i < response.length; i++) {
			var code = response[i]
			var checkbox = $("<input type='checkbox' id='"+code.codeId+"' name='algorithmCategoryIdList' value='"+code.codeId+"' />");
			var label = $("<label for='"+code.codeId+"'>"+code.codeContent+"</label>");
			var space = $("<span class='checkbox-space'> </span>");
			$("#algorithm_category").append(checkbox);
			$("#algorithm_category").append(label);
			$("#algorithm_category").append(space);
		}
	});
	
	document.querySelectorAll('input[type="checkbox"]:checked')
	const ul = document.querySelector('ul')
	let selected = [];
	
	ul.addEventListener('change', event => {
		if(event.target.type == 'checkbox') {
			const checked = document.querySelectorAll('input[type="checkbox"]:checked')
			selected = Array.from(checked).map(x => x.value)
		}
	})
	
	$("#search_btn").click(function() {
		$("#search_form").attr({
			"method": "get",
			"action": "/algorithm/explanation/list"
		}).submit()
	});
	
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
	.checkbox-space {
    margin-right: 5px;
}
	#container{
		width: 1000px;
		margin-top: 40px;
		margin:0 auto;
		margin-bottom: 100px;
	}

	h3{
		margin-top: 100px;
	}

	#algorithm_category{
		width: 500px;
		margin-top: 10px;
		margin-bottom: 20px;
	}
	a:link, a:hover, a:active, a:visited {
		color: #333;
		text-decoration: none;
	}

	.search_area{
		margin-bottom: 20px;
	}

	.search_area > #search_form > .type{
		width:50px;
		height:40px;
		transition: box-shadow 0.3s ease;
		border-radius: 4px;
	}

	.search_area > #search_form > .type:hover{
		border: 2px solid #1E90FF; 
	}

	.search_area > #search_form > #search_bar{
		width: 500px;
		height:40px;
		transition: box-shadow 0.3s ease;
		padding:6px;	
	}

	.search_area > #search_form > #search_bar::after{
		content:"돋보기";
	}

	.search_area > #search_form > #search_bar:hover{
		border: 2px solid #1E90FF; 
	}

	#category_area{
		display:flex;
		width: 700px;
	}

	.search_area > #search_form > #category_area > #search_btn{
		background-color: var(--light-blue);
		border: none;
		width: 70px;
		height: 30px;
		border-radius: 5px;
		cursor: pointer;
		margin: 10px 0px 0px 30px;
		/* transition: box-shadow 0.3s ease; */
	}

	/* .search_area > #search_form > #category_area > #search_btn:hover{
		border: 2px solid #1E90FF; 
	} */

	.search_area > #search_form > .gohome > .reset{	
		height:40px;	
		vertical-align: middle; 
  		margin-top: 0; 
	}

	table.table {
		border-collapse: collapse;
		margin-top: 30px;
		width:1000px;
		margin: 0 auto;
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

	.button_list{
		margin-left: 700px;
		height:50px;
	}

	#click_search{
		background-color: var(--light-blue);
		border: none;
		width: 70px;
		height: 30px;
		border-radius: 5px;
		cursor: pointer;
	}



</style>
<body>
	<div id="container">
		<div class="search_area">
			<form id="search_form"
				method="get"
				action="/algorithm/explanation/list">
				<label for="algorithmCategoryId" id="algorithmCategoryId">
					<h3>상세 검색</h3>
				</label>
				<div id="category_area">
					<div id="algorithm_category"></div>	
					<button id="search_btn">적용</button>
				</div>
				

				<div class="button_list">
					<select class="type" name="searchType">
						<option value="postTitle" ${searchAlgorithmExplanationVO.searchType eq 'postTitle' ? 'selected' : ''}>제목</option>
						<option value="postContent" ${searchAlgorithmExplanationVO.searchType eq 'postContent' ? 'selected' : ''}>내용</option>
						<option value="postWriter" ${searchAlgorithmExplanationVO.searchType eq 'postWriter' ? 'selected' : ''}>작성자</option>
					</select>
				<input type="text" class="sc_text" placeholder="검색어 입력">
					<button type="submit" class="btn_st_2">
						<a href="#" id="click_search">조회</a>
					</button>
					<!-- 주석 처리 된 것 풀고 button_list안에 있는 select태그 가져오기 -->
					<!-- <button type="submit" class="btn_st_3">
						<a href="/freeboard/create">등록</a>
					</button> -->
		</div>

				<!-- <input id="search_bar" type="text" name="searchKeyword" value="${searchAlgorithmExplanationVO.searchKeyword}" />
				<a href="/algorithm/explanation/list" class="gohome">
					<img src="/images/reset.png" alt="검색초기화" class="reset">
				</a> -->
			</form>
			
		</div>	
	<div class="btn-group">
		<div class="right-align">
			<!-- 로그인 하지 않았을 때
		    <c:if test="${empty sessionScope._LOGIN_USER_}">
		        <a href="/member/auth">로그인하기</a>
		    </c:if> -->
			<!-- 기업회원에게만 보임 -->
			<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'COMPANY'}">
				<a href="/algorithm/explanation/create">게시글 등록</a>
			</c:if>
		</div>
	</div>
	<table class="table">
		<thead>
			<colgroup>
				<col width="10%" />
				<col width="*" />
				<col width="10%" />
				<col width="10%" />
				<col width="15%" />
				<col width="10%" />
			</colgroup>
			<tr id="table-tr">
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">카테고리</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		
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
	</div>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>