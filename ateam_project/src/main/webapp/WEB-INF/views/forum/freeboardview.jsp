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
	$().ready(function(){
	
		var modifyReply = function(event) {
		
		var reply = $(event.currentTarget).closest(".reply");
		var replyId = reply.data( "reply-id");
		
		var content = reply.find(".content").text()
		$("#txt-reply").val(content)
		$("#txt-reply").focus();
		
		$("#txt-reply").data("mode","modify")
		$("#txt-reply").data("target",replyId)	
	}
	
	var deleteReply = function(event) {
		var reply = $(event.currentTarget).closet( ".reply");
		var replyId = reply.data("reply-id")
		
		$("#txt-reply").removeData("mode")
		$("#txt-reply").removeData("target")
		
		if ( confirm("댓글을삭제하시겠습니까?")) {
			$.get(`/board.reply/delete/\${replyId}`, function(response) {
				var result = response.result; 
				if(result) {
				loadReplies()
				$("#txt-reply").val("")
		
		}
	  })
	 }
	}	
	
	var reReply = function(event) {
        // event.currentTarget => 이벤트가 발생한 대상.
        // 클릭한 대상.
        var reply = $(event.currentTarget).closest(".reply")
        var replyId = reply.data("reply-id")

        $("#txt-reply").data("mode", "re-reply")
        $("#txt-reply").data("target", replyId)
        $("#txt-reply").focus()
    }

    // 댓글 추천
    var recommendReply = function(event) {
        // event.currentTarget => 이벤트가 발생한 대상.
        // 클릭한 대상.
        var reply = $(event.currentTarget).closest(".reply")
        var replyId = reply.data("reply-id")

        $("#txt-reply").removeData("mode")
        $("#txt-reply").removeData("target")

        // 추천 ajax 요청.
        $.get(`/board/reply/recommend/\${replyId}`, function(response) {
            var result = response.result

            if (result) {
                loadReplies();
                $("#txt-reply").val("")
            }
        })
    }
 
		 var loadReplies = function(){
			 $(".reply-items").html("");
			 $.get("/board/reply/${boardVO.id}", function(response) {
			 	 var replies = response.replies;
			 	 for (var i=0; i< replies.length; i++) {
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
 	 	  		<div>
 	 	  		<div class="datetime"> 			
 	 	  		<span class="crtdt">등록: \${reply.crtDt}</span>
 	 	  		\${reply.mdfyDt != reply.crtDt ?
 	 	  			`<span class="mdfydt">(수정: \${reply.mdfyDt})</span>`
 	 	  			: ""}
 	 	  		</div>
 	 	  		<pre class = "content">\${reply.content}</pre>
 	 	  		\${reply.email == "${sessionScope._LOGIN_USER_.email}" ?
 	 	  		
 	 	  				`<div>
 	 	  					<span class="modify-reply">수정</span>
 	 	  					<span class="delete-reply">삭제</span>
 	 	  					<span class="re-reply">답변하기</span>
 	 	  				<div>`
 	 	  				: `<div>
 	 	  				<span class="recommend-reply">추천하기</span>
 	 	  				<span class="re-reply">답변하기</span>
 	 	  				</div>`}
 	 	  	</div>`
 	 	  	var replyDom = $(replyTemplate)
 	 	  	replyDom.find(".modify-reply").click(modifyReply)
 	 	  	replyDom.find(".delete-reply").click(deleteReply)
 	 	  	replyDom.find(".recommend-reply").click(recommendReply)
 	 	  	replyDom.find(".re-reply").click(reReply)
 	 	  	
 	 	  	$(".reply-items").append(replyDom);
 	 	 }
 	  })
 	}
 	
 	loadReplies()
 	
 	$("#btn-save-reply").click(function() {
 	var reply = $("#txt-reply").val().trim()
 	var mode = $("#txt-reply").data("mode")
 	var target = $("#txt-reply").data("target")
 	
 	if (reply != "") {
	 	var body = {"content": reply}
	 	var url = `/board/reply/${boardVO.id}`
	 	
	 	if (mode == "re-reply") { 
	 		body.parentReplyId = target
	 	}
	 	
	 	if (mode == "modify") {
	 		url = `/board/reply/modify/\${target}`
	 	}
	 	
	 	$.post(url, body, function(response) {
	 		var result = response.result
	 		if (result) {
	 		loadReplies();
	 		$("#txt-reply").val("")
	 		$("#txt-reply").removeData("mode")
	 		$("#txt-reply").removeData("target")
	 		 }
        })

    }

})
	
	$("#btn-cancel-reply").click(function(){
		$("#txt-reply").val("")
 		$("#txt-reply").removeData("mode")
 		$("#txt-reply").removeData("target")	
	 })
    });
  
 </script>  	
</head>
<body>

	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1>게시글 조회</h1>
	
	<form name="generalPostVO" method="post" ModelAttribute="generalPostVO" >
	<div class="grid">
		<label for="postTitle">제목</label>
		<div>${generalPostVO.postTitle}</div>
		
		<label for="postWriterId">이메일</label>
		<div>${generalPostVO.postWriterId}</div>
		
		<label for="viewCnt">조회수</label>
		<div>${generalPostVO.viewCnt}</div>
		
		<label for="postDate">등록일</label>
		<div>${generalPostVO.postDate}</div>

		<label for="postContent">내용</label> 
		<div>${generalPostVO.postContent}</div>
		
		<div class="replies">
			<div class="reply-items"></div>
			<div class="write-reply">
				<textarea id="#txt-reply"></textarea>
				<button id="btn-save-reply">등록</button>
				<button id="btn-cancel-reply">취소</button>
			</div>
		</div>
	</div>
	</form>	

	<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq boardVO.memberVO.email}">
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