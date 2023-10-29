<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script src="/js/Table.js"></script>
<script type="text/javascript">
	$().ready(function() {

		ClassicEditor.create( document.querySelector( '#algorithmSolution' ), {
		       language: "ko"
		    } );
		ClassicEditor.create( document.querySelector( '#algorithmContent' ), {
		       language: "ko"
		    } );
		ClassicEditor.create( document.querySelector( '#defaultCode' ), {
		      language: "ko"
		   } );
		// 알고리즘카테고리 리스트 보여주기
		$.get("/code/알고리즘카테고리", function(response) {
			for (var i = 0; i < response.length; i++) {
				var code = response[i]
				var checkbox = $("<input type='checkbox' id='"+code.codeId+"' name='algorithmCategoryIdList' value='"+code.codeId+"' />");
				$("#algorithm_category").append(label);
				$("#algorithm_category").append(checkbox);
				var label = $("<label for='"+code.codeId+"'>"+code.codeContent+"</label>");
			}
			
			$.get("/algorithm/category/${algorithmQuestionVO.companyAlgorithmQuestionId}", function(categoryResponse) {
				console.log(categoryResponse)
				
				for (var i = 0; i < categoryResponse.length; i++) {
					var code = categoryResponse[i]
					$("input[name=algorithmCategoryIdList][value="+code.algorithmCategoryId+"]").prop("checked", true);
				}
			});
			
		});
		
		const table = new Table("grid", 5, ["A", "B", "C", "D", "E"])
        table.view($, "#table-div");

        $("#add-row").click(function(event) {
        	event.preventDefault()
            table.addRow($, "#grid")
        })

        $("#add-col").click(function(event) {
        	event.preventDefault()
            table.addColumn($, "#grid", "F")
        })

        $("#submit-btn").click(function(event) {
        	event.preventDefault()
        	let json = table.toJson($, "#grid")
        	$("#answerJson").val(JSON.stringify(json));
        	$("#algorithmQuestionVO").submit();
        })
        
		// 이전에 선택한 select option 불러오기
        $("select[name=algorithmTierId]").val("${algorithmQuestionVO.algorithmTierId}")
        
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
        /* height: 1000px;  */
        margin: 0 auto;
        margin-top: 40px;
    }

    div.grid {
        display: grid;
        grid-template-columns: 1fr;
        grid-template-rows: 60px 40px 60px 40px 60px 60px 1fr 60px 1fr;
    }

    div.grid > div.btn-group {
		display: grid;
        grid-column: 1 / 2;
        margin-top: 12px;
	}

    div.grid div.right-align {
		text-align: right;
	}

    #postTitle {
        width: 1fr;
        font-size: 12px;
        margin-bottom: 12px;
    }
    input {
        padding: 0px;
        margin-bottom: 12px;
    }
    .label {
        margin-top: 10px;
        font-weight: bold;
    }

    .label::after{
		content:" *";
		color:red;
		font-size: 80%;
	}
    select {
        margin-bottom: 10px;
        margin-right: 10px;
        width: 280px;
    }

    #add-row,
    #add-col{
        width:80px;
		height:40px;		
		border:none;
		border-radius: 10px;
		cursor: pointer;
        margin-right:20px;
        transition: box-shadow 0.3s ease;
    }

    #add-row {
        margin-right: 10px; 
    }
    
    #add-row:hover,
    #add-col:hover{  
        border: 2px solid #1E90FF; 
    }

    #testData{
        font-weight: bold;
    }

    #submit-btn{
        width:80px;
		height:40px;		
		border:none;
		border-radius: 10px;
		cursor: pointer;
        margin-bottom: 30px;
		transition: box-shadow 0.1s ease;
    }

    #submit-btn:hover{
        border: 2px solid #1E90FF; 
    }

    #add-btn{
        display: flex;   
    }

</style>
<body>
	<div id="container">
	<form:form modelAttribute="algorithmQuestionVO" method="post"
	           action="/algorithm/question/update">
	    <input type="hidden" name="companyAlgorithmQuestionId" value="${algorithmQuestionVO.companyAlgorithmQuestionId}" />
		<div class="grid">
		    <label class="label" for="algorithmCategoryIdList">알고리즘 카테고리</label>
		    <div id="algorithm_category"></div>
		    
            
            <label class="label" for="algorithmTierId">난이도</label>
		    <select id="algorithmTierId" name="algorithmTierId" required="required">
                <option value="">선택하세요 (난이도최하:1 / 난이도최상:5)</option>
                <option value="Lv.1">Lv.1</option>
                <option value="Lv.2">Lv.2</option>
                <option value="Lv.3">Lv.3</option>
                <option value="Lv.4">Lv.4</option>
                <option value="Lv.5">Lv.5</option>
            </select>
		    
            <input id="algorithmTitle" type="text" name="algorithmTitle"
                   value="${algorithmQuestionVO.algorithmTitle}" />
            
            <label class="label" for="algorithmContent">문제내용</label>
            <textarea name="algorithmContent" id="algorithmContent">${algorithmQuestionVO.algorithmContent}</textarea>
            
            <label class="label" for="algorithmSolution">문제풀이</label>
            <textarea name="algorithmSolution" id="algorithmSolution">${algorithmQuestionVO.algorithmSolution}</textarea>
            
            <label class="label" for="defaultCode">기본 제공 코드</label>
            <textarea id="defaultCode" name="defaultCode" >${algorithmQuestionVO.defaultCode}</textarea>
            
            <label id="testData">테스트 데이터</label>
		    <div id="table-div"></div>
            <div id="add-btn">
                <button id="add-row">행 추가</button>
                <button id="add-col">열 추가</button>
            </div>
            <input type="hidden" name="content" id="answerJson"/>
            <div class="btn-group">
                <div class="right-align">
                    <button id="submit-btn">저장</button>
                </div>
            </div>
        </div>
	</form:form>
</div>
<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>