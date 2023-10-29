<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(function() {
		
		$.get("/code/알고리즘카테고리", function(response) {
			for (var i = 0; i < response.length; i++) {
				var code = response[i]
				var option = $("<option value='" +code.codeId+"'>"+code.codeContent+"</option>");
				$("#algorithm_category").append(option);
			}
		// 이전에 선택한 select option 불러오기
        $("select[name=algorithmCategoryId]").val("${algorithmExplanationVO.commonCodeVO.codeId}")
		});
	    
	    ClassicEditor.create( document.querySelector( '#editor' ), {
		   language: "ko"
		} );
	    
	    $("").keyup(function() {
	    	$.get("/")
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
</head>
<style>
    .ck-editor__editable { 
        height: 600px; 
    }
    .ck-content { 
        font-size: 12px; 
    }

    #container{
        width:800px;
        height: 1000px; 
        margin: 0 auto;
        margin-top: 40px;
    }

    div.grid {
        display: grid;
        grid-template-columns: 1fr;
        grid-template-rows: 40px 70px 40px 70px 40px 1fr 40px;
    }

    div.grid > div.btn-group {
		display: grid;
        grid-column: 1 / 2;
        margin-top: 12px;
	}

    #algorithm_category{
		height: 40px;	
		transition: box-shadow 0.3s ease;
	}

	#algorithm_category:hover {
   	 	border: 2px solid #1E90FF; 
	}

    div.grid div.right-align {
		text-align: right;
	}

    #postTitle {
        width: 1fr;
        font-size: 12px;
        margin-bottom: 12px;
		height: 40px;
		transition: box-shadow 0.3s ease;
		padding:6px;
    }

	#postTitle:hover{
		border: 2px solid #1E90FF; 
	}

    .grid > .title {
    font-weight: bold;
}

    input {
        padding: 0px;
        margin-bottom: 12px;
    }
    select {
        margin-bottom: 10px;
        margin-right: 10px;
        width: 280px;
    }
    .label {
        margin-top: 10px;
        font-weight: bold;
    }

    .btn-group > .right-align > #submitButton{
        width:80px;
		height:40px;		
		border:none;
		border-radius: 10px;
		cursor: pointer;
        margin-bottom:15px;
		transition: box-shadow 0.1s ease;
    }

    .btn-group > .right-align > #submitButton:hover{
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); 
    }
</style>
<body>
	<div id="container">
	<form:form modelAttribute="algorithmExplanationVO" method="post"
	           action="/algorithm/explanation/update">
               
	    <input type="hidden" name="companyAlgorithmExplanationId" value="${algorithmExplanationVO.companyAlgorithmExplanationId}" />
		<div class="grid">
			<label class="label" for="algorithmCategoryId">알고리즘 카테고리</label>
			<select name="algorithmCategoryId" id="algorithm_category">
				<option value="">알고리즘 카테고리를 선택하세요</option>
			</select>
			<span class="title">제목</span>

			<input id="postTitle" type="text" name="postTitle"
                   value="${algorithmExplanationVO.postTitle}" />
            
            <label class="label" for="postContent">내용</label>
            <textarea name="postContent" id="editor">${algorithmExplanationVO.postContent}</textarea>
			
			<div class="btn-group">
                <div class="right-align">
                    <input id="submitButton" type="submit" value="수정" />
                </div>
            </div>
		</div>
    
	</form:form>
</div>
<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>