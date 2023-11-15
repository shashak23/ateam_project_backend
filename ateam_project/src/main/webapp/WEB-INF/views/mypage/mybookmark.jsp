<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 북마크</title>
    <jsp:include page="../layout/header.jsp" />
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <style>
        /* 여기에 필요한 스타일 추가 */
    </style>
</head>
<body>
    <div class="body_container">
        <div class="flex_button">
            <button id="myprofile">마이페이지</button>
            <button id="bookmark">북마크</button>
            <button id="modify_info">정보 수정</button> 
            <button id="mypost">내가 쓴 게시글</button>
            <button id="solve">내가 푼 문제</button>
            <button>탈퇴</button>
        </div>  

        <div class="mybookmark_wrap">
            <table class="grid">
                <caption>나의 북마크 보기</caption>
                <thead>
                    <tr>
                    	<th>번호</th>
                        <th class="contents_name">제목</th>
                        <th class="writer_1">작성자</th>
                        <th class="write_day">작성일</th>
                        <th class="view_cnt_1">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${bookmarkList}" var="bookmark" varStatus="index">
                        <tr>
                        	<td>${index.index + 1}</td>
                            <td class="bookmark_title">
                                <c:choose>
                                    <c:when test="${bookmark.generalPostVO.boardId eq 'CC-20231017-000029'}">
                                        <a href="/qnaboard/view/${bookmark.generalPostVO.generalPostId}" target="_blank">
                                            ${bookmark.generalPostVO.postTitle}
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/freeboard/view/${bookmark.generalPostVO.generalPostId}" target="_blank">
                                            ${bookmark.generalPostVO.postTitle}
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            <td class="writer">${bookmark.memberVO.nickname}</td>
                            </td>
                            <td class="write_day">${bookmark.generalPostVO.postDate}</td>
                            <td class="view_cnt">${bookmark.generalPostVO.viewCnt}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <jsp:include page="../layout/footer.jsp" />
</body>
<script>
    // 스크롤 버튼, IDE
    let calcScrollValue = () => {
        let scrollProgress = document.getElementById('progress')
        let progressValue = document.getElementById('progress-value')
        let pos = document.documentElement.scrollTop
        let calcHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight
        let scrollValue = Math.round((pos * 100) / calcHeight)

        scrollProgress.addEventListener('click', () => {
        document.documentElement.scrollTop = 0
        })
    }
  
    window.onscroll = calcScrollValue

    // 서브 리스트가 있다면? 아래로 떨군다.
    $('.visible').hide()
    $('.list_company').mouseover(function() {
        $('.visible').show()
        $(this).find('a').css({'background-color': 'var(--blue)',
                            'color': 'white',
                            'box-shadow': '0 0 5px var(--gray)'})
    })

    $('.list_company').mouseleave(function() {
        $('.visible').hide()
        $(this).find('a').css({'background-color': 'white',
                            'color': 'var(--blue)',
                            'box-shadow': 'none'})
    })

    $('p').css('background-color', 'rgba(0, 0, 0, 0)')

    // 플렉스버튼
    function redirectToURL(url) {
        window.location.href = url;
    }
    /* 비밀번호, 닉네임 수정 버튼 */
    $("#myprofile").click(function() {
        redirectToURL(`/memberinfo/view/${sessionScope._LOGIN_USER_.email}`);
    });
    $("#mypost").click(function() {
        redirectToURL(`/member/mypost`);
    });
    $("#modify_info").click(function() {
        redirectToURL(`/member/selectmember/${sessionScope._LOGIN_USER_.email}`);
    });
    $("#quit").click(function() {
        redirectToURL(`/member/logout`);
    });
    $("#solve").click(function(){
        redirectToURL(`/codingtest/mylist`);
    });
    $("#bookmark").click(function(){
        redirectToURL(`/member/bookmark`);
    });
</script>
</html>