<!-- 작성자: 남현욱
     작성일자: 2023-10-26
     내용: 알고리즘 메인 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 홈 | 웹사이트 이름</title>
<style type="text/css">
   #container{
    width:1080px;
   }

   #contents_top > .coding_test_ranking{

   }

   #contents_top > .coding_test_explanation{
    
   }

   


</style>
</head>
<body>
<jsp:include page="../../layout/header.jsp"></jsp:include>
    <container>
        <div id="contents_top">
            <div class="coding_test_ranking">랭킹(삭제여부)</div>
            <div class="coding_test_explanation">코테 문제풀이</div>
        </div>
        <div id="contents_middle">
            <div class="showalltests">전체보기</div>
            <div class="coding_test">
                <div class="test1"></div>
                <div class="test2"></div>
                <div class="test3"></div>
                <div class="test4"></div>
            </div>
        </div>
        <div id="contents_bottom">
            <div class="coding_test_tip">코테 팁</div>
            <div class="algorithm_explanation">알고리즘 해설</div>
        </div>
    </container>
<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>