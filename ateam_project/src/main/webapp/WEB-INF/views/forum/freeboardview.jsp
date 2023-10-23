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
                    console.log('gg');
                    // 댓글 목록을 response에서 받아와서 처리하는 부분
                    var replies = response.comments;
                    for (var i = 0; i < replies.length; i++) {
                        var comment = replies[i];

                        var commentTemplate =
                            `<div class="comment" data-comment-id="${comment.generalCommentId}"
                                style="padding-left: ${(comment.level - 1) * 40}px">
                                <div class="author">${comment.commentWriter} (${comment.email})</div>
                                <div class="recommend-count">추천수: ${comment.likeCnt}</div>
                                <div class="datetime">
                                    <span class="crtdt">등록: ${comment.postDate}</span>
                                    ${comment.mdfyDt != comment.crtDt ? 
                                        '<span class="update">수정: ' + comment.mdfyDt + '</span>'
                                        : ''}
                                </div>
                                <pre class="content">${comment.commentContent}</pre>
                                ${comment.email == "<%= session.getAttribute('_LOGIN_USER_').getEmail() %>" ?
                                    '<div>' +
                                        '<span class="update-comment">수정</span>' +
                                        '<span class="delete-comment">삭제</span>' +
                                        '<span class="re-comment">답변하기</span>' +
                                    '</div>'
                                    :
                                    '<div>' +
                                        '<span class="recommend-comment">추천하기</span>' +
                                        '<span class="re-comment">답변하기</span>' +
                                    '</div>'}
                            </div>`;
                        console.log(commentTemplate);
                        var commentDom = $(commentTemplate);
                        // commentDom.find('.update-comment').click(updatecomment);
                        // commentDom.find('.delete-comment').click(deletecomment);
                        // commentDom.find('.recommend-comment').click(recommendcomment);
                        // commentDom.find('.re-comment').click(recomment); 

                        $(".comment-items").append(commentDom);
                    }
                });
            }
            loadReplies();

            // 등록버튼 클릭
            $("#btn-save-comment").click(function(event) {
                event.preventDefault();

                var comment = $("#txt-comment").val().trim();

                if (comment != "") {
                    var body = { "commentContent": comment };
                    var url = '/freeboard/comment/write/${generalPostId}';

                    $.post(url, body, function(response) {
                        var result = response.result;
                        if (result) {
                            loadReplies();
                            $("#txt-comment").val("");
                        }
                    });
                }
            });
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