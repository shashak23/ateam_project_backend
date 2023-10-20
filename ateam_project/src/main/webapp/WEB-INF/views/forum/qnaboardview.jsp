<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
        	   // 댓글 수정
            var modifyGeneralComment = function(event) {
            var generalComment= $(event.currentTarget).closest(".generalComment");
            var generalCommentId = generalComment.data("generalCommentId");
            var content = generalComment.find(".content").text();

            $("#txt-generalComment").val(content);
            $("#txt-generalComment").focus();

            $("#txt-generalComment").data("mode", "modify");
            $("#txt-generalComment").data("target", generalCommentId);
        }

        $('#textBox').keyup(function (e) {
	let content = $(this).val();
   
});

$(#txt)
});
        // 댓글 삭제
            var deleteGeneralComment  = function(event) {
            var generalComment = $(event.currentTarget).closest(".generalComment");
            var generalCommentId = generalComment.data("generalCommentId");

            $("#txt-generalComment").removeData("mode");
            $("#txt-generalComment").removeData("target");

            if (confirm("댓글을 삭제하시겠습니까?")) {
                $.get(`/generalPost/generalComment/delete/\${generalCommentId}`, 
            function (response) {
                    var result = response.result;

                    if (result) {
                        loadComments();
                        $("#txt-generalComment").val("");
                    }
                })     
            }
        }
    
        

        // 대댓글 등록
        var reGeneralComment  = function(event) {
             var generalComment = $(event.currentTarget).closest(".generalComment");
             var generalCommentId = generalComment.data("generalCommentId");

             $("#txt-generalComment").data("mode", "re-omment");
             $("#txt-generalComment").data("target", generalCommentId);
             $("#txt-generalComment").focus();
        }

        // 댓글 추천
        var recommendGeneralComment = function(event) {
            var generalComment = $(event.currentTarget).closest(".generalComment");
            var generalCommentId = generalComment.data("generalCommentId");

            $("#txt-generalComment").removeData("mode");
            $("#txt-generalComment").removeData("target");

            $.get(`/generalPost/generalComment/recommend/\${generalCommentId}`, function (response) {
                var result = response.result;

                if (result) {
                    loadComments();
                    $("#txt-generalComment").val("");
                }
            });
        }

        // 댓글 조회
        var loadComments = function() {
              $(".generalComment-items").html("");

              $.get("/qnapost/comments/${generalPostVO.generalPostId}", function (response) {
                  var replies = response.commentList;
                  for (var i = 0; i < commentList.length; i++) {
                      var generalComment = commentList[i];

                      var generalCommentTemplate =
                          `<div class="generalComment"
                                data-generalComment-id="${generalComment.generalCommentId}"
                                style="padding-left: ${(generalComment.level - 1) * 40}px">
                              <div class="author">
                                  \${generalComment.generalMemberVO.generalMemberEmail} (\${generalComment.commentWriter})
                              </div>
                              <div class="recommend-count">
                                  추천수: \${generalComment.recommendCnt}
                              </div>
                              <div class="datetime">
                                  <span class="postDt">등록: \${generalComment.postDate}</span>
                              //    \${generalComment.mdfyDt != generalComment.post ?
                                      `<span class="mdfydt">수정: \${generalComment.mdfyDt}</span>`
                                      : ""}
                              </div>
                              <pre class="content">\${generalComment.content}</pre>
                              \${generalComment.email == "${sessionScope._LOGIN_USER_.email}" ?
                                  `<div>
                                      <span class="modify-generalComment">수정</span>
                                      <span class="delete-generalComment">삭제</span>
                                      <span class="re-generalComment">답변하기</span>
                                  </div>`
                                  : `<div>
                                      <span class="recommend-generalComment">추천하기</span>
                                      <span class="re-generalComment">답변하기</span>
                                      <span class="report-generalComment">신고하기</span>
                                  </div>`}
                          </div>`

                      var generalCommentDom = $(generalCommentTemplate);
                      generalCommentDom.find(".modify-generalComment").click(modifyGeneralComment);
                      generalCommentDom.find(".delete-generalComment").click(deleteGeneralComment);
                      generalCommentDom.find(".recommend-generalComment").click(recommendGeneralComment);
                      generalCommentDom.find(".re-generalComment").click(reGeneralComment);
                     // generalCommentDom.find(".report-generalComment").click(reportGeneralComment);

                      $(".generalComment-items").append(generalCommentDom);
                  }
              })
            }
    

        loadComments();

        // 등록버튼 클릭
         $("#btn-save-generalComment").click(function () {
        var generalComment = $("#txt-generalComment").val().trim();
        var mode = $("#txt-generalComment").data("mode");
        var target = $("#txt-generalComment").data("target");

        if (generalComment != "") {
            var body = { "content": generalComment };
            var url = `/qnapost/comments/create/${generalPostVO.generalPostId}`;

            if (mode == "re-generalComment") {
                body.parentGeneralCommentId = target;
            }

            if (mode == "modify") {
                url = `/qnapost/comments/modify/${target}`;
            }

            $.post(url, body, function (response) {
                var result = response.result;

                if (result) {
                    loadGeneralComments();
                    $("#txt-generalComment").val("");
                    $("#txt-generalComment").removeData("mode");
                    $("#txt-generalComment").removeData("target");
                }
            });
        }
    })

        // 취소버튼 클릭
        $("#btn-cancel-generalComment").click(function(){
        $("#txt-generalComment").val("");
        $("#txt-generalComment").removeData("mode");
        $("#txt-generalComment").removeData("target");
    })

  
  

    </script>
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
	color: lightgray;
	padding-left: 530px;
}

.comments>.write-comment {
	margin-bottom: 15px;
	display: grid;
	grid-template-columns: 1fr 80px;
	grid-template-rows: 1fr 40px;
	row-gap: 10px;
	column-gap: 10px;
	align-items: center;
}

.comments>.write-comment>textarea {
	height: 150px;
	display: grid;
	grid-column: 1/3;
	resize: none;
}

.comments>.write-comment>#btn-save-comment {
	background-color: #7BCA30;
	width: 100px;
}

.comments>.comment-items {
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: 1fr;
	row-gap: 10px;
}

pre.content {
	margin: 0px;
}
</style>

</head>
<body>

	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1>게시글 조회</h1>

	<form name="generalPostVO" method="post" ModelAttribute="generalPostVO">
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
					<!-- <a href="/freeboard/update/${generalPostVO.generalPostId}">수정</a> -->
					<div class="update_btn">
						<div class="btn">
							<a href="/qnaboard/update/${generalPostVO.generalPostId}">수정</a>
							<a href="/qnaboard/delete/${generalPostVO.generalPostId}">삭제</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="comments">
		<div class="comment-header">
			<h3>댓글 작성</h3>
			<div class="comments-count">2,058</div>
			<div class="str-count"></div>
		</div>

		<div class="comment-items"></div>
		<div class="write-comment">

			<textarea class="text-content" style="resize: none;" maxlength="500">
        </textarea>

			<button id="btn-save-comment">등록</button>

			<!-- 신고 버튼은 조회할때 사용<button id="btn-report-comment">신고</button> -->
		</div>
	</div>

	<%-- <c:if test="${not empty sessionScope._LOGIN_USER_ 
                      && sessionScope._LOGIN_USER_.generalMemberEmail 
                      eq generalPostVO.generalMemberVO.generalMemberEmail}">
            <div class="btn-group">
                <div class="right-align">
                    <a href="/generalPost/modify/${generalPostVO.generalPostId}">수정</a>
                   
                </div>
            </div>
        </c:if> --%>
	</div>


</body>
</html>