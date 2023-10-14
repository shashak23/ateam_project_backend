<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>댓글</title>

<style type="text/css">
* {
	color: #333;
	font-size: 17px;
}

div.grid>div.replies {
	display: grid;
	grid-column: 1/3;
}

div.replies>.write-reply {
	margin-top: 10px;
	display: grid;
	grid-template-columns: 1fr 80px;
	grid-template-rows: 1fr 40px;
	row-gap: 10px;
	column-gap: 10px;
	align-items: center;
}

div.replies>.write-reply>textarea {
	height: 150px;
	display: grid;
	grid-column: 1/3;
}

div.replies>.reply-items {
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: 1fr;
	row-gap: 10px;
}

pre.content {
	margin: 0px;
}
</style>
<script type="text/javascript" src="/js/lib/jquery-3.7.0.js"></script>
<script type="text/javascript">
$().ready(function() {
			var modifyReply = function(event) {
					var reply = $(event.currentTarget).closest(".reply");
					var replyId = reply.data("reply-id");
					var content = reply.find(".content").text();
					$("#txt-reply").val(content);
					$("#txt-reply").focus();
					$("#txt-reply").data("mode", "modify");
					$("#txt-reply").data("target", replyId);
				}
			var deleteReply = function(event) {
			var reply = $(event.currentTarget).closest(".reply");
			var replyId = reply.data("reply-id");
			$("#txt-reply").removeData("mode");
			$("#txt-reply").removeData("target");
			if (confirm("댓글을 삭제하시겠습니까?")) {
			$.get(`/board/reply/delete/\${replyId}`, function(response) {
			var result = response.result;
					if (result) {
						loadReplies();
						$("#txt-reply").val("");
					}
				});
			}
		}
		var reReply = function(event) {
			var reply = $(event.currentTarget).closest(".reply");
			var replyId = reply.data("reply-id");
				$("#txt-reply").data("mode", "re-reply");
				$("#txt-reply").data("target", replyId);
				$("#txt-reply").focus();
		}
		var recommendReply = function(event) {
			var reply = $(event.currentTarget).closest(".reply");
			var replyId = reply.data("reply-id");
			$("#txt-reply").removeData("mode");
			$("#txt-reply").removeData("target");
			$.get(`/board/reply/recommend/\${replyId}`, function(response) {
				var result = response.result;
				console.log(result)
					if (result) {
					loadReplies();
					$("#txt-reply").val("");
					}
			});
		}
		// 댓글 조회하기.
		var loadReplies = function() {
				$(".reply-items").html("");
				$.get("/board/reply/${boardVO.id}", function(response) {
					var replies = response.replies;
					for (var i = 0; i < replies.length; i++) {
						var reply = replies[i];
						var replyTemplate =
							`<div class="reply"
							data-reply-id="\${reply.replyId}"
							style="padding-left: \${(reply.level-1) * 40}px">
							<div class="author">
							\${reply.memberVO.name} (\${reply.email})
							</div>
							<div class="recommend-count">
							추천수: \${reply.recommendCnt}
							</div>
							<div class="datetime">
							<span class="crtdt">등록: \${reply.crtDt}</span>
							\${reply.mdfyDt != reply.crtDt ?
							`<span class="mdfydt">(수정: \${reply.mdfyDt})</span>`
							: ""}
							</div>
							<pre class="content">\${reply.content}</pre>
							\${
								reply.email == "${sessionScope._LOGIN_USER_.email}" ?
							}
							`<div>
							<span class="modify-reply">수정</span>
							<span class="delete-reply">삭제</span>
							<span class="re-reply">답변하기</span>
							</div>`
							: `<div>
							<span class="recommend-reply">추천하기</span>
							<span class="re-reply">답변하기</span>
							</div>`
							}
							</div>`;
							var replyDom = $(replyTemplate);
							replyDom.find(".modify-reply").click(modifyReply);
							replyDom.find(".delete-reply").click(deleteReply);
							replyDom.find(".recommend-reply").click(recommendReply);
							replyDom.find(".re-reply").click(reReply);
							$(".reply-items").append(replyDom);
						}
					});
			}
			loadReplies();
			$("#btn-save-reply").click(function() {
				var reply = $("#txt-reply").val();
				var mode = $("#txt-reply").data("mode");
				var target = $("#txt-reply").data("target");
				if (reply.trim() != "") {
				var body = {"content": reply};
				var url = "/board/reply/${boardVO.id}";
				if (mode == "re-reply") { // 답변달기
				body.parentReplyId = target;
				}
				if (mode == "modify") {
				url = `/board/reply/modify/\${target}`;
				}
				$.post(url, body, function(response) {
				var result = response.result;
						if (result) {
						loadReplies();
						$("#txt-reply").val("");
						}
</script>
</head>
<body>
	<div class="replies">
		<div class="reply-items"></div>
		<div class="write-reply">
			<textarea id="txt-reply"></textarea>
			<button id="btn-save-reply">등록</button>
			<button id="btn-cancel-reply">취소</button>
		</div>
	</div>
</body>
</html>