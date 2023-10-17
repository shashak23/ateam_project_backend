<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필사진 수정하기</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f0f0f0;
        }

        .profile-container {
            margin-top: 50px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 300px;
            margin: 0 auto;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto;
            display: block;
        }

        .file-input {
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px;
        }
    </style>
</head>
<body>
<form method="post" action="/memberInfo/modify/update-profile-pic" enctype="multipart/form-data">
    <input type="hidden" name="email" value="${memberVO.email}" />
    <div class="profile-container">
        <h1>프로필 사진</h1>
        <img src="${memberVO.profilePic}" alt="프로필 사진" class="profile-image" id="profile-image">
        <div class="file-input">
            <input type="file" id="profilePic" name="profilePic" />
            현재 업로드된 파일: ${memberVO.profilePic}
        </div>
        <input type="submit" value="저장" />
    </div>
</form>
</body>
</html>
