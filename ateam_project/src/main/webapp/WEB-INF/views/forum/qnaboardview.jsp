<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri ="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" id="viewport" content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width"/>
    <title>devGround</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <script src="js/lib/jquery-3.7.1.js"></script>
    <jsp:include page="../layout/header.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
<style>
a:link, a:hover, a:visited, a:active {
      color: #333;
      text-decoration: none;
   }

   /* 본문 영역 */
   .main_content {
      border-radius: 10px;
      border: 1px solid var(--light-gray);
      margin-top: 40px;
   }
   #titleArea {
      padding: 30px;
   }
   .post_category {
      color: var(--blue);
      font-weight: bold;
   }
   .post_title {
      font-size: 24px;
      font-weight: bold;
      color: #333;
      margin-top: 8px;
      margin-bottom: 8px;
   }
   .writer_info {
      display: flex;
   }
   .writer_info li {
      font-size: 14px;
      margin-right: 10px;
   }
   .post_content {
      padding: 30px;
   }
   .space_between {
      margin: 30px 0 20px 20px;
   }
   .btn_controller {
      display: flex;
      flex-direction: row;
      justify-content: flex-end;
   }
   #like-btn,
   #reportQnABoard  {
      margin-left: 5px;
      background-color: transparent;
      border: 1px solid #EEE;
      width: 90px;
      border-radius: 5px;
      cursor: pointer;
   }

   /* 댓글 영역 */
   .write-comment {
      display: flex;
      flex-direction: column;
      justify-self: flex-end;
   }
   .write-comment textarea {
      width: 100%;
   }
   #btn-save-comment {
      width: 80px;
      height: 40px;
      background-color: var(--blue);
      border: 0;
      border-radius: 3px;
      color: #EEE;
      font-weight: bold;
      font-size: 14px;
      margin-top: 10px;
   }
   .comment-items {
      border: 1px solid #EAEAEA;
      border-radius: 12px;
      padding: 16px;
      margin-top: 16px;
      margin-bottom: 20px;
   }
   .comment{
      display: flex;
      flex-direction: column;
      border-bottom: 1px solid var(--light-gray);
      margin-top: 20px;
   }
   .comment-writer {
      font-weight: bold;
   }
   .recommend-comment,
   .update-comment,
   .delete-comment,
   .report-comment {
      border: none;
      border-radius: 10px;
      color: #333;
      background-color:transparent;
      cursor: pointer;
   }
   .content {
      margin: 10px 0 5px 0;
      font-size: 18px;
   }

   #hashtag_area {
      padding-left: 30px;
   }
   .btn_hashtag{
      padding: 6px 9px 6px 9px;
      width: auto;
      height: auto;
      font-size: 12px;
      font-weight: bold;
      color: #555;
      background-color: transparent;
      border: 1px solid #EEE;
      border-radius: 12px;
   }

   .recommend-comment,
   .report-comment {
      background-color: transparent;
   }

   .replies>.comment-header {
      margin: 30px 0 20px 10px;
   }
   
   .replies>.comment-header>.replies-count {
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: medium;
      font-weight: 800;
      margin-right: 45px;
   }
   
   .replies>.comment-header>.str-count {
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: small;
      font-weight: 300;
      padding-left: 530px;
   }
   
   .replies>.write-comment>textarea {
      height: 150px;
      resize: none;
       border-color: lightgray;
   }
   
   .replies> .comment-option{
   border-color: #333;
   border:1px solid lightgrey;
   }
   

   /* button 가로 정렬 */
   .btn_controller {
      display: flex;
      flex-direction: row;
   }
   /* 가로 양 끝 정렬 */
   .space_between {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
   }

   button, input, textarea {
      padding: 10px;
   }
   button {
      text-align: center;
   }
   .btn-group {
      position: absolute;
      top: -30px;
      right: 0;
      display: grid;
      grid-column: 1/3;
      z-index: 999;
   }

   /* 모달 */
   .report-modal {
       display: none; /* 초기에 모달 숨김 */
       position: fixed;
       top: 0;
       left: 0;
       width: 100%;
       height: 100%;
       background-color: rgba(0, 0, 0, 0.7); /* 반투명 배경 */
       z-index: 1;
   }
   .modal_content {
      display: flex;
      flex-direction: column;
      margin-top: 30px;
   }
   .modal_content_element {
      display: flex;
      margin-bottom: 10px;
   }
   .modal_content_element > label {
      width: 20%;
   }
   select[name=reportReason] {
      height: 30px;
   }
   textarea[name=reportReasonContent] {
      height: 80px;
   }
   .submit_area {
      justify-content: flex-end;
   }
   .submit_area > input[type=submit] {
      width: 80px;
      height: 40px;
      border: 1px solid #EEE;
      border-radius: 5px;
      background-color: var(--blue);
      color: #EEE;
      font-size: 14px;
      font-weight: bold;
      cursor: pointer;
   }
   /* 모달 내용 스타일 */
   .report-modal-content {
       position: relative;
       margin: 15% auto;
       padding: 40px;
       width: 50%;
       background-color: #fff;
       border-radius: 5px;
   }
   /* 댓글 모달 내용 스타일 */
   .report-window-content {
       position: relative;
       margin: 15% auto;
       padding: 20px;
       width: 50%;
       background-color: #fff;
       border-radius: 5px;
   }
   .report-window {
       display: none; 
       position: fixed;
       top: 0;
       left: 0;
       width: 100%;
       height: 100%;
       background-color: rgba(0, 0, 0, 0.7); 
       z-index: 1;
   }
   /* 모달 닫기 버튼 스타일 */
   #cancel-window,
   .close {
      font-size: 14px;
      cursor: pointer;
      color: #888;
      width: 80px;
      text-align: center;
      border: 1px solid #eee;
      height: 40px;
      line-height: 40px;
      border-radius: 5px;
   }
  

   #reportFreeBoard {
      position: relative;
      right: 3px;
   }
   

   #move_button {
      margin: 0 auto;
      margin-top: 10px;
      margin-left: 20px;
   }

   .postContent_controller_1 {
    text-align: left; /* 텍스트 가운데 정렬 */
    margin-left: 60px;
    margin-right: 60px;
    margin-bottom: 300px;
   }

   #btn {
      margin: 0 auto;
      margin-right: 10px;
   }

#button-id-list {
   position: relative;
   left:930px; 
   top: 177px;
   background-color: var(--hashtag-blue);
   border: none;
   width: 70px;
   height: 30px;
   border-radius: 5px;
   cursor: pointer;

}
</style>
<script type="text/javascript">
$(document).on('click', '#reportQnABoard', function() {
	$.sweetModal({
		title: '신고 내용',
		content: `
	    <form name="reportVO" method="post" action="/report/view/3">
			<div class="grid" style="grid-template-columns: 150px 1fr; grid-template-rows: 30px 100px 30px; row-gap: 10px;">
			<label for="reportReason" >신고사유${reportVO.reportReason}</label>
				<select name="reportReason">
					<option value="CC-20231018-000200">영리목적/홍보성</option>
					<option value="CC-20231018-000201">개인정보 노출</option>
					<option value="CC-20231018-000202">음란성/선정성</option>
					<option value="CC-20231018-000203">같은 내용 반복(도배)</option>
					<option value="CC-20231018-000204">이용규칙위반</option>
					<option value="CC-20231018-000205">기타</option>
				</select>
		
		        <label for = "reportReasonContent">신고 상세내용</label>
		        <textarea name="reportReasonContent" id="reportReasonContent">${reportVO.reportReasonContent}</textarea>
		     	
		        <label for="attachedImg">첨부파일${reportVO.attachedImg}</label>
		        <input id="attachedImg" type="file" name="attachedImg"/>
		        
		        <label for="reportTypeId">${reportVO.reportTypeId}</label>
		        <input id="reportTypeId" type="hidden" name="reportTypeId" value="3"/>
		        
		        <label for="reportMemberEmail">${reportVO.reportMemberEmail}</label>
		        <input id="reportMemberEmail" type="hidden" name="reportMember" value="${sessionScope._LOGIN_USER_.email}"/>
		     
		        <label for="receivedReportMemberEmail">${reportVO.receivedReportMemberEmail}</label>
		        <input id="receivedReportMemberEmail" type="hidden" name="receivedReportMember" value="${generalPostVO.postWriter}"/>
		     
		        <label for="reportContentId">${reportVO.reportContentId}</label>
		        <input id="reportContentId" type="hidden" name="reportContentId" value="${generalPostVO.generalPostId}"/>
		     </div>
		        <div class="modal_content_element submit_area btn_controller">
		           <input type="submit" value="완료" />
		        </div>
		     
	     </form>`
	});
});
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
                               data-comment-writer-email="\${comment.commentWriter}"
                                style="padding-left: \${(comment.level - 1) * 40}px">
                                <div class="author">\${comment.generalMemberVO.nickname}</div>
                                <div class="recommend-count">추천수: \${comment.likeCnt}</div>
                                <div class="datetime">
                                    <span class="crtdt">등록일: \${comment.postDate}</span>
                                    \${comment.mdfyDt != comment.crtDt ? 
                                        `<span class="mdfydt">(수정: \${comment.postDate})</span>`
                                        : ""}
                                </div>
                                <pre class="content">\${comment.commentContent}</pre>
                                \${comment.email == "${sessionScope._LOGIN_USER_.email}" ?
                                	    `<div>
                                	        <button class="recommend-comment">좋아요</button>
                                	        <button class="update-comment">수정</button>
                                	        <button class="delete-comment">삭제</button>
                                	    </div>`
                                	    :
                                	    `<div>
                                	        <button class="recommend-comment">좋아요</button>
                                	        <button class="report-comment" value="4">신고</button>
                                	        <div class="separate-line"></div>
                                	    </div>`}
                            </div>`;
                        var commentDom = $(commentTemplate);
                  commentDom.find(".delete-comment").click(deleteComment);
                  // 추천 버튼 클릭 이벤트 핸들러를 등록합니다.
                  commentDom.find(".recommend-comment").click(recommendComment);
                  commentDom.find(".update-comment").click(updateComment);
                  commentDom.find(".report-comment").click(reportComment);
                        $(".comment-items").append(commentDom);
                    }
                })// $.get
        } // loadReplies
      loadReplies()
        
   	  // 신고버튼 클릭
      $(".report-comment").click(reportComment);
      var reportComment = function(event) {
    	  // 댓글 작성자
    	  var writer = $(this).closest(".comment").data("comment-writer-email");
    	  // 댓글의 고유 번호
    	  var id = $(this).closest(".comment").data("comment-id");
    	  
    	  	// 필요한 값들을 찾으라고 일일히 지정해줘야 합니다
	        $(this).find("#receivedReportMember").val(writer)
	        $(this).find("#reportContentId").val(id)
	        
	        $.sweetModal({
			        title: '신고 내용',
			        content: `
			            <form name="reportVO" method="post" action="/report/view/4">
			                <div class="grid" style="grid-template-columns: 150px 1fr; grid-template-rows: 30px 100px 30px; row-gap: 10px;">
			                    <label for="reportReason">신고사유</label>
			                    <select name="reportReason">
			                        <option value="CC-20231018-000200">영리목적/홍보성</option>
			                        <option value="CC-20231018-000201">개인정보 노출</option>
			                        <option value="CC-20231018-000202">음란성/선정성</option>
			                        <option value="CC-20231018-000203">같은 내용 반복(도배)</option>
			                        <option value="CC-20231018-000204">이용규칙위반</option>
			                        <option value="CC-20231018-000205">기타</option>
			                    </select>
			
			                    <label for="reportReasonContent">신고 상세내용</label>
			                    <textarea name="reportReasonContent" id="reportReasonContent"></textarea>
			
			                    <label for="attachedImg">첨부파일</label>
			                    <input id="attachedImg" type="file" name="attachedImg"/>
			
			                    <input id="reportTypeId" type="hidden" name="reportTypeId" value="4"/>
			                    <input id="reportMemberEmail" type="hidden" name="reportMember" value="${sessionScope._LOGIN_USER_.email}"/>
			                    <input id="receivedReportMemberEmail" type="hidden" name="receivedReportMember" value="${generalPostVO.postWriter}"/>
			                    <input id="reportContentId" type="hidden" name="reportContentId" value="${generalPostVO.generalPostId}"/>
			                </div>
			                <div class="modal_content_element submit_area btn_controller">
			                    <input type="submit" value="완료" />
			                </div>
			            </form>`
    		});
      };
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
                	  Swal.fire({
                    	  text: "댓글 삭제에 실패했습니다 ㅠㅠ",
                    	  icon: "error"
                    	});
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
                  var currentCount = parseInt(likeOneComment.text().split(" ")[1].trim());
                  console.log(currentCount)
                  likeOneComment.text("추천수: " + (currentCount + 1));
                  Swal.fire({
                	  text: "추천됐습니다 감사링",
                	  icon: "success"
                	});
              } else {
                  // 추천에 실패한 경우 오류 메시지를 표시하거나 다른 조치를 취합니다.
            	  Swal.fire({
                	  text: "추천에 실패했습니다 ㅠㅠ",
                	  icon: "error"
                	});
               }
          });
      }
      
      
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

	// 신고 너 빠지라고 했다 
	
      // "좋아요" 버튼 클릭 시 이벤트 발생
      $("#like-btn").click(function () {
          // 클라이언트에서 AJAX 요청 생성
          $.ajax({
              method: "POST",
              url: "/qnaboard/like",
              data: { 
                  "generalPostId": "${generalPostVO.generalPostId}",
                  "likeCnt": ${generalPostVO.likeCnt}
                },
              success: function(response) {
            	  Swal.fire({
                	  text: "추천됐습니다 감사링",
                	  icon: "success"
                	});
                },
              error: function(error){
            	  Swal.fire({
                	  text: "추천에 실패했습니다 ㅠㅠ",
                	  icon: "error"
                	});
                }
          })
      });   
   });
    

</script>
</head>
<body>
   <div class="body_container">
      <div class="body_left_aside"></div>
         <div class="body">
            <div class="main_content">
               <div id="titleArea">
                  <form name="generalPostVO" method="post">
                  <a href="/qnaboard/list"><p class="post_category">질답게시판 ></p></a>
                  <div class="post_title">${generalPostVO.postTitle}</div>
                  <ul class="writer_info">
                     <li>작성자 <a href="/memberinfo/view/${generalPostVO.postWriter}">${generalPostVO.memberVO.nickname}</a></li>
                     <li>|</li>
                     <li>작성일 ${generalPostVO.postDate}</li>
                     <li>|</li>
                     <li>조회수 ${generalPostVO.viewCnt}</li>
                  </ul>
                  </form>
               </div>
               <div class="post_content">${generalPostVO.postContent}</div>
               <div id="hashtag_area">
                  <c:forEach var="hashtag" items="${generalPostVO.hashtagListVO}">
                     <button class="btn_hashtag"># 
                     	<c:out value="${hashtag.commonCodeVO.codeContent}" />
                     </button>
                  </c:forEach>
               </div>
               <div class="space_between">
                  <div class="btn_controller">
                     <button id="like-btn">좋아요👍</button>
                     <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email ne generalPostVO.postWriter}">
                        <button id="reportQnABoard" value="3" class="report-btn">신고🚨</button>
                     </c:if>
                  </div>
                  <div class="btn_controller">
                     <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq generalPostVO.postWriter}">
                        <a href="/qnaboard/update/${generalPostId}">수정</a>
                        <a href="/qnaboard/delete/${generalPostId}">삭제</a>
                     </c:if>
                  </div>
               </div>
            </div>

            <div class="replies">
               <div class="comment-header">
                  <h3>댓글</h3>
               </div>
               <div class="write-comment">
                  <textarea id="txt-comment" placeholder="의견을 입력하세요" maxlength="500"></textarea>
                  <div class="btn_controller">
                     <button id="btn-save-comment" type="submit">등록</button>
                  </div>
                  <!-- 신고 버튼은 조회할때 사용<button id="btn-report-comment">신고</button> -->
               </div>
	               <div class="comment-header">
	                  <h3>댓글 목록</h3>
	               </div>
               <div class="comment-items"></div>
            </div> 
         </div>
      <div class="body_right_aside"></div>
   </div>
       <!-- 댓글 신고 모달 창 -->
         <div id="report-window" class="report-window">
             <div class="report-window-content">
                    <!-- 모달 내용 추가 -->
                  <h2>신고 내용</h2>
                  <form name="reportVO" method="post" action="/report/view/4">
                     <div class="modal_content">
                        <div class="modal_content_element">
                           <label for="reportReason" >신고사유${reportVO.reportReason}</label>
                           <select name="reportReason">
                              <option value="CC-20231018-000200">영리 및 홍보 목적</option>
                              <option value="CC-20231018-000201">개인정보노출</option>
                              <option value="CC-20231018-000202">음란성/선정성</option>
                              <option value="CC-20231018-000203">같은 내용 반복(도배)</option>
                              <option value="CC-20231018-000204">이용규칙위반</option>
                              <option value="CC-20231018-000205">기타</option>
                           </select>
                        </div>
                        <div class="modal_content_element">
                           <label for = "reportReasonContent">신고 상세내용</label>
                           <textarea name="reportReasonContent" id="reportReasonContent">${reportVO.reportReasonContent}</textarea>
                        </div>
                        <div class="modal_content_element">
                           <label for="attachedImg">첨부파일${reportVO.attachedImg}</label>
                           <input id="attachedImg" type="file" name="attachedImg"/>
                        </div>
                        <div class="modal_content_element">
                           <label for="reportTypeId">${reportVO.reportTypeId}</label>
                           <input id="reportTypeId" type="hidden" name="reportTypeId" value="4"/>
                        </div>
                        <div class="modal_content_element">
                           <label for="reportMemberEmail">${reportVO.reportMemberEmail}</label>
                           <input id="reportMemberEmail" type="hidden" name="reportMember" value="${reportVO.reportMember}"/>
                        </div>
                        <div class="modal_content_element">
                           <label for="receivedReportMemberEmail">${reportVO.receivedReportMemberEmail}</label>
                           <input id="receivedReportMemberEmail" type="hidden" name="receivedReportMember" value="${generalPostVO.postWriter}"/>
                        </div>
                        <div class="modal_content_element">
                           <label for="reportContentId">${reportVO.reportContentId}</label>
                           <input id="reportContentId" type="hidden" name="reportContentId" value="${generalPostVO.generalPostId}"/>
                        </div>
                        <div class="modal_content_element submit_area btn_controller">
                           <input type="submit" value="완료" />
                           <span class="close" id="cancel-window">취소</span>
                        </div>
                     </div>     
                  </form>
               </div>
            </div> 
        <jsp:include page="../layout/footer.jsp" />
        <script>
         // 미완성된 기능을 알려주는 모달창
         $('.incomplete').click(function() {
             $('.modal, .overlay').addClass('modal_active');
         });
         $('.overlay').click(function() {
             $('.modal, .overlay').removeClass('modal_active');
         });
     
         // 스크롤 버튼, IDE
         let calcScrollValue = () => {
             let scrollProgress = document.getElementById('progress');
             let progressValue = document.getElementById('progress-value');
             let pos = document.documentElement.scrollTop;
             let calcHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
             let scrollValue = Math.round((pos * 100) / calcHeight);
     
             scrollProgress.addEventListener('click', () => {
                 document.documentElement.scrollTop = 0;
             });
         };
         
         window.onscroll = calcScrollValue;
     
         // 서브 리스트가 있다면? 아래로 떨군다.
         $('.visible').hide();
         $('.list_company').mouseover(function() {
             $('.visible').show();
             $(this).find('a').css({'background-color': 'var(--blue)', 'color': 'white', 'box-shadow': '0 0 5px var(--gray)'});
         });
         $('.list_company').mouseleave(function() {
             $('.visible').hide();
             $(this).find('a').css({'background-color': 'white', 'color': 'var(--blue)', 'box-shadow': 'none'});
         });
         var swiper = new Swiper('.swiper-container', {
             slidesPerView: 1, // 한 번에 보일 슬라이드 개수
             spaceBetween: 10, // 슬라이드 사이 간격
             navigation: {
                 nextEl: '.swiper-button-next', // 다음 버튼의 클래스
                 prevEl: '.swiper-button-prev'  // 이전 버튼의 클래스
             }
         });
     </script>
</body>
</html>