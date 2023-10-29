<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        div.container {
            height: 500px;
    		width: 495px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        div.right-align {
            text-align: right;
        }

        label {
            font-weight: bold;
            font-size: 20px; /* 글자 크기를 조절합니다 */
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-size: 18px; /* 글자 크기를 조절합니다 */
        }

        a:hover {
            text-decoration: underline;
        }

        div.value {
            font-size: 18px; /* 글자 크기를 조절합니다 */
        }
    </style>
</head>
<body>
<div class="container">
    <div>
        <div class="value">이메일: ${memberVO.email}</div>
        <div class="value">닉네임: ${memberVO.nickname}
        <a href="/memberInfo/modify/update-nickname/${memberVO.email}">수정</a>
        </div>
        <div>
            <label>비밀번호:</label>
            <a href="/memberInfo/modify/update-password/${memberVO.email}">수정</a>
        </div>
    </div>
</div>
</body>
</html>