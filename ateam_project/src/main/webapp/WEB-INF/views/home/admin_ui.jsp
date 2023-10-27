<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/lib/jquery-3.7.1.js"></script>
</head>
<style>
  nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
    width: 120px;
    overflow: hidden;
  }

  nav .admin_mainmenu > li > button {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: rgb(141, 18, 18);
    color: #e5e5e5;
    width: 120px;
    height: 30px;
  }


  nav ul li button {
    background: none;
    border: none;
    padding: 0;
    cursor: pointer;
  }

  .admin_submenu > li > button {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: rgb(153, 87, 87);
    color: #e5e5e5;
    width: 120px;
    height: 30px;
  }
</style>
<body>
  <nav>
    <ul class="admin_mainmenu">
      <li><button class="mainmenu_btn">회원</button>
        <ul class="admin_submenu">
          <li><button>개인</button></li>
          <li><button>기업</button></li>
        </ul>
      </li>
      <li><button class="mainmenu_btn">게시글</button>
        <ul class="admin_submenu">
          <li><button>자유 게시판</button></li>
          <li><button>질답 게시판</button></li>
          <li><button>기업소식 게시판</button></li>
          <li><button>알고리즘 게시판</button></li>
        </ul>
      </li>
      <li><button class="mainmenu_btn">통합</button>
        <ul class="admin_submenu">
          <li><button>공지</button></li>
          <li><button>신고</button></li>
          <li><button>해시태그</button></li>
        </ul>
      </li>
      <li><button class="mainmenu_btn">환경설정</button>
        <ul class="admin_submenu">
          <li><button>임시</button></li>
        </ul>
      </li>
    </ul>
  </nav>
  <div class="personal_modal">
    
  </div>
  <div class="overlay"></div>
</body>
<script>
  $('.mainmenu_btn').next('.admin_submenu').slideToggle(200)
  $('.mainmenu_btn').click(function() {
    let submenu = $(this).next('.admin_submenu')

    submenu.slideToggle(200)
  })
</script>
</html>