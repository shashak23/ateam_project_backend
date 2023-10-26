<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>게시글 조회</title>
    <meta charset="UTF-8">  
    <title>Buffer Overflow</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"> 
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" /> 
    <script src="/js/lib/jquery-3.7.1.js"></script> 
    <link rel="stylesheet" href="/css/style.css"> 
    <jsp:include page="../layout/header.jsp"/>
 
</head> 
 
<script src="/js/lib/jquery-3.7.1.js"></script>
 <style>


        * {
            color: #333;
            font-size: 17px;
        }
        
        div.grid > div.replies {
            display: grid;
            grid-column: 1/3;
        }
        
        div.replies > .write-comment {
            margin-top: 10px;
            display: grid;
            grid-template-columns: 1fr 80px;
            grid-template-rows: 1fr 40px;
            row-gap: 10px;
            column-gap: 10px;
            align-items: center;
        }
        
        div.replies > .write-comment > textarea {
            height: 150px;
            display: grid;
            grid-column: 1/3;
        }
        
        div.replies > .comment-items {
            display: grid;
            grid-template-columns: 1fr;
            grid-template-rows: 1fr;
            row-gap: 10px;
        }
        
        pre.content {
            margin: 0px;
        }

        a:link,
        a:hover,
        a:visited,
        a:active {
            color: #333;
            text-decoration: none;
        }
        
        div.grid {
            display: grid;
            grid-template-columns: 80px 1fr;
            grid-template-rows: 28px 28px 28px 28px 28px 320px 1fr;
            row-gap: 10px;
        }

        div.grid > div.btn-group {
            display: grid;
            grid-column: 1/3;
        }
        
        div.grid div.right-align {
            text-align: right;
        }
        
        label {
            padding-left: 10px;
        }

        button,
        input,
        textarea {
            padding: 10px;
        }
		.modal {
            display: none; /* 초기에 모달 숨김 */
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.7); /* 반투명 배경 */
		    z-index: 1;
		}
		
		/* 모달 내용 스타일 */
		.modal-content {
		    position: relative;
		    margin: 15% auto;
		    padding: 20px;
		    width: 60%;
		    background-color: #fff;
		    border-radius: 5px;
		}
		
		/* 모달 닫기 버튼 스타일 */
		.close {
            position: absolute;
		    top: 10px;
		    right: 10px;
		    font-size: 20px;
		    cursor: pointer;
		    color: #888;
		}
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
        
        .container {
            display: inline-block;
            width: 980px;
            margin: 0 auto;
        
            
        }
        .button_list {
            margin-bottom: 15px;
            position: relative;
            left: 1120px;
            
        }
        .board_list_box {
            border-top: 3px solid var(--hashtag-blue);
            border-bottom:none;
            border-left: none;
            border-right: none;
            
            
            
          
        }
        
        .btn_st_2,.btn_st_3 {
            background-color: var(--hashtag-blue);
            border-radius: 5px;
            border: none;
            width: 60px; 
            height: 30px;
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
        
        .footer {
            margin-top: 100px;
        }
        
        #button_list_1 tr th {
            background-color: var(--light-gray);
           
            border-bottom: 1px solid var(--dark-gray);
            color: var(--dark-gray);
        
        }
        
        .table-header_01 {                        
            width: 50px;
            height: 35px;
        
         }
         .pratice_01,.pratice_02,.pratice_03,.pratice_04 {
            border-bottom: 1px solid var(--gray);
            text-align: center;
            color: var(--blue);
        
         }
         .pratice {
            margin-top: 42px;
            border-bottom: 1px solid var(--gray);
          
           
        
         }
         .text_controller {
            position: relative;
            bottom: 20px;
        
         }
        </style>
    </style>
    

            
            
<body>
    <p class="bbs_title">게시글 목록</p>
    <!-- 게시물 검색 -->
        <div class="button_list">
                <select class="select">
                    <option value="제목">제목</option>
                    <option value="작성자">작성자</option>
                </select>
            <input type="text" class="sc_text" placeholder="검색어 입력">
                <button type="submit" class="btn_st_2">
                    <a href="#">조회</a>
                </button>
                <!-- <button type="submit" class="btn_st_3">
                    <a href="/freeboard/create">등록</a>
                </button> -->
    </div>
    <div id="wrap" class="wrap">
        <!-- 본문 -->
        <section id="container" class="container">
            
            <main class="contents">         
                    <!-- 게시판 리스트 -->
                    <form action="#" method="">
                        <fieldset class="board_list_box">   
                            <div class="board_list_ty1">
                                <table>                                  
                                    <colgroup>
                                        <!-- 하나이상의 열을 그룹화 하며 col을 사용하여 표의 열에 대해서 정의합니다. -->
                                        <col width="10%"> <!-- 열의 넓이를 정의한다 -->
                                        <col width="*"><!-- 나머지공간을 모두 차지함 -->      
                                        <col width="10%">
                                        <col width="15%">
                                        <col width="10%">
                                    </colgroup>
                                    <div class="button_color">
                                    <thead id="button_list_1">
                                        <tr><!-- 하나의 셀이 col의 속성에대한 열의 속성의 헤더라는 뜻이다 -->                                 
                                            <th scope="col" class="table-header_01">번호</th>
                                            <th scope="col" class="table-header_02">제목</th>
                                            <th scope="col" class="table-header_03">등록자</th>
                                            <th scope="col" class="table-header_04">등록일</th>
                                            <th scope="col" class="table-header_05">조회수</th>
                                        </tr>
                                    </thead>
                                    </div>
                                    <tbody>
                                        <c:forEach items="${generalPostListVO.generalPostList}" var="freeboard">
                                            <tr>                                                
                                                <td class="pratice_01">${freeboard.generalPostId}</td>                                          
                                                <td><!--자유게시판의 내용을 가져와 반복하는 태그 -->
                                                <div class="pratice">
                                                <a class="text_controller" href="/freeboard/view/${freeboard.generalPostId}">
                                                        ${freeboard.postTitle}
                                                </a>
                                                </div>
                                                </td>
                                                <td class="pratice_02">${freeboard.postWriter}</td>
                                                <td class="pratice_03">${freeboard.postDate}</td>
                                                <td class="pratice_04">${freeboard.viewCnt}</td>
                                                
                                            </tr>
                                            
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>                       
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
            <!-- <footer id="footer" class="footer">
                <div class="inner">
                    <address>
                        <span>상호명 : SNAPCHAT</span>
                        <span>개인정보책임관리자 : 홍길동</span>
                        <span>주소 : kt ds</span>
                        <span>사업자등록번호 : 313-34432</span>
                    </address>
                    <div class="copyright">
                        &copy; 2023 by SNAPCHAT. All rights reserved
                    </div>
                </div>
            </footer> -->
    <jsp:include page="../layout/footer.jsp" />


</head>
<body>
   <h1>게시글 조회</h1>
   	<!-- 좋아요 기능 -->
	<button id="like-btn">좋아요</button>
	
	<!-- 신고 기능 -->
	<button id="reportQnABoard" value="3" class="report-btn">신고</button>
   		<!-- 모달 창 -->
			<div id="report-modal" class="modal">
			    <div class="modal-content">
			        <span class="close" id="cancel-modal">취소</span>
			        	<!-- 모달 내용 추가 -->
						<h2>신고 내용</h2>
						<form name="reportVO" method="post" action="/report/view/3">
							<div>
								<label for="reportReason" >신고사유${reportVO.reportReason}
									<select name="reportReason">
										<option value="6">영리 및 홍보 목적</option>
										<option value="7">개인정보노출</option>
										<option value="8">음란성/선정성</option>
										<option value="9">같은 내용 반복(도배)</option>
										<option value="10">이용규칙위반</option>
										<option value="11">기타</option>
									</select>
								</label>
					
								<label for = "reportReasonContent">신고 상세내용
								<textarea name="reportReasonContent" id="reportReasonContent">${reportVO.reportReasonContent}</textarea></label>
							
								<label for="attachedImg">첨부파일${reportVO.attachedImg}</label>
								<input id="attachedImg" type="file" name="attachedImg"/>
								
								<label for="reportTypeId">${reportVO.reportTypeId}</label>
								<input id="reportTypeId" type="hidden" name="reportTypeId" value="1"/>
								
								<label for="reportMemberEmail">${reportVO.reportMemberEmail}</label>
								<input id="reportMemberEmail" type="hidden" name="reportMember" value="${reportVO.reportMember}"/>
							
								<label for="receivedReportMemberEmail">${reportVO.receivedReportMemberEmail}</label>
								<input id="receivedReportMemberEmail" type="hidden" name="receivedReportMember" value="${generalPostVO.postWriter}"/>
							
								<label for="reportContentId">${reportVO.reportContentId}</label>
								<input id="reportContentId" type="hidden" name="reportContentId" value="${generalPostVO.generalPostId}"/>
							</div>
							<div class="btn-group">
								<div class="right-align">
									<input type="submit" value="완료" />
				
								</div>
							</div>		
						</form>
					</div>
				</div>
   <div class="grid">
      <label for="postTitle">제목</label>
      <div>${generalPostVO.postTitle}</div>
      <label for="postWriter">이메일</label>
      <div>${generalPostVO.postWriter}</div>
      <label for="viewCnt">조회수</label>
      <div>${generalPostVO.viewCnt}</div>
      <label for="postDate">등록일</label>
      <div>${generalPostVO.postDate}</div>
      <label for="postContent">내용</label>
      <div>${generalPostVO.postContent}</div>
      <div class="replies">
         <div class="comment-items"></div>
         <div class="write-comment">
            <textarea id="txt-comment"></textarea>
            <button id="btn-save-comment">등록</button>
            <button id="btn-cancel-comment">취소</button>
         </div>
      </div>
   </div>
   <!-- <form name="generalPostVO" method="post" action="/freeboard/view/${generalVO.generalPostId}"> -->
   <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
       <div class="btn-group">
           <div class="right-align">
               <div class="update_btn">
                   <div class="btn">
                       <a href="/freeboard/update/${generalPostVO.generalPostId}">수정</a>
                       <a href="/freeboard/delete/${generalPostVO.generalPostId}">삭제</a>
                   </div>
               </div>
           </div>
       </div>
   </c:if>

</body>
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
    $(document).ready(function() {
        var loadReplies = function() {
            // 댓글 목록 삭제.
            $(".comment-items").html("");
            
            // 댓글 조회.
            $.get('/freeboard/view/comment/${generalPostId}', function(response) {
                console.log('gg');
                
                // 댓글 목록을 response에서 받아와서 처리하는 부분
                var replies = response.comments;
                for (var i = 0; i < replies.length; i++) {
                    var comment = replies[i];
                    
                    var commentTemplate =
                        `<div class="comment" data-comment-id="\${comment.generalCommentId}"
                            style="padding-left: \${(comment.level - 1) * 40}px">
                            <div class="author">\${comment.commentWriter}</div>
                            <div class="recommend-count">추천수: \${comment.likeCnt}</div>
                            <div class="datetime">
                                <span class="crtdt">등록: \${comment.postDate}</span>
                                \${comment.mdfyDt != comment.crtDt ? 
                                    '<span class="update">수정: ' + comment.mdfyDt + '</span>'
                                    : ''}
                            </div>
                            <pre class="content">\${comment.commentContent}</pre>
                            \${comment.email == "${sessionScope._LOGIN_USER_.email}" ?
                                '<div>' +
                                '<button class="recommend-comment">추천하기</button>' +
                                '</div>'
                                :
                                '<div>' +
                                    '<button class="recommend-comment">추천하기</button>' +
                                    
                                    '<button class="delete-comment">삭제</button>' +
                                '</div>'}
                        </div>`;
                    var commentDom = $(commentTemplate);
                    commentDom.find('.delete-comment').click(deleteComment);
                    // 추천 버튼 클릭 이벤트 핸들러를 등록합니다.
                    commentDom.find('.recommend-comment').click(recommendComment);
                    //commentDom.find('.recommend-comment').click(recommendcomment);
                    $(".comment-items").append(commentDom);
                }
            })// $.get
    } // loadReplies
    loadReplies()
    
    // 등록버튼 클릭
    $("#btn-save-comment").click(function(event) {
        event.preventDefault();
        // console.log("나올까요sdadsa?");
		    // 서버로 추천 요청을 보냅니다.
		    $.get('/freeboard/comment/like/' + commentId, function(response) {
		        if (response.result) {
		            // 추천이 성공적으로 처리되면 추천 수를 업데이트합니다.
		            var likeOneComment = commentDom.find(".recommend-count");
		            var currentCount = parseInt(likeOneComment.text().split(":")[1].trim());
		            console.log(currentCount)
		            $('.recommend-count').text("추천수: " + (currentCount + 1));
		            alert("댓글이 추천되었습니다.");
		        } else {
		            // 추천에 실패한 경우 오류 메시지를 표시하거나 다른 조치를 취합니다.
		            alert("댓글 추천에 실패했습니다.");
		        }
		    });
		})
        
		// 신고버튼, 좋아요 버튼
		$().ready(function() {
		    // "신고" 버튼 클릭 시 모달 열기
		    $(".report-btn").click(function() {
		    	let reportType = $("#reportQnABoard").val()
			    console.log(reportType);
		        $("#report-modal").css("display", "block");
		    
		    	// 모달 내부 "취소" 버튼 클릭 시 모달 닫기
		    	$(".close").click(function() {
		    		console.log("!")
		    	 	$("#report-modal").css("display", "none");
		   		});
		    });
		    console.log($("jsp:param[name='reportType']"))
	
		    
		    // // "좋아요" 버튼 클릭 시 이벤트 발생ㄴ
		    // $("#like-btn").click(function () {
			// 	// 클라이언트에서 AJAX 요청 생성
		    //     $.ajax({
		    //     	method: "POST",
		    //     	url: "/qnaboard/like",
		    //     	data: [{ 
		    //     		"generalPostId": "${generalPostVO.generalPostId}",
		    //     		"likeCnt": ${generalPostVO.likeCnt}
		    //     	},
		    //     	success: function(response) {
		    //     		/* $("likeModal").hide(); */
		    //     		alert("좋아요가 눌렸습니다!!!!!!!!!!!!");
		    //     	},
		    //     	error: function(error){
		    //     		/* $("#likeModal").hide(); */
		    //     		alert("오류가 발생했습니다~~~~~~~~~~~~");
		    //     	}
		    //     })
		    // });
	
		});
        
        });
         
 </script>     
             
    
</html>