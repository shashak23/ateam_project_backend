<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 문제 수정하기</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(function() {

		// 선택했던 option의 value가 선택되어있음
        $("select[name=algorithmCategoryId]").val("${algorithmQuestionVO.algorithmCategoryId}")
        $("select[name=algorithmTierId]").val("${algorithmQuestionVO.algorithmTierId}")
        
        // option 선택이 바뀌면, 바뀐 값이 들어감
		$("select[name=algorithmCategoryId]").change(function() {
            var category = 
                $("select[name=algorithmCategoryId] option:selected").text();
            $("#algorithmCategoryId").val(category);
        })
        $("select[name=algorithmTierId]").change(function() {
            var tier = 
                $("select[name=algorithmTierId] option:selected").text();
            $("#algorithmTierId").val(tier);
        })
	})
</script>
</head>
<style>
    .ck-editor__editable { 
        height: 400px; 
    }
    .ck-content { 
        font-size: 12px; 
    }

    div.grid {
        display: grid;
        grid-template-columns: 1fr;
        grid-template-rows: 40px 40px 40px 1fr 40px 1fr 1fr;
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
    label {
        margin-top: 10px;
    }
</style>
<body>
	<h3>알고리즘 문제 수정</h3>
	<form:form modelAttribute="algorithmQuestionVO" method="post"
	           action="/algorithm/question/update">
	    <input type="hidden" name="companyAlgorithmQuestionId" value="${algorithmQuestionVO.companyAlgorithmQuestionId}" />
		<div class="grid">
		    
		    <label for="algorithmCategoryId">알고리즘 카테고리</label>
		    <select id="algorithmCategoryId" name="algorithmCategoryId" required="required">
                <option value="">선택하세요</option>
                <option value="수학">수학</option>
                <option value="그리디 알고리즘">그리디 알고리즘</option>
                <option value="배열">배열</option>
                <option value="동적 프로그래밍">동적 프로그래밍</option>
                <option value="해싱">해싱</option>
                <option value="자료구조">자료구조</option>
                <option value="문자열">문자열</option>
                <option value="기타">기타</option>
            </select>
            <label for="algorithmTierId">난이도</label>
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
            
            <input id="email" type="email" name="algorithmWriter" value="test@test" />
            
            <label for="algorithmContent">문제내용</label>
            <textarea name="algorithmContent" id="editor">${algorithmQuestionVO.algorithmContent}</textarea>
            <script>
			    ClassicEditor.create( document.querySelector( '#editor' ), {
			       language: "ko"
			    } );
			</script>
            
            <label for="algorithmSolution">문제풀이</label>
            <textarea name="algorithmSolution" id="editor2">${algorithmQuestionVO.algorithmSolution}</textarea>
            <script>
			    ClassicEditor.create( document.querySelector( '#editor2' ), {
			       language: "ko"
			    } );
			</script>
            
            <div class="btn-group">
                <div class="right-align">
                    <input type="submit" value="수정" />
                </div>
            </div>
        </div>
	</form:form>

</body>
</html>