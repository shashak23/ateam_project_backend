<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<script type="text/javascript">
</script>
<style>
    #overall{
        display: flex;
        margin: 0 auto;
        width: 1000px;
        justify-content: center;
    }

    #left_container{
        display: flex;
        flex-direction: column;
        width:700px;
    }

    #companyProfile{
        display: flex;
    }

    .line{
        width:620px;
        border: 0.0625rem solid rgb(231,231,231);
    }

    #recruitment{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        margin-top: 20px;
    }

    .poster{
        width:650px;
    }

    .posts{
        display: flex;
        margin: 30px;
    }

    #right_container{
        display: flex;
        flex-direction: column;
        width: 280px;
    }

    .logoImg{
        width: 150px;
        height: 150px;
    }

    .posterImg{
        width:650px;
    }
</style>
</head>
<body>
    <div id="overall">
        <div id="left_container">
            <div id="companyProfile">
                <div class="image">
                    <img class="logoImg" src="/images/회사 로고.png/" alt="회사 로고">
                </div>
                <div class="name">회사명</div>
            </div>
            <div class="line"></div>
            <div id="recruitment">
                <ul>
                    <li>모집1
                        <div class="position1"></div>
                        <div class="info"></div>
                    </li>
                    <li>모집2
                        <div class="position1"></div>
                        <div class="info"></div>
                    </li>
                    <li>모집3
                        <div class="position1"></div>
                        <div class="info"></div>
                    </li>
                    <li>모집4
                        <div class="position1"></div>
                        <div class="info"></div>
                    </li>
                </ul>
            </div>
            <div class="poster">
                <img class="posterImg" src="/images/포스터.png/" alt="포스터">
            </div>
            <div class="line"></div>
            <div class="posts">게시물
                <ul>
                    <li>게시글1</li>
                    <li>게시글2</li>
                </ul>
            </div>
        </div>
        <div id="right_container">
            <div class="companyInfo">
                <ul>
                    <li>위치</li>
                    <li>급여</li>
                    <li>임직원수</li>
                    <li>복지</li>
                    <li>휴가</li>
                </ul>
            </div>
            <div class="detailInfo">추가 설명</div>
        </div>
    </div>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>