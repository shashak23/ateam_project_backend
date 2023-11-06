<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <style type="text/css">
        #container {
            display: grid;
            grid-gap: 30px;
            grid-template-columns: 300px 1fr;
        }

        .flex_button {
            display: flex;
            flex-direction: column;
            margin-left: 120px;
            
        }

        .flex_main {
            display: flex;
            flex-direction: column;
            width: 1200px;
            margin-left: 45px;
        }

        .flex_button button {
            width: 150px;
            height: 40px;
            margin-bottom: 15px;
            cursor: pointer;
            border: 2px;
        }

        .flex_button button:hover {
            background-color: #007BFF;
            color: white;
        }

        .flex_button button:first-child {
            margin-top: 51px;
        }

        .follow_chat {
            text-align: right;
        }
        .follow_icon{
            background-color: white;
            cursor: pointer;
            height: 30px;
        }
        .follow_icon>img ,.message_icon>img{
            width: 15px;
        }
        .message_icon{
            background-color: black;
            cursor: pointer;
            color: white;
            height: 30px;
        }
        

        .profile {
            display: grid;
            grid-template-columns: 170px 1fr;
            margin: 20px;
        }

        .profile img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }

        .follow {
            border-bottom: 1px solid #333;

        }

        .follow>p {
            padding-bottom: 5px;
        }

        .introduction_list {
            padding: 0px;
            list-style: none;
            grid-gap: 20px;
            width: 1200px;
        }

        .list_name {
            margin-top: 66px;
        }

        .follow a {
            text-decoration: none;
            color: #000;
        }
        .follow a:first-child{
            margin-left: 50px;
        }
        .related_link {
            display: flex;
            align-items: center;
            margin-top: 20px;

        }

        .related_link img {
            width: 30px;
        }

        .related_link a {
            text-decoration: none;
            color: #333;
            margin-right: 10px;

        }

        .show_pwf {
            display: grid;
            grid-template-columns: 1fr 250px 250px 250px 1fr;
        }

        .show_pwf button {
            background-color: transparent;
            border: none;
            cursor: pointer;
            padding-top: 30px;
            text-decoration: none;
            color: #575555;
            position: relative;
        }

        .show_pwf button>h2 {
            margin-bottom: 0px;
        }

        .show_pwf button:hover::after {
            content: "";
            position: absolute;
            bottom: -5px;
            left: 0;
            right: 0;
            height: 4px;
            background-color: orange;
            transform: scaleX(0.55);
        }

        #technology_stack {
            margin-top: 70px;
            border-bottom: 1px solid #333;
        }

        #edit_button1{
            cursor: pointer;
            background: none;
            border: none;
            padding-left: 10px;
            margin: 0;
        }
         #edit_button2,#edit_button3,#edit_button4 {
            cursor: pointer;
            background: none;
            border: none;
            padding: 0;
            margin: 0;
        }

        #edit_button1>img,
        #edit_button2>img,
        #edit_button3>img,
        #edit_button4>img{
            width: 20px;
        }

        #technology_stack ul {
            list-style: none;
            padding: 0;
            display: flex;
            margin-bottom: 40px;
        }

        #technology_stack li {
            margin-right: 10px;
        }

        #technology_stack ul>li>button {
            background-color: #f2f2f2;
            border: none;
            border-radius: 20px;
            padding: 5px 15px;
            cursor: pointer;
        }

        .education{
            border-bottom: 1px solid #000;
        }

        .education>ul,
        .career>ul {
            padding: 0px;
            margin-bottom: 40px;
        }

        .education>ul>li {
            list-style: none;
            margin-bottom: 10px;
        }

        .career>ul>li {
            list-style: none;
        }

        .career_list_year {
            font-size: 10pt;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>
<form>

    <div id="container">
        <div class="flex_button">
            <button>마이페이지</button>
            <button>스크랩</button>
            <button>정보 수정</button>
            <button>내가 푼 문제</button>
            <button>마이 팀</button>
        </div>
        <div class="flex_main">
            <div class="follow_chat">
           
                <button class="message_icon">
                    ✉
                    메시지
                </button>
            </div>
            <div class="profile">
                <img src="https://thumb.mt.co.kr/06/2023/07/2023073016215867372_2.jpg/dims/optimize/">
                <div>
                    <ul class="introduction_list">
                        <li class="list_name">
                            <h2>GW</h2>
                        </li>
                        <li class="list_intro">내 꿈은 해적왕  
                        </li>
                        
                    </ul>
                </div>
            </div>
                 <button class="follow_icon">
                    <img src="https://cdn-icons-png.flaticon.com/512/907/907873.png">
                    팔로우
           		</button>
            <div class="follow">
                <a href="#">팔로워</a>
                <a href="#">팔로잉</a>
                <p></p>
            </div>
            <div class="related_link">
                <a href="#"><img src="https://cdn-icons-png.flaticon.com/512/25/25231.png" alt="Icon 1"></a>
                <a href="#"><img
                        src="https://w7.pngwing.com/pngs/863/247/png-transparent-email-computer-icons-email-miscellaneous-angle-text.png"
                        alt="Icon 2"></a>
                <a href="#"><img src="https://i.pinimg.com/originals/f8/0b/dd/f80bdd79a51358da6ee41a0fda520394.png"
                        alt="Icon 3"></a>
                        <button id="edit_button1"><img
                            src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png"></button>
            </div>
            <div class="show_pwf">
                <p></p>
                <button>
                    <h2>프로필</h2>
                </button>
                <button>
                    <h2>글</h2>
                </button>
                <button>
                    <h2>팔로잉</h2>
                </button>
                <p></p>
            </div>
            <div id="technology_stack">
                <p>기술스택
                    <button id="edit_button2"><img
                            src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png"></button>
                </p>
                <ul>
                    <li><button></button></li>
                </ul>
            </div>
            <div class="education">
                <p>학력
                    <button id="edit_button3"><img
                            src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png"></button>
                </p>
                <ul>
                    <li>Massachusetts Institute of Technology Institute for Data, Systems</li>
                    <li>서울대학교 컴퓨터공학과 석사</li>
                </ul>
            </div>
            <div class="career">
                <p>경력
                    <button id="edit_button4"><img
                            src="https://cdn.icon-icons.com/icons2/1462/PNG/512/101edit_99874.png"></button>
                </p>
                <ul>
                    <li>한국레드햇 - Senior Solution Architect
                    <li class="career_list_year">2018.12 ~ 현재</li>
                    <li>한국오라클 - Principal Sales Consultant
                    <li class="career_list_year">2015.01 ~ 2018.11</li>
                    <li>액센츄어 코리아 - Senior System Administrator
                    <li class="career_list_year">2012.05 ~ 2014.12</li>
                    <li>엑셈 - Senior Technical Support Engineer
                    <li class="career_list_year">2008.06 ~ 2012.04</li>
                </ul>
            </div>
        </div>
    </div>
</form>
</body>

</html>