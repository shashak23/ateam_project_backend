<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해시태그 조회 테스트</title>
<style>
  * {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    background-color: #333;
    color: #ddd;
  }
  .hashtag_wrap {
    display: flex;
    flex-wrap: wrap;
    width: 300px;
    border: 1px solid #e5e5e5;
    border-radius: 8px;
    margin-bottom: 30px;
  }

  .hashtag_wrap > .hashtag {
    padding: 3px 10px;
    margin: 5px 6px;
    border-radius: 12px;
    border: 0;
    background-color: #75C2F6;
    color: #e5e5e5;
  }

  #codeContent {
    outline: none;
  }
</style>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script>
  $().ready(function() {
    let tag = {}
    let counter = 0

    function addTag(value) {
      tag[counter] = value
      counter++
    }

    function marginTag() {
      return Object.values(tag).filter(function(word) {
        return world !== ''
      })
    }

    $('.')

  })
</script>
</head>
<body>
  <div>
    총 ${commonListVO.hashtagCnt} 개의 해시태그
  </div>
  
  <div class="hashtag_wrap">
    <c:forEach items="${commonListVO.hashtagList}" var="hashtag">
      <button class="hashtag">#${hashtag.codeContent}</button>
    </c:forEach>
  </div>
  <form action="/home/hashtaglist" method="post">
    <label for="codeContent">입력: </label>
    <input type="text" name="codeContent" id="codeContent" />
    <input type="submit" value="생성">
  </form>
  <h1>선택된 해시태그</h1>
</body>
</html>