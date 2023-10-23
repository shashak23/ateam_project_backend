<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">

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
.modal {
    display: none; /* 초기에는 모달 숨김 */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 1;
    overflow: auto;
}
.modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}
.close {
    color: #aaa;
    float: right;
    font-size: 18px;
    font-weight: bold;
}
 /* Like 버튼 디자인 */
.like-btn {
    background-color: transparent;
    border: none;
    cursor: pointer;
    font-size: 24px;
    color: #e74c3c; /* Like 아이콘 색상 (예: 빨강) */
    transition: color 0.3s; /* 색상 전환 애니메이션 설정 */
}

.like-btn:hover {
    color: #c0392b; /* 마우스 호버 시 색상 변경 (예: 진한 빨강) */
}

.heart::before,
.heart::after {
    content: "\2665"; /* 하트 문자 코드 */
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
       		<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq generalPostVO.postWriter}">
				<div class="right-align">
						<div class="update_btn">
							<div class="btn">
								<a href="/qnaboard/update/${generalPostVO.generalPostId}">수정</a>
								<a href="/qnaboard/delete/${generalPostVO.generalPostId}">삭제</a>
							</div>
						</div>
					</div>
				</c:if>
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