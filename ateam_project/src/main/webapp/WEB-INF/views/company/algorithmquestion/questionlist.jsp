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
				$("#algorithm_category").append(checkbox);
				$("#algorithm_category").append(label);
				$("#algorithm_category").append(space);
				li.append(checkbox);
				li.append(label);
				li.append(space);
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
			}
		})
		
		$.get("/member/COMPANY", function(response) {
			for (var i = 0; i < response.length; i++) {
				var member = response[i]
				var option = $("<option value='"+member.nickname+"'></option>");
				$("#nicList").append(option);
			}
		});
		
		$("#search-btn").click(function() {
			$("#search-form").attr({
				"method": "get",
				"action": "/algorithm/question/list"
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

  //검색 전후 마진 바텀 적용
  $("#search_btn").click(function() {
        // 검색이 수행되었는지 확인하고 여백을 동적으로 조절합니다.
        if ($("#search_form input[type='checkbox']:checked").length > 0) {
            $("#overall").css("margin-bottom", "300px");
            // $("#container").css("margin-bottom", "100px");
        } else {
            // 검색이 수행되지 않았다면 여백을 초기화합니다.
            $("#left_container").css("margin-bottom", "0");
            $("#container").css("margin-bottom", "0");
        }

        // 폼 제출을 계속 진행합니다.
        $("#search_form").attr({
            "method": "get",
            "action": "/algorithm/explanation/list"
        }).submit();
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

	#left_container{
		display: flex;
		justify-content: center;
		width:300px;
		padding-right: 30px;
		
	}

	#toolbar{
		width: 300px;
		position: fixed;
		margin: 25px 0px 0px 20px;
		width: 200px;
		padding: 15px;
		align-items: center; 	
		
	}

	#pageName{
		font-weight: bold;
		font-size:x-large;
		margin-bottom: 10px;
	}

	#toolbar > #registerArticle{
		width:180px;
	}

	#toolbar > #registerArticle > .register{
		width: 180px;
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

	label {
    margin-left: 5px;
	}
	
	#container{
		width: 1000px;
		margin: 40px 0px 100px 0px;
		/* margin:0 auto; */
		display: flex;
	}

	#searchCategory{
		margin-bottom: 5px;
	}

	#level{
		margin: 150px 0px 5px 0px;
	}

	#algorithm_category{
		height:60px
	}

	h3{
		margin-top: 170px;
	}
	a:link, a:hover, a:active, a:visited {
		color: #333;
		text-decoration: none;
	}

	.table {
		border-collapse: collapse;
		
		font-size: 14px;
		width:1000px;
		margin-bottom: 100px;
	}
	table.table > thead > tr {
		background-color: #FFF;
	}
	.table th {
    padding: 10px;
    background-color: var(--light-gray);
    border-bottom: 1px solid var(--dark-gray);
    height: 35px;
    color: var(--dark-gray);
    font-weight: bold; 
}
	 tbody td {
		border-bottom: 1px solid var(--dark-gray);
		color: var(--dark-gray);
	}
	/*
	table.table th:last-child, table.table td:last-child {
		border-right: none;
	}
	table.table > tbody tr:nth-child(odd) {
		background-color: #f5f5f5;
	}
	table.table > tbody tr:hover {
		background-color: #FAFAFA;
	} */
	table.table > tbody td {
		padding: 10px;
		color: #333;
		text-align: center;
		color: var(--dark-gray);
		border-bottom: 1px solid var(--dark-gray);
	}

	#upload{
		width: 70px;
   		height: 30px;		
		border:none;
		border-radius: 5px;
		background-color: var(--light-blue);
   		cursor: pointer;
		/* transition: box-shadow 0.1s ease; */
	}

	/* #upload:hover{
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); 
	} */

	/* .search_area > #search-form > #companyName{
		font-weight: bold;
		margin-top: 30px;
		margin-bottom: 5px;
	} */

	.search_area > #search-form > #search_items > .gohome .reset{	
		height:40px;
		width:40px;	
		vertical-align: middle; 
  		margin-right: 5px; 
	}

	.button_list{
		display: flex;
		margin-top: 20px;
	}

	.btn_st_2{
		position: absolute;
		left: 155px;
    	bottom: 15px;
		width: 70px;
		height: 30px;
		border-radius: 5px;
		cursor: pointer;
		margin-left: 5px;
		border: none;
		background-color: transparent;
	}

	.sc_text{
		/* margin-bottom: 110px; */
		padding:6px;
	}

	.reset{
		background-color: var(--light-blue);
		border: none;
		width: 70px;
		height: 30px;
		border-radius: 5px;
		cursor: pointer;
		margin-left: 5px;
	}

	#spaceBottom{
		border:none;
		margin-bottom: 30px;
	}
	
</style>
<body>
	<div id="overall">
		<div id="left_container">
			<div id="toolbar">
				<div id="pageName">코딩테스트</div>
				<div id="registerArticle">
					<button class="register" type="button" onclick="location.href='/algorithm/question/create';">글작성</button>
				</div>
				<div class="search_area">
					<form id="search-form"
						method="get"
						action="/algorithm/question/list">
						<label id="algorithmCategoryId" for="algorithmCategoryId">
							<h4 id="searchCategory">카테고리</h4>
						</label>
						<div id="searchTop"></div>
						<div id="algorithm_category"></div>
						
						<label id="algorithmTier" for="algorithmTier">
							<h4 id="level">문제 난이도</h4>
						</label>
						<div>
							<div><input type="checkbox" name="algorithmTierList" value="Lv.1"/><label for="Lv.1">Lv.1</label></div>
							<div><input type="checkbox" name="algorithmTierList" value="Lv.2"/><label for="Lv.2">Lv.2</label></div>
							<div><input type="checkbox" name="algorithmTierList" value="Lv.3"/><label for="Lv.3">Lv.3</label></div>
							<div><input type="checkbox" name="algorithmTierList" value="Lv.4"/><label for="Lv.4">Lv.4</label></div>
							<div><input type="checkbox" name="algorithmTierList" value="Lv.5"/><label for="Lv.5">Lv.5</label></div>
						</div>
						<!-- <div id="companyName">
							<label  for="company"></label>
						</div> -->
			
						<div class="button_list">   
							<!-- <input autocomplete="off" class="sc_text" type="text" placeholder="검색어 입력" name="searchKeyword" list="nicList" />
							<datalist id="nicList"></datalist>
							<button type="submit" id="click_search" class="btn_st_2">조회</button> -->
							<input class="sc_text" type="text" placeholder="기업명을 입력하세요." name="searchKeyword" value="${SearchAlgorithmQuestionVO.searchKeyword}" />
							<button type="submit" class="btn_st_2">
								<img src="/images/search.svg" alt="search">
								<!-- <a href="#" id="search-btn">조회</a> -->
							</button>
							<button class="reset">
								<a href="/algorithm/question/list">초기화</a>
							</button>
							<!-- <button type="submit" class="btn_st_3">
								<a href="/freeboard/create">등록</a>
							</button> -->
						</div>
						
			
						<!-- 주석 처리 풀고 추후 수정 -->
						<!-- <div id="search_items">
							<input autocomplete="off" type="text" name="searchKeyword" list="nicList" />
							<datalist id="nicList"></datalist>
							<button id="search-btn">검색</button>
							<a href="/algorithm/question/list" class="gohome">
								<img src="/images/reset.png" alt="검색초기화" class="reset">
							</a>
						</div> -->
						<!-- <div>
							<button id="search-btn">적용</button>	
						</div> -->
					</form>
				</div>
			</div>
			<div id="spaceBottom"></div>
		</div>
		<div id="container">	
			<div class="btn-group"  style="margin-bottom: 20px;">
				<div class="right-align">
					<!-- 로그인 하지 않았을 때 -->
					<c:if test="${empty sessionScope._LOGIN_USER_}">
						<a href="/member/auth">로그인하기</a>
					</c:if>
					<!-- 기업회원에게만 보임  -->
					<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'COMPANY'}">
						<button id="upload">
							<a href="/algorithm/question/create">문제 등록</a>
						</button> 
					</c:if>
				</div>
			</div>

			<table class="table">
				<thead>
					<colgroup>
						<col width=55px; />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
						<col width="*%" />
						<col width=100px; />
					</colgroup>
					<tr>				
						<th>번호</th>
						<th>알고리즘</th>				
						<th>작성자</th>
						<th>난이도</th>
						<th>제목</th>
						<th>문제 내용 미리보기</th>				
						<th>정답률</th>				
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty algorithmQuestionList.algorithmQuestionList}">
						<c:forEach items="${algorithmQuestionList.algorithmQuestionList}" var="algorithmquestion" varStatus="index">
							<tr>
								<td>${(index.index + 1) * (searchForumVO.pageNo + 1)}</td>
								<td>${algorithmquestion.commonCodeVO.codeContent}</td>
								<td>${algorithmquestion.memberVO.nickname}</td>
								<td>${algorithmquestion.algorithmTierId}</td>
								<td style="font-weight: bold;">
									<a href="/algorithm/question/view/${algorithmquestion.companyAlgorithmQuestionId}">
										<c:out value="${algorithmquestion.algorithmTitle}" />
									</a>
								</td>
								<td>${algorithmquestion.algorithmContent}</td>			
								<td>정답률</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		</div>
		<jsp:include page="../../layout/footer.jsp"></jsp:include>
	</body>
</html>