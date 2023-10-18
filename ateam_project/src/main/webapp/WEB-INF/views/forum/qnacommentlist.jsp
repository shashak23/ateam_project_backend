<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


 <h1>게시글 조회</h1>
<div class="grid">
    <label for="subject">제목</label>
    <div>${generalPostVO.subject}</div>

    <label for="email">이메일</label>
    <div>${generalPostVO.generalMemberVO.name} (${generalPostVO.generalMemberVO.email}) / ${generalPostVO.ipAddr}</div>

    <label for="viewCnt">조회수</label>
    <div>${generalPostVO.viewCnt}</div>

    <label for="originFileName">첨부파일</label>
    <div>
        <a href="/generalPost/file/download/${generalPostVO.id}">
            ${generalPostVO.originFileName}
        </a>
    </div>

    <label for="crtDt">등록일</label>
    <div>${generalPostVO.crtDt}</div>

    <label for="mdfyDt">수정일</label>
    <div>${generalPostVO.mdfyDt}</div>

    <label for="content">내용</label>
    <div>${generalPostVO.content}</div>

    <div class="replies">
        <div class="generalComment-items"></div>
        <div class="write-generalComment">
            <textarea id="txt-generalComment"></textarea>
            <button id="btn-save-generalComment">등록</button>
            <button id="btn-cancel-generalComment">취소</button>
        </div>
    </div>

    <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq generalPostVO.generalMemberVO.email}">
        <div class="btn-group">
            <div class="right-align">
                <a href="/generalPost/modify/${generalPostVO.id}">수정</a>
                <a href="/generalPost/delete/${generalPostVO.id}">삭제</a>
            </div>
        </div>
    </c:if>
</div>