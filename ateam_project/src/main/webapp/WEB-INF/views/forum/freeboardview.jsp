<%-- 10.19 작성자 :장윤경--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/lib/jquery-3.7.1.js"></script>

<style type="text/css">
* {
	color: #333;
	font-size: 17px;
}

div.grid>div.replies {
	display: grid;
	grid-column: 1/3;
}

div.replies>.write-comment {
	margin-top: 10px;
	display: grid;
	grid-template-columns: 1fr 80px;
	grid-template-rows: 1fr 40px;
	row-gap: 10px;
	column-gap: 10px;
	align-items: center;
}

div.replies>.write-comment>textarea {
	height: 150px;
	display: grid;
	grid-column: 1/3;
}

div.replies>.comment-items {
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: 1fr;
	row-gap: 10px
}

pre.content {
	margin: 0px;
}

a:link, a:hover, a:visited, a:active {
	color: #333;
	text-decoration: none;
}

div.grid {
	display: grid;
	grid-template-columns: 80px 1fr;
	grid-template-rows: 28px 28px 28px 28px 28px 320px 1fr;
	row-gap: 10px;
}

div.grid>div.btn-group {
	display: grid;
	grid-column: 1/3;
}

div.grid div.right-align {
	text-align: right;
}

label {
	padding-left: 10px;
}

button, input, textarea {
	padding: 10px;
}
</style>

<script type="text/javascript">
//댓글 조회
var loadReplies = function() {
    // 댓글 목록 삭제.
    $(".comment-items").html("")

    // 댓글 조회.
    // `` <- backtick template literal 변수 바인딩 \${}
    $.get('/freeboard/view/comment/${generalPostId}', function(response) {
    		//a
        var replies = response.replies // <-- Java: List, JS: Array
        for (var i = 0; i < replies.length; i++) {
            // 배열에서 댓글 하나를 가져온다.
            var comment = replies[i]

            // 댓글이 표현될 template을 만들어준다.
            var commentTemplate = 
                `<div class="comment"
                    data-comment-id="\${generalComment.generalCommentId}"
                    style="padding-left: \${(comment.level - 1) * 40}px">
                    <div class="author">
                        \${comment.memberVO.name} (\${comment.email})
                    </div>
                    <div class="recommend-count">
                        추천수: \${comment.recommendCnt}
                    </div>
                    <div class="datetime">
                        <span class="crtdt">등록: \${comment.crtDt}</span>
                        \${comment.mdfyDt != comment.crtDt ? 
                            `<span class="update">수정: \${comment.update}</span>`
                            : ""}
                    </div>
                    <pre class="content">\${comment.content}</pre>
                    \${comment.email == `${sessionScope._LOGIN_USER_.email}` ? 
                        `<div>
                            <span class="update-comment">수정</span>
                            <span class="delete-comment">삭제</span>
                            <span class="re-comment">답변하기</span>
                        </div>`
                        : `<div>
                            <span class="recommend-comment">추천하기</span>
                            <span class="re-comment">답변하기</span>
                        </div>`}
                </div>`

            var commentDom = $(commentTemplate)
            commentDom.find(".update-comment").click(updatecomment)
            commentDom.find(".delete-comment").click(deletecomment)
            commentDom.find(".recommend-comment").click(recommendcomment)
            commentDom.find(".re-comment").click(recomment)

            $(".comment-items").append(commentDom)
    }
            })
            }

            loadReplies()
            // 등록버튼 클릭
            $("#btn-save-comment").click(function(event) {
            	alert("아아");
            event.preventdefault();
                console.log("나올까요?");
                // 작성한 댓글 내용을 가져온다.
                var comment = $("#txt-comment").val().trim()
                // 저장 모드? 등록, 수정 구분하는 구분자 가져온다.
                var mode = $("#txt-comment").data("mode")
                // 대댓글일 경우, 상위 댓글의 아이디를 가져온다.
                var target = $("#txt-comment").data("target")

                // 댓글 내용을 입력했다면 등록을 진행한다.
                if (comment != "") {
                    // Ajax 요청을 위한 데이터를 생성한다.
                    var body = { "content": comment }
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
                    })

                }

            })
  
 </script>  	
</head>
<body>

	<jsp:include page="../member/membermenu.jsp"></jsp:include>
	
	

	<h1>게시글 조회</h1>
	
	<form name="generalPostVO" method="post" action="/freeboard/view/${generalVO.generalPostId}">
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
	</form>	

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