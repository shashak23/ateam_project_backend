<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../layout/header.jsp" />
<style>
    .mybookmark_wrap {
        display: flex;
        flex-direction: column;
        padding: 5px;
        margin: 50px 0;
    }

    .mybookmark_wrap a {
        margin: 0 auto;
    }

    .mybookmark_list,
    .mybookmark_list_head {
        display: grid;
        grid-template-columns: 200px 200px 300px 100px 50px 50px;
        column-gap: 10px;
        align-items: center;
        margin: 0 auto;
        border-bottom: 1px solid var(--light-gray);
        padding: 5px;
        background-color: transparent;
        transition: background-color .2s;
    }
    .mybookmark_list:hover {
        background-color: var(--light-gray);
        cursor: pointer;
    }

    .mybookmark_list_head {
        text-align: center;
    }

    .mybookmark_list li,
    .mybookmark_list li p,
    .mybookmark_list_head li {
        font-size: var(--font-medium);
    }

    .mybookmark_list_head li,
    .mybookmark_list .writer,
    .mybookmark_list .like_cnt,
    .mybookmark_list .view_cnt {
        color: var(--dark-gray);
    }

    .mybookmark_list .bookmark_title {
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }

    .mybookmark_list .bookmark_content {
        overflow: hidden;
        white-space: nowrap; 
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
    }
    
    .mybookmark_list img {
        max-width: 100px;
    }

    .like_cnt,
    .view_cnt,
    .writer {
        text-align: center;
    }
</style>

<div class="mybookmark_wrap">
    <ul class="mybookmark_list_head">
        <li>작성자</li>
        <li>제목</li>
        <li>내용</li>
        <li>작성일</li>
        <li>좋아요</li>
        <li>조회수</li>
    </ul>
    <c:forEach items="${bookmarkList}" var="bookmark">
        <c:choose>
            <c:when test="${bookmark.generalPostVO.boardId eq 'CC-20231017-000029'}">
                <a href="/qnaboard/view/${bookmark.generalPostVO.generalPostId}" target="_blank">
            </c:when>
            <c:otherwise>
                <a href="/freeboard/view/${bookmark.generalPostVO.generalPostId}" target="_blank">
            </c:otherwise>
        </c:choose>
        <ul class="mybookmark_list">
            <li class="writer">${bookmark.memberVO.nickname}</li>
            <li class="bookmark_title">${bookmark.generalPostVO.postTitle}</li>
            <li class="bookmark_content">${bookmark.generalPostVO.postContent}</li>
            <li>${bookmark.generalPostVO.postDate}</li>
            <li class="like_cnt">${bookmark.generalPostVO.likeCnt}</li>
            <li class="view_cnt">${bookmark.generalPostVO.viewCnt}</li>
        </ul></a>
    </c:forEach>
</div>

<jsp:include page="../layout/footer.jsp" />
</body>
<script>
      // 모달창 열고 닫기
    $(document).on('click', '.incomplete', function() {
        $('.modal, .overlay').addClass('modal_active')
    })
    $(document).on('click', '.overlay', function() {
        $('.modal, .overlay').removeClass('modal_active')
    })

    $(document).on('keyup', function(e) {
        if (e.key === 'Escape') {
            $('.modal, .overlay').removeClass('modal_active')
        }
    })

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

</script>
</html>