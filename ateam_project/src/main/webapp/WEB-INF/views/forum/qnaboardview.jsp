<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
   

<script type='text/javascript'>
    $().ready(function() {
        // 댓글 수정
        var updateComment = function(event) {
            // event.currentTarget => 이벤트가 발생한 대상.
            // 클릭한 대상.
            var comment = $(event.currentTarget).closest(".comment")
            var commentId = comment.data("commentId")

            // 작성되어있던 댓글의 내용
            var content = comment.find(".text-content").text()
            $("#text-comment").val(content)
            $("#text-comment").focus()

            // 수정모드로 변경.
            $("#text-comment").data("mode", "update")
            $("#text-comment").data("target", commentId)
        }

        // 댓글 삭제
        var deleteComment = function(event) {
            // event.currentTarget => 이벤트가 발생한 대상.
            // 클릭한 대상.
            var comment = $(event.currentTarget).closest(".comment")
            var commentId = comment.data("commentId")

            // txt-reply에 할당된 data-변수를 제거.
            $("#text-comment").removeData("mode")
            $("#text-comment").removeData("target")

            if ( confirm("댓글을 삭제하시겠습니까?") ) {
                // ajax 요청
                $.get(`/qnaboard/comments/delete/${generalCommentId}`, function(response) {
                    // 삭제 성공 여부를 받아온다.
                    var result = response.result

                    // 삭제에 성공했다면
                    if (result) {
                        // 댓글을 다시 조회한다.
                        loadComments()
                        // 댓글 입력 칸은 비워준다.
                        $("#text-comment").val("")
                    }
                })
            }

        }

        // 대댓글 등록
        var reComment = function(event) {
            // event.currentTarget => 이벤트가 발생한 대상.
            // 클릭한 대상.
            var comment = $(event.currentTarget).closest(".comment")
            var commentId = comment.data("commentId")

            $("#text-comment").data("mode", "re-reply")
            $("#text-comment").data("target", commentId)
            $("#text-comment").focus()
        }

        // 댓글 추천
        var likeComment = function(event) {
            // event.currentTarget => 이벤트가 발생한 대상.
            // 클릭한 대상.
            var comment = $(event.currentTarget).closest(".comment")
            var commentId = reply.data("commentId")

            $("#text-comment").removeData("mode")
            $("#text-comment").removeData("target")

            // 추천 ajax 요청.
            $.get(`/qnaboard/comments/like/${generalCommentId}`, function(response) {
                var result = response.result

                if (result) {
                    loadComments();
                    $("#text-comment").val("")
                }
            })
        }

        // 댓글 조회
        var loadComments = function() {
            // 댓글 목록 삭제.
            $(".comment-items").html("")

            // 댓글 조회.
            // `` <- backtick template literal 변수 바인딩 \${}
            $.get("/qnaboard/comments/${generalPostId}", function(response) {
                var comments = response.comments // <-- Java: List, JS: Array
                for (var i = 0; i < comments.length; i++) {
                    // 배열에서 댓글 하나를 가져온다.
                    var comment = comments[i]

                    // 댓글이 표현될 template을 만들어준다.
                    var commentTemplate = 
                        `<div class="comment"
                              data-comment-id="\${generalCommentId}"
                              style="padding-left: \${(comment.level - 1) * 40}px">
                            <div class="author">
                                \${reply.memberVO.name} (\${reply.email})
                            </div>
                            <div class="like-count">
                                추천수: \${comment.likeCnt}
                            </div>
                            <div class="datetime">
                                <span class="crtdt">등록: \${reply.crtDt}</span>
                                \${reply.mdfyDt != reply.crtDt ? 
                                    `<span class="mdfydt">수정: \${reply.mdfyDt}</span>`
                                    : ""}
                            </div>
                            <pre class="content">\${reply.content}</pre>
                            \${reply.email == "${sessionScope._LOGIN_USER_.email}" ? 
                                `<div>
                                    <span class="update-reply">수정</span>
                                    <span class="delete-reply">삭제</span>
                                    <span class="re-comment">답변하기</span>
                                </div>`
                                : `<div>
                                    <span class="like-comment">추천하기</span>
                                    <span class="re-comment">답변하기</span>
                                </div>`}
                        </div>`

                        var commentDom = $(commentTemplate)
                        commentDom.find(".update-comment").click(updateComment)
                        commentDom.find(".delete-comment").click(deleteComment)
                        commentDom.find(".like-comment").click(likeComment)
                        commentDom.find(".re-comment").click(reComment)

                        $(".comment-items").append( commentDom)
                }
            })
        }

        loadComments()

        // 등록버튼 클릭
        $("#btn-save-comment").click(function() {
            // 작성한 댓글 내용을 가져온다.
            var comment = $("#text-content").val().trim()
            // 저장 모드? 등록, 수정 구분하는 구분자 가져온다.
            var mode = $("#text-content").data("mode")
            // 대댓글일 경우, 상위 댓글의 아이디를 가져온다.
            var target = $("#text-content").data("target")

            // 댓글 내용을 입력했다면 등록을 진행한다.
            if (reply != "") {
                // Ajax 요청을 위한 데이터를 생성한다.
                var body = { "content": comment }
                // 등록 URL을 생성한다.
                var url = `/qnaboard/comments/create/${generalPostId}`

                // 대댓글일 경우 부모댓글 ID를 데이터에 넣어준다.
                if (mode == "re-comment") {
                    body.upperCommentId = target
                }

                // 댓글 수정일 경우 URL을 변경한다.
                if (mode == "update") {
                    url = `/qnaboard/comments/update/\${target}`
                }

                // 등록을 진행한다.
                $.post(url, body, function(response) {
                    // 댓글 등록 및 수정의 결과를 받아온다
                    var result = response.result
                    // 댓글 등록 및 수정이 성공했다면 댓글을 다시 조회해온다.
                    if (result) {
                        loadReplies()
                        $("#text-content").val("")
                        $("#text-content").removeData("mode")
                        $("#text-content").removeData("target")
                    }
                })

            }

        })

        // 취소버튼 클릭
        // $("#btn-cancel-reply").click(function() {
        //     $("#txt-reply").val("")
        //     $("#txt-reply").removeData("mode")
        //     $("#txt-reply").removeData("target")
        // })
    });
</script>
</head>
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
</style>
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
			<textarea id="text-content" style="resize: none;" maxlength="500">의견을 입력하세요</textarea>
			<!-- 신고 버튼은 조회할때 사용<button id="btn-report-comment">신고</button> -->
		</div>
        <div class="comment-option">
			<button id="btn-save-comment">등록</button>
        </div>
	</div>

	 <c:if test="${not empty sessionScope._LOGIN_USER_ 
                      && sessionScope._LOGIN_USER_.generalMemberEmail 
                      eq generalPostVO.generalMemberVO.generalMemberEmail}">
            <div class="btn-group">
                <div class="right-align">
                    <a href="/qnaboard/comments/update/${generalPostVO.generalPostId}">수정</a>
                   
                </div>
            </div>
        </c:if> 
</body>
</html>