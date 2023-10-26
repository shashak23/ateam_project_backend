<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link, a:hover, a:visited, a:active {
	color: #333;
	text-decoration: none;
}

.grid {
	display: grid;
	grid-template-columns: 80px 1fr;
	grid-template-rows: 28px 28px 28px 28px 28px 320px 1fr;
	row-gap: 10px;
}

.grid>.btn-group {
	display: grid;
	grid-column: 1/3;
}

.grid .right-align {
	text-align: right;
}

label {
	padding-left: 10px;
}

button, input, textarea {
	padding: 10px;
}

.comments {
	height: 400px;
	width: 800px;
}

.comments>.comment-header {
	display: grid;
	grid-template-columns: 95px 100px 1fr;
	height: 50px;
}

.comments>.comment-header>.comments-count {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: medium;
	font-weight: 800;
	margin-right: 45px;
}

.comments>.comment-header>.str-count {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: small;
	font-weight: 300;
	
	padding-left: 530px;
}

.comments>.write-comment {
	display: grid;
	grid-template-rows: 1fr;
	column-gap: 10px;
	align-items: center;
    
}

.comments>.write-comment>textarea {
	height: 150px;
	resize: none;
    border-color: lightgray;
}

.comments> .comment-option{
border-color: #333;
border:1px solid lightgrey;
}

.comments>.comment-option> #btn-save-comment {
	background-color: #7BCA30;
	width: 70px;
    cursor: pointer;
    border:lightgray;
}

pre.content {
	margin: 0px;
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
</style>
 <script src="/js/lib/jquery-3.7.1.js"></script>
 <script type="text/javascript">    
        $(document).ready(function() {
            var loadReplies = function() {
                // 댓글 목록 삭제.
                $(".comment-items").html("");

                // 댓글 조회.
                $.get("/qnaboard/view/comment/${generalPostId}", function(response) {               
                    // 댓글 목록을 response에서 받아와서 처리하는 부분
                    var replies = response.comments;
                    for (var i = 0; i < replies.length; i++) {
                        var comment = replies[i];
                        var commentTemplate =
                            `<div class="comment"
                            	data-comment-id="\${comment.generalCommentId}"
                                style="padding-left: \${(comment.level - 1) * 40}px">
                                <div class="author">\${comment.commentWriter}</div>
                                <div class="recommend-count">추천수: \${comment.likeCnt}</div>
                                <div class="datetime">
                                    <span class="crtdt">등록일: \${comment.postDate}</span>
                                    \${comment.mdfyDt != comment.crtDt ? 
                                        `<span class="mdfydt">(수정: \${comment.postDate})</span>`
                                        : ""}
                                </div>
                                <pre class="content">\${comment.commentContent}</pre>
                                \${comment.email == "${sessionScope._LOGIN_USER_.email}" ?
                                    '<div>' +
                                    '<button class="recommend-comment">좋아요</button>' +
                                    '</div>'
                                    :
                                    `<div>
                                        <button class="recommend-comment">좋아요</button>
                                        <button class="update-comment">수정</button>
                                        <button class="delete-comment">삭제</button>
                                    </div>`}
                            </div>`;
                        var commentDom = $(commentTemplate);
                  commentDom.find(".delete-comment").click(deleteComment);
                  // 추천 버튼 클릭 이벤트 핸들러를 등록합니다.
                  commentDom.find(".recommend-comment").click(recommendComment);
                  commentDom.find(".update-comment").click(updateComment);
                        $(".comment-items").append(commentDom);
                    }
                })// $.get
        } // loadReplies
      loadReplies()
        
        // 등록버튼 클릭
        $("#btn-save-comment").click(function(event) {

            event.preventDefault();
            var comment = $("#txt-comment").val().trim()
            var mode = $("#txt-comment").data("mode")
            var target = $("#txt-comment").data("target")
            // 댓글 내용을 입력했다면 등록을 진행한다.
            if (comment!= "") {
                // Ajax 요청을 위한 데이터를 생성한다.
                var body = { "commentContent": comment }
                // 등록 URL을 생성한다.
                var url = `/qnaboard/comment/write/${generalPostId}`;
                // 대댓글일 경우 부모댓글 ID를 데이터에 넣어준다.
                if (mode == "re-comment") {
                    body.parentcommentId = target
                }
                // 댓글 수정일 경우 URL을 변경한다.
                if (mode == "update") {
                    url = `/qnaboard/comment/update/\${target}`;
                }
                // 등록을 진행한다.
                $.post(url, body, function(response) {
                    // 댓글 등록 및 수정의 결과를 받아온다
                    var result = response.result
                    // 댓글 등록 및 수정이 성공했다면 댓글을 다시 조회해온다.
                    if (result) {
                        loadReplies()
                        $("#txt-comment").val("")
                        $("#txt-comment").removeData("mode")
                        $("#txt-comment").removeData("target")
                    }
                }); //$.post
            }
        });
        
      function deleteComment(event) {
          // 클릭된 삭제 버튼 요소를 참조합니다.
          var deleteButton = $(this);

          // 사용자에게 댓글 삭제 확인을 요청하거나 바로 삭제할 수 있도록 구현합니다.
          if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
              var commentId = deleteButton.closest(".comment").data("comment-id");

              // 서버로 삭제 요청을 보냅니다.
              $.get('/qnaboard/comment/delete/' + commentId, function(response) {
                  if (response.result) {
                      // 삭제가 성공적으로 처리되면 댓글을 화면에서 제거합니다.
                      deleteButton.closest(".comment").remove();
                  } else {
                      // 삭제에 실패한 경우 오류 메시지를 표시하거나 다른 조치를 취합니다.
                      alert("댓글 삭제에 실패했습니다.");
                  }
              });
          }
      }


      function recommendComment(event) {
          // 클릭된 추천 버튼 요소를 참조합니다.
          var recommendButton = $(this);
          // 해당 댓글의 ID를 가져옵니다.
          var commentDom = recommendButton.closest(".comment");
          var commentId = commentDom.data("comment-id");
          console.log(commentDom.data("comment-id"))

          // 서버로 추천 요청을 보냅니다.
          $.get('/qnaboard/comment/like/' + commentId, function(response) {
              if (response.result) {
                  // 추천이 성공적으로 처리되면 추천 수를 업데이트합니다.
                  var likeOneComment = commentDom.find(".recommend-count");
                  var currentCount = parseInt(likeOneComment.text().split(":")[1].trim());
                  console.log(currentCount)
                  likeOneComment.text("추천수: " + (currentCount + 1));
                  alert("댓글이 추천되었습니다.");
              } else {
                  // 추천에 실패한 경우 오류 메시지를 표시하거나 다른 조치를 취합니다.
                  alert("댓글 추천에 실패했습니다.");
               }
          });
      }
      
       /*  function updateComment(event) {
    	    var updateButton = $(this);  
    	    var commentDom = updateButton.closest(".comment"); 
    	    var commentId = commentDom.data("comment-id");  
    	    // 사용자에게 수정된 댓글 내용을 입력하도록 요청
    	    var updatedContent = prompt("댓글을 수정하세요:", commentDom.find('.content').text());
    	    
    	    // 사용자가 입력을 취소하지 않고 내용을 입력한 경우
    	    if (updatedContent != null && updatedContent.trim() != "") {
    	        // 댓글을 수정하기 위해 서버에 ajax 요청을 보냄
    	        $.post('/qnaboard/comment/update/' + commentId, { commentContent: updatedContent }, 
    	        function(response) {
    	        	console.log(response);
    	        	console.log(response.result);
    	        	if (response.result) {
    	                // 페이지에서 댓글 내용 수정
    	                console.log("중간확인");
    	                commentDom.find('.content').text(updatedContent);
    	            } else {
    	                  alert("수정이 불가합니다.");
    	              }
    	        });
    	    }
      }   */
      $(".update-comment").click(updateComment);
       var updateComment=function(event){
    	   var reply = $(event.currentTarget).closest(".comment")
    	   //클릭한 대상
    	   var replyId = reply.data ("comment-id")
    	   var content = reply.find (".content").text()
    	   
    	   //작성되어있던 원래 댓글 내용
    	   $("#txt-comment").val (content)
    	   $("#txt-comment").focus()
    	   
    	   //수정모드로 변경
    	   $("#txt-comment").data("mode","update")
    	   $("#txt-comment").data("target",replyId)
    	   $("#txt-comment").data("generalCommentId", replyId)
    	   }
  });   
 </script>
</head>
<body>

	<jsp:include page="../member/membermenu.jsp"></jsp:include>

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
	
	<form name="generalPostVO" method="post">
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

			<div class="btn-group">
				<div class="right-align">
       				<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq generalPostVO.postWriter}">
					<div class="update_btn">
						<div class="btn">
							<a href="/qnaboard/update/${generalPostVO.generalPostId}">수정</a>
							<a href="/qnaboard/delete/${generalPostVO.generalPostId}">삭제</a>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</form>
	<div class="replies">
         <div class="comment-items"></div>
         <div class="write-comment">
            <textarea id="txt-comment"></textarea>
            <button id="btn-save-comment">등록</button>
            <button id="btn-cancel-comment">취소</button>
         </div>
      </div>

	<%-- <c:if test="${not empty sessionScope._LOGIN_USER_ 
                      && sessionScope._LOGIN_USER_.generalMemberEmail 
                      eq generalPostVO.generalMemberVO.generalMemberEmail}">
            <div class="btn-group">
                <div class="right-align">
                    <a href="/qnapost/comments/update/${generalPostVO.generalPostId}">수정</a>
                   
                </div>
            </div>
        </c:if> --%>
	


</body>
</html>