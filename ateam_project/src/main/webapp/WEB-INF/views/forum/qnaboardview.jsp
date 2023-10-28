<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" id="viewport" content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width"/>
    <title>SnapChat</title>
   <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <script src="js/lib/jquery-3.7.1.js"></script>
    <jsp:include page="../layout/header.jsp"/>
<title>Insert title here</title>

<style>

a:link, a:hover, a:visited, a:active {
   color: #333;
   text-decoration: none;
}

.grid {
   display: grid;
   grid-template-columns: 80px 1fr;
   grid-template-rows: 28px 28px 28px 28px 28px 320px 1fr;
   margin-left: 20px;
   border-top: 1px solid var(--light-gray);
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

.replies {
  width: 800px;
  margin: 0px 0px 0px 500px;
}
h3 {
   position: relative;
   top: 10px;
}



.replies>.comment-header {
   display: grid;
   grid-template-columns: 95px 100px 1fr;
   height: 50px;
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

.replies>.write-comment {
   display: grid;
   grid-template-rows: 1fr;
   column-gap: 10px;
   align-items: center;
    
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


pre.content {
   margin: 0px;
}

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

/* 모달 내용 스타일 */
.report-modal-content {
    position: relative;
    margin: 15% auto;
    padding: 20px;
    width: 60%;
    background-color: #fff;
    border-radius: 5px;
}
/* 댓글 모달 내용 스타일 */
.report-window-content {
    position: relative;
    margin: 15% auto;
    padding: 20px;
    width: 60%;
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
.close {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 20px;
    cursor: pointer;
    color: #888;
}
#like-btn, #reportQnABoard {
   margin-left: 5px;
   background-color: var(--hashtag-blue);
   border: none;
   width: 70px;
   height: 30px;
   border-radius: 5px;
   cursor: pointer;
}
#button-id-list {
   bottom: 50px;
   position: relative;
   left: 500px;
   margin-left: 10px;
   background-color: var(--light-blue);
   border: none;
   width: 70px;
   height: 30px;
   border-radius: 5px;
   cursor: pointer;

}
.main_Container {
   position: relative;
   left: 500px;
   border-radius: 10px;
   border: 1px solid var(--light-gray);
   margin-top: 130px;
   width: 1000px;
   height:1000px;
   
}
.button_controller {
   position: relative;
   left: 1350px;
   top: 120px;
}
h1 {
   position: relative;
   bottom: 30px;
   margin-left: 30px;
   margin-top: 60px;
}
.qna_Title {
   position: relative;
   top: 25px;
   left:30px;
   color: var(--blue);
}
.content_Controller {
   border-bottom: 1px solid var(--light-gray);
}
.title_Name {
   display: inline-block;
    font-size: 2em; /* 2em은 <h1> 크기와 유사한 크기입니다. */
    font-weight: bold;
    margin: 25px 12px;
}
.postContent_Controller {
   letter-spacing: 1px;
   position: relative;
   bottom: 300px;
   text-align: justify; 
}
.postContent_controller_1 {
   position:relative;
   bottom: 330px;
   margin-left: 50px;
   margin-right: 50px;
   
}
.update_btn {
   position: absolute;
   top: -30px;
   right: 0;
}


textarea {
   width: 1000px;
  
}
#btn-save-comment {
   position: relative;
   bottom: -10px;
   border: none;
   background-color:var(--hashtag-blue) ;
   cursor: pointer;
   width: 70px;
   height: 30px;
   left: 930px;
   border-radius: 5px;
}
.comment{
   display: flex;
   flex-direction: column;
}
.recommend-comment,
.update-comment,
.delete-comment,
.report-comment {
   border: none;
   color: var(--white);
   border-radius: 10px;
   background-color:var(--light-blue);
   margin-left: 5px;
   cursor: pointer;
}
.separate-line {
   border: 1px solid #ccc;
   width: 1000px;
   height: 1px;
   margin: 10px 0px 7px 0px;
}

</style>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
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
	        // 모달을 표시합니다.
	        $("#report-window").css("display", "block");
	        console.log($(this).val())
      	}
		    // 모달 내부 "취소" 버튼 클릭 시 모달 닫기
		    $("#cancel-window").click(function() {
		        $("#report-window").css("display", "none");
		    });
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


          $().ready(function() {
          // "신고" 버튼 클릭 시 모달 열기
          $(".report-btn").click(function() {
             let reportType = $("#reportQnABoard").val()
             console.log(reportType);
              $("#report-modal").css("display", "block");
          
             // 모달 내부 "취소" 버튼 클릭 시 모달 닫기
             $(".close").click(function() {
                console.log(1)
                 $("#report-modal").css("display", "none");
               });
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
   
   });
</script>
</head>
<body>
<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq generalPostVO.postWriter}">					
   <div class="btn-group">
       <div class="right-align">
           <div class="update_btn">
               <div class="btn">
                   <a href="/qnaboard/update/${generalPostVO.generalPostId}">수정</a>
                   <a href="/qnaboard/delete/${generalPostVO.generalPostId}">삭제</a>
               </div>
           </div>
       </div>
   </div>
</c:if>
<div class="main_Container">
   <p class="qna_Title">QnA 게시판 > </p>
   <label for="postTitle"></label>
         <div class="title_Name">${generalPostVO.postTitle}</div>

   <!-- <h1>[스프링부트] 스프링 부트 3 자바 백엔드 개발 입문이요</h1> -->
   

   <!-- 목록보기 -->
   <button id="button-id-list" onclick="window.location.href='/qnaboard/list'">목록</button>
   
   
   <!-- 좋아요 기능 -->
   <button id="like-btn">좋아요</button>
   
   <!-- 신고 기능 -->
   <button id="reportQnABoard" value="3" class="report-btn">신고</button>
      <!-- 모달 창 -->
         <div id="report-modal" class="report-modal">
             <div class="report-modal-content">
                 <span class="close" id="cancel-modal">취소</span>
                    <!-- 모달 내용 추가 -->
                  <h2>신고 내용</h2>
                  <form name="reportVO" method="post" action="/report/view/3" enctype="multipart/form-data">
                     <div>
                        <label for="reportReason" >신고사유${reportVO.reportReason}
                           <select name="reportReason">
                              <option value="CC-20231018-000200">영리 및 홍보 목적</option>
                              <option value="CC-20231018-000201">개인정보노출</option>
                              <option value="CC-20231018-000202">음란성/선정성</option>
                              <option value="CC-20231018-000203">같은 내용 반복(도배)</option>
                              <option value="CC-20231018-000204">이용규칙위반</option>
                              <option value="CC-20231018-000205">기타</option>
                           </select>
                        </label>
               
                        <label for = "reportReasonContent">신고 상세내용
                        <textarea name="reportReasonContent" id="reportReasonContent">${reportVO.reportReasonContent}</textarea></label>
                     
                        <label for="attachedImg">첨부파일${reportVO.attachedImg}</label>
                        <input id="attachedImg" type="file" name="attachedImg"/>
                        
                        <label for="reportTypeId">${reportVO.reportTypeId}</label>
                        <input id="reportTypeId" type="hidden" name="reportTypeId" value="3"/>
                        
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
       
         
         <label for="postWriter">닉네임</label>
         <a href="/memberinfo/view/${generalPostVO.postWriter}">${generalPostVO.memberVO.nickname}</a>

         <label for="viewCnt">조회수</label>
         <div>${generalPostVO.viewCnt}</div>

         <label for="postDate">등록일</label>
         <div>${generalPostVO.postDate}</div>
      </div>
      
         <label for="postContent"></label>
         <!-- <div class="postContent_Controller"> -->
         <div class="postContent_controller_1">${generalPostVO.postContent}</div>
         
         
         <%-- <!-- </div> -->
         <div class="btn-group">
            <div class="right-align">
                   <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq generalPostVO.postWriter}">
                  
               </c:if>
            </div>
         </div> --%>
      
   </form>
</div>   
   <div class="replies">
      <div class="comment-header">
         <h3>댓글</h3>
      </div>
      <div class="write-comment">
            <textarea id="txt-comment" placeholder="의견을 입력하세요" maxlength="500"></textarea>
            <button id="btn-save-comment" type="submit">등록</button>
            <!-- 신고 버튼은 조회할때 사용<button id="btn-report-comment">신고</button> -->
         </div>
        <div class="comment-items"></div>
         
       <!-- 댓글 신고 모달 창 -->
         <div id="report-window" class="report-window">
             <div class="report-window-content">
                 <span class="close" id="cancel-window">취소</span>
                    <!-- 모달 내용 추가 -->
                  <h2>신고 내용</h2>
                  <form name="reportVO" method="post" action="/report/view/4">
                     <div>
                        <label for="reportReason" >신고사유${reportVO.reportReason}
                           <select name="reportReason">
                              <option value="CC-20231018-000200">영리 및 홍보 목적</option>
                              <option value="CC-20231018-000201">개인정보노출</option>
                              <option value="CC-20231018-000202">음란성/선정성</option>
                              <option value="CC-20231018-000203">같은 내용 반복(도배)</option>
                              <option value="CC-20231018-000204">이용규칙위반</option>
                              <option value="CC-20231018-000205">기타</option>
                           </select>
                        </label>
               
                        <label for = "reportReasonContent">신고 상세내용
                        <textarea name="reportReasonContent" id="reportReasonContent">${reportVO.reportReasonContent}</textarea></label>
                     
                        <label for="attachedImg">첨부파일${reportVO.attachedImg}</label>
                        <input id="attachedImg" type="file" name="attachedImg"/>
                        
                        <label for="reportTypeId">${reportVO.reportTypeId}</label>
                        <input id="reportTypeId" type="hidden" name="reportTypeId" value="4"/>
                        
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