<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<link rel="stylesheet" type="text/css" href="/css/common.css" />
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
			window.location.href="/algorithm/question/list"
		}
		if (memberType === 'COMPANY') {
			window.location.href="/algorithm/question/create"
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

  //검색 전후 마진 바텀 적용
  $("#search_btn").click(function() {
        // 검색이 수행되었는지 확인하고 여백을 동적으로 조절합니다.
        if ($("#search_form input[type='checkbox']:checked").length > 0) {
            $("#body_container").css("margin-bottom", "300px");
            // $("#container").css("margin-bottom", "100px");
        } 
		else {
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
	  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
    text-decoration: none;
    color: var(--dark);
}

	body > .body_container {
    width: 100%;
    display: grid;
    grid-template-columns: 1fr 1080px 1fr;
	}

	body > .body_container > .body {
    grid-column: 2/3;
	}

	body > .body_container > .body_left_aside {
    grid-column: 1/2;
	}

	body > .body_container > .body_right_aside {
    grid-column: 3/4;
	}

	#toolbar{
		margin: 25px auto 0;
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

	.resetIcon{
		width: 35px;
		height: 34px;
		background-color: transparent;
		
	}

	h3{
		margin-top: 170px;
	}
	a:link, a:hover, a:active, a:visited {
		color: #333;
		text-decoration: none;
	}

	/* common css */
	table {
		border-collapse: collapse;
		margin: 40px 0 100px 0;
	}

	table > caption {
		font-weight: bold;
		font-size: 20px;
		margin-bottom: 10px;
		margin-top: 10px;
		text-align: left;
	}

	table.grid > thead > tr {
		border-bottom: 1px solid var(--dark-gray);
	}

	.grid th {
		background-color: var(--light-gray);
		color: var(--dark-gray);
		padding: 10px 0;
		
	}

	table.grid > tbody > tr > td {
		padding: 10px 0;
		color: var(--dark-gray);
		text-align: center;
	}

	#upload{
		width: 70px;
   		height: 30px;		
		border:none;
		border-radius: 5px;
		background-color: var(--light-blue);
   		cursor: pointer;
	}
	.button_list{
		display: flex;
		margin-top: 20px;
	}

	.btn_st_2{
		position: relative;
		left: -33px;
		bottom: -5px;
		width: 70px;
		height: 30px;
		border-radius: 5px;
		cursor: pointer;
		margin-left: 5px;
		border: none;
		background-color: transparent;
		opacity: 0.4;
	}

	.sc_text{
		padding:6px;
		width: 165px;
	}

	.resetLink{
		position: relative;
    	left: -38px;
		width: 30px;
   		height: 30px;
		
	}

	#spaceBottom{
		border:none;
		margin-bottom: 30px;
	}
	
</style>
<body>
	<div class="body_container">
		<div class="body_left_aside">
			<div id="toolbar">
				<div id="pageName">코딩테스트</div>
					<div id="registerArticle">
						<button class="register" type="button" >글작성</button>
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
						<div class="button_list">   							
							<input class="sc_text" type="text" placeholder="기업명을 입력하세요." name="searchKeyword" value="${SearchAlgorithmQuestionVO.searchKeyword}" />
							<button type="submit" class="btn_st_2">
								<img src="/images/search.svg" alt="search">								
							</button>				
								<a href="/algorithm/question/list" class="resetLink">
									<img class="resetIcon" src="/images/reset.png" alt="reset">
								</a>									
						</div>
					</form>
				</div>
			</div>
			<div id="spaceBottom"></div>
		</div>
		<div class="body">	
			<div class="btn-group"  style="margin-bottom: 20px;">
				<div class="right-align">					
					<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'COMPANY'}">
						<!-- <button id="upload">
							<a href="/algorithm/question/create">문제 등록</a>
						</button>  -->
					</c:if>
				</div>
			</div>
			<table class="grid">
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
								<td>
									${algorithmquestion.correctPercentage}
								<%-- <c:set var="loop" value="true"/>
								<c:forEach items="${algorithmQuestionList.percentageList}" var="percentage" varStatus="status">
									<c:if test="${loop}">
										<c:set var="percentageList" value="${algorithmQuestionList.percentageList}" />
										<c:choose>
											<c:when test="${fn:length(percentageList) - 1 == status.index and algorithmquestion.companyAlgorithmQuestionId != percentage.companyAlgorithmQuestionId}">
												0%
											</c:when>
											<c:otherwise>
												<c:if test="${algorithmquestion.companyAlgorithmQuestionId == percentage.companyAlgorithmQuestionId}">
													<c:choose>
												        <c:when test="${not empty percentage.correctPercentage and percentage.correctPercentage != ''}">
												            ${percentage.correctPercentage}%
												            <c:set var="loop" value="false"/>
												        </c:when>
												        <c:otherwise>
												            0%
												            <c:set var="loop" value="false"/>
												        </c:otherwise>
												    </c:choose>
												</c:if>									
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach> --%>
								</td>
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
		<div class="body_right_aside"></div>
	</div>
		<jsp:include page="../../layout/footer.jsp"></jsp:include>
	</body>
</html>