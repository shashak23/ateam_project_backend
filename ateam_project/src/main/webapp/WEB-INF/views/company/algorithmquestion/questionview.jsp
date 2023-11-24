<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../../layout/header.jsp"/>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<script type="text/javascript">
    $().ready(function() {
    	$("#ide")[0].contentWindow.onload = function() {
    		this.setCode(`${algorithmQuestionVO.defaultCode}`);
    	}
   
    	// 모달 실행을 위한 문장
        $('.btn-primary').click(function() {
            $('.create_container, .overlay').addClass('active')
        })
        $('.btn-close, .overlay').click(function() {
            $('.create_container, .overlay').removeClass('active')
        })
        
        $("#submit-btn").click(function(event) {
        	event.preventDefault();
        	var code = $("#ide")[0].contentWindow.getCode();
        	$("#defaultCode").val(code);
        	$("#myAnswer").val(code);
        	$("#myAlgorithmVO").submit();
        	
        })     
    })

   // 모달창 열고 닫기
  $(document).on('click', '.incomplete', function() {
    $('.modal, .overlay').addClass('modal_active')
  })
  $(document).on('click', '.overlay', function() {
    $('.modal, .overlay').removeClass('modal_active')
  })

  $(document).on('keyup', function(e) {
    if (e.key === 'Escape') {
      $('.modal, .overlay').removeClass('modal_active')
    }
  })

  // 스크롤 버튼, IDE
  let calcScrollValue = () => {
  let scrollProgress = document.getElementById('progress')
  let progressValue = document.getElementById('progress-value')
  let pos = document.documentElement.scrollTop
  let calcHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight
  let scrollValue = Math.round((pos * 100) / calcHeight)

  scrollProgress.addEventListener('click', () => {
    document.documentElement.scrollTop = 0
  })
  }
  
  window.onscroll = calcScrollValue

  // 서브 리스트가 있다면? 아래로 떨군다.
  $('.visible').hide()
  $('.list_company').mouseover(function() {
    $('.visible').show()
    $(this).find('a').css({'background-color': 'var(--blue)',
                           'color': 'white',
                           'box-shadow': '0 0 5px var(--gray)'})
  })
  $('.list_company').mouseleave(function() {
    $('.visible').hide()
    $(this).find('a').css({'background-color': 'white',
                           'color': 'var(--blue)',
                           'box-shadow': 'none'})
  })
</script>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
    text-decoration: none;
    color: var(--dark);
}

body > .body_container {
    width: 100%;
    display: grid;
    grid-template-columns: 1fr 1080px 1fr;
}

/* Main Contents */
body > .body_container > .body {
    grid-column: 2/3;
    margin: 40px 0 100px 0
}

/* Main Contents 왼쪽 여백*/
body > .body_container > .body_left_aside {
    grid-column: 1/2;
}

/* Main Contents 오른쪽 여백*/
body > .body_container > .body_right_aside {
    grid-column: 3/4;
}

	#ide {
		width: 100%;
		min-height: 500px;
		border: 1px solid #c4c4c4;
	}
	
    .ck ck-toolbar {
    	width:1000px;
    }
    .ck-editor__editable { 
        width:1000px;
        height: 600px;
    }
    .ck-content { 
        width:1000px;
    }
    
	* {
		color: #333;
		font-size: 17px;
	}

    #question_info{
        display: flex;
        margin-bottom: 10px;    
    }
    
    #line{
        border: 2px solid #333;
        transform: rotate(90deg);
        width: 25px;
        position: relative;
        top: 15px;
        left: -9px;
    }

	div.flex {
		display: flex;
		flex-direction: column;
	}

    .flex > .conditions{
        margin: 20px 0 20px 0;
    }

    .btn-group{
        margin-top: 20px;
        text-align: right;  
    }

	label {
		padding-left: 10px;
	}
	input, textarea {
		padding: 10px;
		margin: 10px;
	}
	
	.btn-text-right{
        text-align: right;
        width:350px;
        margin-right: 400px;
        }
	
	div.right-content {
	    display: flex;
	    flex-direction: row;
	}
	#result {
		margin-top: 10px;
		display: grid;
		grid-column: 1 / 3;
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

    .btn-primary {
        width: 100px;
        padding: 5px 8px;
        text-decoration: none;
        color: #333;
        background-color: lightgray;
        margin: 20px 0px 15px 0px;
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

    #algorithm_Title{
        font-weight: bold;
    }

    #algorithmContent{
       
        margin:20px 0px 20px 0px;
    }

    #algorithmSolutionContent {
        border: 0px;
        background-color: #e9f3ff;
        width: 100%;
        height: 200px;
        padding: 15px 15px;
        outline: none;
        color: #333;
        resize: none;
    }
    
    #algorithmSolutionContent::placeholder {
        color: #bbb;
    }

    #algorithmSolutionContent:focus::placeholder {
        visibility: hidden;
    }

    .date_wrap {
        display: flex;
        justify-content: space-around;
        align-items: center;
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
    div.errors {
        background-color: #ff00004a;
        opacity: 0.8;
        padding: 10px;
        color: #333;
	}
	div.errors:last-child {
	    margin-bottom: 15px;
	}

    #myAnswer{
        font-weight: bold;
        margin-bottom: 20px;
        width:980px;
    }

    #buttonList{
        display: flex;
        justify-content: right;
        margin-top: 20px;
    }

    #submit-btn{
		border: none;
		width: 200px;
		height: 30px;
        margin-left: 15px;
		border-radius: 5px;
		cursor: pointer; 
    }

    #explanationLink{
        width: 200px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }


    #solution{
        font-weight: bold;
        margin: 0px 0px 15px 15px;    
    }

    #result {
        font-weight: bold;
        margin-bottom: 15px;
    }

    #show_result{
        margin-bottom: 10px;
        border: 1px solid var(--dark-gray);      
    }
    #checkAnswer {
        font-weight: bold;
        margin-top: 15px;
        color: var(--red);
    }
    button {
    border: none;
    padding: 5px;
    border-radius: 5px;
    cursor: pointer;
    }
    
</style>
<body>
    <div class="body_left_aside"></div>
	    <div class="body_container">
            <div class="body">
                <div id="line"></div>
                <div id="question_info">              
                    <label for="algorithmWriter"></label>
                    <div>${algorithmQuestionVO.memberVO.nickname}</div>

                    <label for="algorithmTierId"></label>
                    <div>${algorithmQuestionVO.algorithmTierId}</div>
                    
                    <label for="algorithmCategoryId"></label>
                    <div>${algorithmQuestionVO.commonCodeVO.codeContent}</div>
                </div>
            
                <div id="algorithm_Title">
                    <label for="algorithmTitle"></label>
                    <div>${algorithmQuestionVO.algorithmTitle}</div>
                </div>

                    <label id="algorithmContent" for="algorithmContent"></label>
                    <div class="">${algorithmQuestionVO.algorithmContent}</div>
            
                <div class="flex">
                    <div class="conditions">
                        <h4>제한사항</h4>
                        <div>
                            ${algorithmQuestionVO.algorithmSolution}
                        </div>
                    </div>                   
                    <form:form modelAttribute="myAlgorithmVO" method="post" action="/algorithm/question/view/${companyAlgorithmQuestionId}">	
                        <div>
                            <form:errors path="myAnswer" element="div" cssClass="errors" />
                        </div>
                        <label for="myAnswer"></label> <!-- 웹IDE 테이블에 신규생성? -->
                        <iframe src="/html/webide.html" name="ide" id="ide"></iframe>
                        <textarea name="myAnswer" id="myAnswer" style="display:none;"></textarea>
                    </form:form>
                    <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'GENERAL'}">
                        <div id="result">
                            <label for="showResult">실행 결과</label>
                        </div>
                        <div id="show_result"></div>
                        <c:forEach var="resultItem" items="${result}" varStatus="resultStatus">
                            <ul>
                                <li>테스트 ${resultStatus.index + 1} > ${resultItem}</li>
                                <c:forEach var="codeResultItem" items="${codeResultList}" varStatus="codeResultStatus">
                                    <c:if test="${codeResultStatus.index eq resultStatus.index * 2}">
                                        <c:out value="(${codeResultItem})" />
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:forEach>
                    </c:if>
                    <div id="checkAnswer">${popupMessage}</div>
                    <!-- 일반회원이 로그인 했을 시 -->
                    <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'GENERAL'}">
                        <div id="buttonList">
                            <button id="explanationLink" type="button" onclick="location.href='/algorithm/explanation/list';">알고리즘 해설 보러가기</button>  
                            <button id="submit-btn" >제출 후 채점하기</button>
                        </div>
                    </c:if>
                </div>
                <div class="btn-group">                  
                    <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq algorithmQuestionVO.algorithmWriter}">
                        <a href="/algorithm/question/update/${algorithmQuestionVO.companyAlgorithmQuestionId}">
                            <button class="revise">수정</button>
                        </a>
                        <a href="/algorithm/question/delete/${algorithmQuestionVO.companyAlgorithmQuestionId}">
                            <button class="delete">삭제</button>
                        </a>
                    </c:if>                               
                </div>
            </div>
        </div>
    <div class="body_right_aside"></div>
<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>