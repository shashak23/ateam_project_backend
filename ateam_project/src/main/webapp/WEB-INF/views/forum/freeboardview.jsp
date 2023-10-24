<%-- 10.19 작성자: 장윤경 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 조회</title>
    <script src="/js/lib/jquery-3.7.1.js"></script>
    <style type="text/css">
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
    </style>
    <script type="text/javascript">
        $(document).ready(function() {
        var loadReplies = function() {
            // 댓글 목록 삭제.
            $(".comment-items").html("");
                // 댓글 조회.
                $.get('/freeboard/view/comment/${generalPostId}', function(response) {
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
            
            var comment = $("#txt-comment").val().trim()
            var mode = $("#txt-comment").data("mode")
            var target = $("#txt-comment").data("target")
            // 댓글 내용을 입력했다면 등록을 진행한다.
            if (comment.trim() != "") {
                // Ajax 요청을 위한 데이터를 생성한다.
                var body = { "commentContent": comment }
                // 등록 URL을 생성한다.
                var url = '/freeboard/comment/write/${generalPostId}';
                // 대댓글일 경우 부모댓글 ID를 데이터에 넣어준다.
                if (mode == "re-comment") {
                    body.parentcommentId = target
                }
                // 댓글 수정일 경우 URL을 변경한다.
                if (mode == "update") {
                    url = '/freeboard/comment/update/${generalPostId}';
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
		        $.get('/freeboard/comment/delete/' + commentId, function(response) {
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
			console.log(event)
		    // 클릭된 추천 버튼 요소를 참조합니다.
		    var recommendButton = $(this);

		    // 해당 댓글의 ID를 가져옵니다.
		    var commentDom = recommendButton.closest(".comment");
		    var commentId = commentDom.data("comment-id");
		    console.log(commentDom.data("comment-id"))

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
		}
        
      });
         
 </script>     
</head>
<body>

   <jsp:include page="../member/membermenu.jsp"></jsp:include>
   <h1>게시글 조회</h1>
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
</html>