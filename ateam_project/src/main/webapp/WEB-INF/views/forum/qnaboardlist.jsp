<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <!DOCTYPE html>
    <html lang="ko">
      <head>
        <meta charset="utf-8" />
        <title>SnapChat</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
          name="viewport"
          id="viewport"
          content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width"/>
    	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" type="text/css" href="/css/swiper.min.css">
        <link rel="stylesheet" type="text/css" href="/css/style.css" />
		<jsp:include page="../layout/header.jsp"/>
        <script src="js/lib/jquery-3.7.1.js"></script>
		<style>
			table {
            border-collapse: collapse;
            }
            .bbs_title {
                font-weight: bold;
                font-size: 25px;
                margin: 80px 100px 30px 430px;

            }

            .wrap {
                display: flex;
                justify-content: center;        
            }

			.list_search {
				margin-bottom: 15px;
                position: relative;
                left: 1120px;
			}
			.board_list_box {
				position: relative;
				left: 500px;
                border-top: 3px solid var(--hashtag-blue);
                border-bottom:none;
                border-left: none;
                border-right: none;
				width: 1000px;

				
                
                
                
              
            }
			.btn_write_1,.btn_write_2 {
            position: relative;
            left: 830px;
            margin-top: 30px;
            background-color: var(--hashtag-blue);
            color: white;
            border-radius: 5px;
            border: none;
            width: 70px; 
            height: 30px;
            margin-bottom: 50px;
            }
			
			.table-header_01 {                        
                width: 50px;
                height: 35px;
                
               
                
             }
			 #page {
            text-align: center;
            }

            #page > a {
            margin-top: 15px;
            margin-bottom: 15px;
            padding: 5px 10px 5px 10px;
            display: inline-block;
            border-radius: 4px;
            background-color: #FFF;
            color: #666;
            text-decoration: none;
            }

            #page > a.active_page {
                border: 1px solid var(--red);
                color: var(--red);
                font-weight: bold;
            }




			
		</style>
      </head>
      <body>
    <div id="wrap" class="wrap">

      

				
	</div>


   
			<!-- mainVisual -->
			<div class="mainVisual">
				<div class="slider">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide visaul_01"></div>
							<div class="swiper-slide visaul_02"></div>
							<div class="swiper-slide visaul_03"></div>
						</div>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>


      

				<!-- 내용 -->
				<main class="contents">
					<div class="board">
						<p class="bbs_title">게시글 목록</p>
						
						<!-- 게시물검색 -->
						<div class="list_search">
							<select name="searchType">
						            <option value="subject" ${searchForumVO.searchType eq 'subject' ? 'selected' : ''}>제목</option>
						            <option value="content" ${searchForumVO.searchType eq 'content' ? 'selected' : ''}>내용</option>
						            <option value="writer" ${searchForumVO.searchType eq 'email' ? 'selected' : ''}>이메일</option>
						    </select>
							<input type="text" class="sc_text" placeholder="검색어 입력" name="searchKeyword" value="${searchForumVO.searchKeyword}" />

							<button type="submit" class="btn btn_st_2">
								<a href="#">조회</a>
							</button>
							<button type="submit" class="btn btn_st_3">
                                <a href="/qnaboard/create">등록</a>
							</button>
                            <div class="right-align">
								총 ${generalPostListVO.boardCnt} 건의 게시글이 검색되었습니다.
							</div>
						</div>

						<!-- 게시판 리스트 -->
						<form action="" method="">
							<fieldset class="board_list_box">
								<!-- 리스트 -->
								<div class="board_list_ty1">
										<table>
												<colgroup>
														<col width="10%">
														<col width="*">
														<col width="10%">
														<col width="15%">
														<col width="10%">
												</colgroup>
												<thead id="button_list_1">
														<tr>
																<th scope="col" class="table-header_01">번호</th>
																<th scope="col" class="table-header_02">제목</th>
																<th scope="col" class="table-header_03">등록자</th>
																<th scope="col" class="table-header_04">등록일</th>
																<th scope="col" class="table-header_05">조회수</th>
														</tr>
												</thead>
												<tbody>
													<c:forEach items="${generalPostListVO.generalPostList}" var="qnaboard">
                                                            <tr>
                                                                <td>${qnaboard.generalPostId}</td>
                                                                <td>
                                                                    <a href="/qnaboard/view/${qnaboard.generalPostId}">
                                                                        ${qnaboard.postTitle}
                                                                    </a>
                                                                </td>
                                                                <td>${qnaboard.postWriter}</td>
                                                                <td>${qnaboard.postDate}</td>
                                                                <td>${qnaboard.viewCnt}</td>
                                                            </tr>
                                                     </c:forEach>											
												</tbody>
										</table>
								</div>
								<!-- button -->
								<!-- div class="btn_set btn_right">
									<div class="btn btn_st_1">
												<a href="/qnaboard/create">글쓰기</a>
											</div>
										</div> -->

								<!-- paginate -->							
							</fieldset>
							<div class="btn_write">
								<button type="submit" class="btn_write_1">
									<a href="/freeboard/create">글쓰기</a>
								</button>
								<button type="submit" class="btn_write_2">
									<a href="/freeboard/create">엑셀파일</a>
								</button>
							</div>
							<div id="page">
								<a class="active_page" href="javascript:void(0)">1</a>
								<a href="#">2</a>
								<a href="#">3</a>
								<a href="#">4</a>
								<a href="#">5</a>
								<a href="#">다음</a>
							</div>
						</form>
					</div>
				</main>
	  <jsp:include page="../layout/footer.jsp" />
    </div>

		<script src="./js/jquery-1.11.3.min.js"></script>
		<script src="./js/jquery.easing.1.3.js"></script>
		<script src="./js/swiper.min.js"></script>
		<script src="./js/common.js"></script>

  </body>
											<script>
												$().ready(funtion() {
													alert('힘내용ㅎㅎ');
													
									//         		$.get('/code/질답게시판', function(response) {
									//         			for (let i = 0; i < response.length; i++) {
									//         				let template = `
									//         					<tr>
									//         				    	<td>${qnaboard.generalPostId}</td>
									//         				    		<td>
									//         				      			<a href="/qnaboard/view/${qnaboard.generalPostId}">
									//         				        			${qnaboard.postTitle}
									//         				      			</a>
									//         				    		</td>
									//         				    	<td>${qnaboard.postWriter}</td>
									//         				    	<td>${qnaboard.postDate}</td>
									//         				    	<td>${qnaboard.viewCnt}</td>
									//         				  	</tr>
									//         				`
									//         			}
									//         		})
												})
											</script>
											<script>
												// 미완성된 기능을 알려주는 모달창
												$('.incomplete').click(function() {
													$('.modal, .overlay').addClass('modal_active')
												})
												$('.overlay').click(function() {
													$('.modal, .overlay').removeClass('modal_active')
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
</html>
