<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script>
        $(document).ready(function () {
        	   // 댓글 수정
            var modifyGeneralComment = function(event) {
            var generalComment= $(event.currentTarget).closest(".generalComment");
            var generalCommentId = generalComment.data("generalCommentId");
            var content = generalComment.find(".content").text();

            $("#text-content").val(content);
            $("#text-content").focus();

            $("#text-content").data("mode", "modify");
            $("#text-content").data("target", generalCommentId);
        }

        $('#textBox').keyup(function (e) {
	    let content = $(this).val();        
        });

        $(function(){
                $('#text-content').keyup(function (e) {
                    var content = $(this).val();
                    $(this).height(((content.split('\n').length+1) * 1.5 ) + 'em' );
                    $('#counter').html(text-content.length + '/500');
                });

                $('#text-content').keyup();
        });
   

        // 댓글 삭제
            var deleteGeneralComment  = function(event) {
            var generalComment = $(event.currentTarget).closest(".generalComment");
            var generalCommentId = generalComment.data("generalCommentId");

            $("#text-content").removeData("mode");
            $("#text-content").removeData("target");

            if (confirm("댓글을 삭제하시겠습니까?")) {
                $.get(`/generalPost/generalComment/delete/\${generalCommentId}`, 
            function (response) {
                    var result = response.result;

                    if (result) {
                        loadComments();
                        $("#text-content").val("");
                    }
                })     
            }
        }
    
        

        // 대댓글 등록
        var reGeneralComment  = function(event) {
             var generalComment = $(event.currentTarget).closest(".generalComment");
             var generalCommentId = generalComment.data("generalCommentId");

             $("#text-content").data("mode", "re-comment");
             $("#text-content").data("target", generalCommentId);
             $("#text-content").focus();
        }

        // 댓글 추천
        var recommendGeneralComment = function(event) {
            var generalComment = $(event.currentTarget).closest(".generalComment");
            var generalCommentId = generalComment.data("generalCommentId");

            $("#text-content").removeData("mode");
            $("#text-content").removeData("target");

            $.get(`/generalPost/generalComment/recommend/\${generalCommentId}`, function (response) {
                var result = response.result;

                if (result) {
                    loadComments();
                    $("#text-content").val("");
                }
            });
        }

        // 댓글 조회
        var loadComments = function() {
            $(".generalComment-items").html("");

              $.get("/qnapost/comments/${generalPostVO.generalPostId}", function (response) {
                  var comments = response.comments;
                  for (var i = 0; i < comments.length; i++) {
                      var generalComment = comments[i];

                      var generalCommentTemplate =
                          `<div class="generalComment"
                                data-generalComment-id="${generalComment.generalCommentId}"
                                style="padding-left: ${(generalComment.level - 1) * 40}px">
                              <div class="author">
                                  \${generalComment.generalCommentVO.commentWriter} (\${generalComment.commentWriter})
                              </div>
                              <div class="like-count">
                                  추천수: \${generalComment.likeCnt}
                              </div>
                              <div class="postDate">
                                  <span class="postDt">등록: \${generalComment.postDate}</span>
                              //    \${generalComment.postDate != generalComment.post ?
                                      `<span class="mdfydt">수정: \${generalComment.mdfyDt}</span>`
                                      : ""}
                              </div>
                              <pre class="content">\${generalComment.commentContent}</pre>
                              \${generalComment.commentWriter == "${sessionScope._LOGIN_USER_.email}" ?
                                  `<div>
                                      <span class="update-generalComment">수정</span>
                                      <span class="delete-generalComment">삭제</span>
                                      <span class="re-generalComment">답변하기</span>
                                  </div>`
                                  : `<div>
                                      <span class="like-generalComment">추천하기</span>
                                      <span class="re-generalComment">답변하기</span>
                                      <span class="report-generalComment">신고하기</span>
                                  </div>`}
                          </div>`

                      var generalCommentDom = $(generalCommentTemplate);
                      generalCommentDom.find(".update-generalComment").click(modifyGeneralComment);
                      generalCommentDom.find(".delete-generalComment").click(deleteGeneralComment);
                      generalCommentDom.find(".like-generalComment").click(recommendGeneralComment);
                      generalCommentDom.find(".re-generalComment").click(reGeneralComment);
                     // generalCommentDom.find(".report-generalComment").click(reportGeneralComment);

                      $(".generalComment-items").append(generalCommentDom);
                  }
              })
        }
    

        loadComments();

        // 등록버튼 클릭
         $("#btn-save-comment").click(function () {
        var generalComment = $("#text-content").val().trim();
        var mode = $("#text-content").data("mode");
        var target = $("#text-content").data("target");

        if (generalComment != "") {
            var body = { "content": generalComment };
            var url = `/qnapost/comments/create/\${generalPostVO.generalPostId}`;

            if (mode == "re-generalComment") {
                body.upperCommentId = target;
            }

            if (mode == "update") {
                url = `/qnapost/comments/update/\${target}`;
            }

            $.post(url, body, function (response) {
                var result = response.result;

                if (result) {
                    loadComments();
                    $("#text-content").val("");
                    $("#text-content").removeData("mode");
                    $("#text-content").removeData("target");
                }
            })
        }
    })


        // 취소버튼 클릭
    //     $("#btn-cancel-generalComment").click(function(){
    //     $("#text-content").val("");
    //     $("#text-content").removeData("mode");
    //     $("#text-content").removeData("target");
    // })

$().ready(function() {
    // "신고" 버튼 클릭 시 모달 열기
    $(".report-btn").click(function() {
    	let reportType = $("#reportQnABoard").val()
        $("#report-modal").css("display", "block");
    });
    console.log($("jsp:param[name='reportType']"))

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
        		/* $("likeModal").hide(); */
        		alert("좋아요가 눌렸습니다!!!!!!!!!!!!");
        	},
        	error: function(error){
        		/* $("#likeModal").hide(); */
        		alert("오류가 발생했습니다~~~~~~~~~~~~");
        	}
        })
    });

});
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

</head>
<body>

	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1>게시글 조회</h1>
	
	<!-- 좋아요 기능 -->
	<button id="like-btn">좋아요</button>
		
	<button id="reportQnABoard" value="1" class="report-btn">신고</button>
	<jsp:include page="../report/reportview.jsp">
		<jsp:param name="id" value="${generalPostVO.generalPostId}" />
		<jsp:param name="reportType" value="1" />
	</jsp:include>
	
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
       				<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq generalPostVO.postWriter}">
					<div class="update_btn">
						<div class="btn">/
							<a href="/qnaboard/update/${generalPostVO.generalPostId}">수정</a>
							<a href="/qnaboard/delete/${generalPostVO.generalPostId}">삭제</a>
						</div>
					</div>
					</c:if>
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
        <div class="generalComment-items"></div>
		<div class="write-comment">
			<textarea id="text-content" style="resize: none;" maxlength="500">의견을 입력하세요</textarea>
			<!-- 신고 버튼은 조회할때 사용<button id="btn-report-comment">신고</button> -->
		</div>
        <div class="comment-option">
			<button id="btn-save-comment">등록</button>
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