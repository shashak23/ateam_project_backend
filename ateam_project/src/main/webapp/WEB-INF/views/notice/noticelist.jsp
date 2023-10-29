<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 목록 테스트</title>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .mb10 {
        display: block;
        margin-bottom: 10px;
    }

    .ck-editor__editable { 
        height: 400px; 
    }

    .ck-content { 
        font-size: 12px; 
    }

    .create_btn {
        margin: 30px 15px;
    }

    .create_wrapper {
        display: flex;
        flex-direction: column;
        padding-bottom: 15px;
        border: 1px solid #888;
        margin: 0 15px;
    }
    .anchor {
        display: flex;
    }

    .create_btn, a {
        padding: 5px 8px;
        text-decoration: none;
        color: #4052f7;
        background-color: #d0eaff;
        margin-right: 15px;
        border-radius: 10px;
        border: 0px;
        font-weight: bold;
        cursor: pointer;
    }

    .create_container {
        visibility: hidden;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -80%);
        z-index: 10;
        box-shadow: 0 0 10px #19191948;
        border: 1px solid;
        width: 500px;
        padding: 30px;
        opacity: 0;
        border: none;
        border-radius: 5px;
        background-color: #ffffff;
        transition: 0.5s;
    }

    .create_container.active {
        visibility: visible;
        opacity: 1;
        transform: translate(-50%, -50%);
    }

    .create_container > * {
        margin-bottom: 10px;
    }

    .btn-close {
        position: absolute;
        top: 6px;
        right: 10px;
        background-color: transparent;
        font-size: 18px;
        color: #888;
        cursor: pointer;
    }

    .btn-close:hover {
        color: #191919;
    }

    .create_title {
        text-align: center;
    }

    #postTitle {
        border: 0px;
        background-color: #e9f3ff;
        width: 100%;
        height: 35px;
        padding: 0 15px;
        outline: none;
        color: #333;
    }

    #noticeContent {
        border: 0px;
        background-color: #e9f3ff;
        width: 100%;
        height: 200px;
        padding: 15px 15px;
        outline: none;
        color: #333;
        resize: none;
    }

    #postTitle::placeholder,
    #noticeContent::placeholder {
        color: #bbb;
    }

    #postTitle:focus::placeholder,
    #noticeContent:focus::placeholder {
        visibility: hidden;
    }

    .date_wrap {
        display: flex;
        justify-content: space-around;
        align-items: center;
    }

    .dateSelector1,
    .dateSelector2 {
        width: 150px;
        height: 30px;
        outline: none;
        border: 1px solid #e5e5e5;
        padding: 0 10px;
        color: #191919;
    }

    #start-date, #end-date {
        outline: none;
    }

    .submit_btn_wrap {
        display: flex;
        justify-content: flex-end;
        margin-top: 30px;
    }

    .submit_btn {
        background-color: #e9f3ff;
        border: 0px;
        padding: 5px 10px;
        border-radius: 5px;
        color: #4052f7;
        font-weight: bold;
        text-align: center;
    }

    .overlay {
        background-color: #47474754;
        position: fixed;
        width: 100%;
        height: 100vh;
        top: 0;
        left: 0;
        transition: 0.5s;
        opacity: 0;
        pointer-events: none;
    }

    .overlay.active {
        opacity: 1;
        pointer-events: all;
    }

    .errors {
        background-color: rgb(255, 244, 244);
        padding: 5px 10px;
        color: #ffafaf;
        margin-bottom: 10px;
        font-size: 9pt;
        cursor: pointer;
    }

    .inactive {
        opacity: 0.6;
        cursor: not-allowed;
    }
</style>
</head>
<body>
    <div>
        <div>
            <button class="create_btn">생성하기</button>
        </div>
        <c:forEach items="${noticeList.noticeList}" var="item">
            <div class="create_wrapper">
                <h1>제목: ${item.postTitle}</h1>
                <p>내용: ${item.noticeContent}</p>
                <div>게시일: ${item.releaseStartDate}</div>
                <div>마감일: ${item.releaseEndDate}</div>
                <div class="anchor">
                    <a href="/notice/modify/${item.noticeId}">수정하기</a>
                    <a href="/notice/delete/${item.noticeId}">삭제하기</a>
                </div>
            </div>    
        </c:forEach>
    </div>

    <!-- 공지 입력 폼 -->
    <form:form modelAttribute="noticeVO" method="post">
        <div class="create_container">
            <div class="btn-close">&times;</div>
            <h1 class="create_title">공지 생성</h1>
            <div>
                <label for="postTitle" class="mb10">제목</label>
                <input type="text" name="postTitle" id="postTitle" placeholder="제목을 입력해주세요"
                       value="${noticeVO.postTitle}"/>
                <!-- <form:errors path="postTitle" element="div" cssClass="errors" /> -->
            </div>
            <label for="noticeContent" class="mb10">내용</label>
            <div>
                <textarea name="noticeContent" id="editor" placeholder="내용을 입력해주세요."
                          value="${noticeVO.noticeContent}"></textarea>
                <!-- <form:errors path="postTitle" element="div" cssClass="errors" /> -->
            </div>
            <div class="date_wrap">
                <label for="start-date">시작일</label>
                <input class="dateSelector1" placeholder="시작 날짜" id="start-date"
                       name="releaseStartDate" value="${noticeVO.releaseStartDate}"/>
                <span>~</span>
                <label for="end-date">종료일</label>
                <input class="dateSelector2" placeholder="종료 날짜" id="end-date"
                       name="releaseEndDate" value="${noticeVO.releaseEndDate}"/>
            </div>
            <div class="submit_btn_wrap">
                <input type="submit" value="생성" class="submit_btn"/>
            </div>
        </div>
    </form:form>
    <div class="notice_create_overlay"></div>

    <script>
        $().ready(function() { 
            // 달력 포맷
            flatpickr.localize(flatpickr.l10ns.ko);

            $('.dateSelector1').flatpickr({
                minDate: 'today',
                local: 'ko'
            })

            $('.dateSelector2').flatpickr({
                minDate: 'today',
                local: 'ko'
            })
            // 달력 포맷 끝

            // 모달 실행을 위한 문장
            $('.create_btn').click(function() {
                $('.create_container, .overlay').addClass('active')
            })

            $('.btn-close, .overlay').click(function() {
                $('.create_container, .overlay').removeClass('active')
            })
            $('.dateSelector1').click(function() {
                console.log($('.dateSelector1').val())
            })

            // ck 에디터
            ClassicEditor.create( document.querySelector( '#editor' ), {
			    language: "ko"
			})
            
            // 유효성 체크
            $('.submit_btn').addClass('inactive')
            $('.submit_btn').prop('disabled', true)
            let today = new Date()
            let year = today.getFullYear()
            let month = today.getMonth() + 1
            let day = today.getDate()
            if (month < 10) {
                    month = '0' + month
                }
            if (day < 10) {
                day = '0' + day
            }
            let formattedToday = year + '' + month + '' + day
            let start_date
            let end_date
            $('#end-date').change(function() { 
                art_date = parseInt($('#start-date').val().split('-').join(''))
                end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            
            $('#postTitle').change(function() {
                if ($('#postTitle').val().trim() === '') {
                    const titleError = $('<div class="errors title_message">제목을 입력해주세요.</div>')
                    $('.title_message').remove()
                    $('#postTitle').after(titleError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if (end_date < formattedToday || 
                         end_date < start_date) {
                    $('.title_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.title_message').remove()
                    $('.submit_btn').prop('disabled', false)
                    $('.submit_btn').removeClass('inactive')
                } 
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })
            $('#end-date').change(function() { 
                const start_date = parseInt($('#start-date').val().split('-').join(''))
                const end_date = parseInt($('#end-date').val().split('-').join(''))
                console.log('ㅎㅇ')
                console.log(formattedToday, start_date, end_date)
                if (end_date < formattedToday || 
                    end_date < start_date) {
                    const dateError = $('<div class="errors date_message">날짜 형식이 잘못되었습니다.</div>')
                    $('.date_message').remove()
                    $('.date_wrap').after(dateError)
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else if ($('#postTitle').val().trim() === '') {
                    $('.date_message').remove()
                    $('.submit_btn').addClass('inactive')
                    $('.submit_btn').prop('disabled', true)
                }
                else {
                    $('.date_message').remove()
                }
            })

        })
    </script>
</body>
</html>