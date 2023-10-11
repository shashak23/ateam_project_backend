<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홈페이지(테스트용) 입니다.</title>
    <link rel="stylesheet" href="home.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
    <div class="header_container">
        <div class="header">
            <div class="flex_left">
                <div class="logo_wrap">
                    <div class="logo">
                        로고
                    </div>
                    <div class="site_name">
                        BufferOverflow
                    </div>
                </div>
                <ul class="nav_list">
                    <li>질의 게시판</li>
                    <li>자유 게시판</li>
                    <li>팀 게시판</li>
                    <li>기업 게시판</li>
                </ul>
            </div>
            <div class="flex_right">
                <div class="profile_wrap">
                    <div class="profile_icon">사진</div>
                    <div class="your_name">닉네임</div>
                    <div class="scrap_icon">스크</div>
                    <div class="alarm_icon">알림</div>
                    <div class="chat_icon">챗</div>
                </div>
            </div>
        </div>
    </div>
    <div class="search_wrap">
        <div class="magnify"></div>
        <span class="line"></span>
        <input type="text" class="search_area" value="">
    </div>
    <div class="body_container">
        <div class="flex_left">
            <div class="simple_write_wrap">
                <textarea class="simpleboard" name="simpleboard" placeholder="글을 입력해주세요."></textarea>
                <span class="material-symbols-outlined">
                    edit
                </span>
            </div>
            <div class="content_container">
                <div class="writer_info_area">
                    <div class="flex_left">
                        <span class="profile_icon">\</span>
                        <div>
                            <div class="writer_name">꿔바로우 먹고싶삼</div>
                            <div class="posting_date">2023-10-03</div>
                        </div>
                    </div>
                    <div class="flex_right">
                        <span class="more">
                            <span class="material-symbols-outlined">
                                more_vert
                            </span>
                        </span>
                    </div>
                </div>
                <div class="q_title">
                    <span class="big_letter">Q</span>
                    <div>
                        <span class="title">궁금해서 도저히 못참겠는게 있습니다.</span>
                        <span class="comment_number">[20]</span>
                        <span class="material-symbols-outlined">
                            thumb_up
                        </span>

                        <span class="thumbs_up_number">12</span>
                    </div>
                </div>
                <p class="q_content">
                    지구가 태양 주변을 공전하고 있고, 달이 지구 주변을 공전하고 있을 때 이들이 태양 - 지구 - 달 순서대로
                    일직선 상이 배열이 되는 보름날에는 달이 지구 그림자에 가려지는 월식(달이 먹힘)현상이 관측된다.
                    하지만 달이 공전하는 궤도가 지구가 공전하는 궤도보다 5도 정도 삐딱하게 기울어져 있기 때문에 항상 월식이
                    관측되진 않는다. 즉, 월식은 언제나 보름달이 뜰 때에 일어나지만, 그 역은 성립하지 않는다.
                </p>
                <ul>
                    <li>#Java</li>
                    <li>#HTML</li>
                    <li>#CSS</li>
                    <li>#Ruby</li>
                    <li>#Oracle</li>
                    <li>#JavaScript</li>
                    <li>#Python</li>
                </ul>
            </div>
            <div class="recommend_wrap">
                <!-- 팔로우 몇 명인지도 표시 -->
                <div class="items">
                    <div class="img"></div>
                    <div class="name">강동원</div>
                </div>
                <div class="items">
                    <div class="img"></div>
                    <div class="name">백종원 아저씨</div>
                </div>
                <div class="items">
                    <div class "img"></div>
                    <div class="name">하루나</div>
                </div>
            </div>
        </div>
        <div class="flex_right">
            <div class="ranking_wrap">
                <ul>
                    <!-- 더 구체적인 정보 필요! -->
                    <li class="hot_post">
                        <a href="#">구글링 하는 방법</a>
                    </li>
                    <li class="hot_post">
                        <a href="#">자바 스크립트로 게임 만드는 법</a>
                    </li>
                    <li class="hot_post">
                        <a href="#">고양이에게 츄르 안 주고 관심 받는 법</a>
                    </li>
                    <li class="hot_post">
                        <a href="#">요즘 뜨는 개발 지식 top 8</a>
                    </li>
                    <li class="hot_post">
                        <a href="#">나이 30에 의대 포기하고 개발 직군에 뛰어든 이유</a>
                    </li>
                    <li class="hot_post">
                        <a href="#">일론 머스크 내한 일정</a>
                    </li>
                    <li class="hot_post">
                        <a href="#">푸라닭 한 마리 뜯고 싶네요</a>
                    </li>
                    <li class="hot_post">
                        <a href="#">현업 개발자들이 뽑은 프로젝트 가장 중요한 역량 top 3</a>
                    </li>
                    <li class="hot_post">
                        <a href="#">코딩 테스트 준비 이렇게 하세요!</a>
                    </li>
                    <li class="hot_post">
                        <a href="#">추석 때 용돈 달라고 했다 호적 파인 썰</a>
                    </li>
                </ul>
                <div class="next_btn">
                    <span class="material-symbols-outlined">
                        arrow_back_ios
                    </span>
                    <button class="dot active">●</button>
                    <button class="dot">●</button>
                    <button class="dot">●</button>
                    <span class="material-symbols-outlined">
                        arrow_forward_ios
                    </span>
                </div>
            </div>
            <div class="hash_tag_wrap">
                <div class="hash_tag">#Java</div>
                <div class="hash_tag">#HTML</div>
                <div class="hash_tag">#CSS</div>
                <div class="hash_tag">#Ruby</div>
                <div class="hash_tag">#Spring Boot</div>
                <div class="hash_tag">#JavaScript</div>
                <div class="hash_tag">#Python</div>
                <div class="hash_tag">#C</div>
                <div class="hash_tag">#C++</div>
                <div class="hash_tag">#Jupiter</div>
                <div class="hash_tag">#ChatGPT</div>
                <div class="hash_tag">#AI</div>
                <div class="hash_tag">#UX</div>
                <div class="hash_tag">#UI</div>
                <div class="hash_tag">#MariaDB</div>
                <div class="hash_tag">#IntelliJ</div>
                <div class="hash_tag">#VSCode</div>
                <div class="hash_tag">#Ajax</div>
                <div class="hash_tag">#React</div>
            </div>
        </div>
    </div>
</body>
</html>
