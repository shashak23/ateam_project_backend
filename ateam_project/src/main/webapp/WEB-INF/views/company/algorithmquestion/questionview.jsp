<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
    $().ready(function() {
    	
    	CKEDITOR.ClassicEditor.create(document.getElementById("myAnswer"), {
            // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
            toolbar: {
                items: [
                    'exportPDF','exportWord', '|',
                    'findAndReplace', 'selectAll', '|',
                    'heading', '|',
                    'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                    'bulletedList', 'numberedList', 'todoList', '|',
                    'outdent', 'indent', '|',
                    'undo', 'redo',
                    '-',
                    'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                    'alignment', '|',
                    'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                    'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                    'textPartLanguage', '|',
                    'sourceEditing'
                ],
                shouldNotGroupWhenFull: true
            },
            // Changing the language of the interface requires loading the language file using the <script> tag.
            // language: 'es',
            list: {
                properties: {
                    styles: true,
                    startIndex: true,
                    reversed: true
                }
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
            heading: {
                options: [
                    { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                    { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                    { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                    { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                    { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                    { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                    { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                ]
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
            placeholder: '답변을 입력해주세요.',
            // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
            fontFamily: {
                options: [
                    'default',
                    'Arial, Helvetica, sans-serif',
                    'Courier New, Courier, monospace',
                    'Georgia, serif',
                    'Lucida Sans Unicode, Lucida Grande, sans-serif',
                    'Tahoma, Geneva, sans-serif',
                    'Times New Roman, Times, serif',
                    'Trebuchet MS, Helvetica, sans-serif',
                    'Verdana, Geneva, sans-serif'
                ],
                supportAllValues: true
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
            fontSize: {
                options: [ 10, 12, 14, 'default', 18, 20, 22 ],
                supportAllValues: true
            },
            // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
            // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
            htmlSupport: {
                allow: [
                    {
                        name: /.*/,
                        attributes: true,
                        classes: true,
                        styles: true
                    }
                ]
            },
            // Be careful with enabling previews
            // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
            htmlEmbed: {
                showPreviews: true
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
            link: {
                decorators: {
                    addTargetToExternalLinks: true,
                    defaultProtocol: 'https://',
                    toggleDownloadable: {
                        mode: 'manual',
                        label: 'Downloadable',
                        attributes: {
                            download: 'file'
                        }
                    }
                }
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
            mention: {
                feeds: [
                    {
                        marker: '@',
                        feed: [
                            '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                            '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                            '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                            '@sugar', '@sweet', '@topping', '@wafer'
                        ],
                        minimumCharacters: 1
                    }
                ]
            },
            // The "super-build" contains more premium features that require additional configuration, disable them below.
            // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
            removePlugins: [
                // These two are commercial, but you can try them out without registering to a trial.
                // 'ExportPdf',
                // 'ExportWord',
                'CKBox',
                'CKFinder',
                'EasyImage',
                // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                // Storing images as Base64 is usually a very bad idea.
                // Replace it on production website with other solutions:
                // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                // 'Base64UploadAdapter',
                'RealTimeCollaborativeComments',
                'RealTimeCollaborativeTrackChanges',
                'RealTimeCollaborativeRevisionHistory',
                'PresenceList',
                'Comments',
                'TrackChanges',
                'TrackChangesData',
                'RevisionHistory',
                'Pagination',
                'WProofreader',
                // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                // from a local file system (file://) - load this site via HTTP server if you enable MathType
                'MathType'
            ]
        });

        // 모달 실행을 위한 문장
        $('.btn-primary').click(function() {
            $('.create_container, .overlay').addClass('active')
        })
        $('.btn-close, .overlay').click(function() {
            $('.create_container, .overlay').removeClass('active')
        })
        
        $("#submit-btn").click(function() {
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
</head>
<style>
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

    #container{
        width:1000px;
        margin: 0 auto;
        margin-top: 40px;
    }

    #question_info{
    display: flex;
    margin-bottom: 10px;    
    }

    
    #line{
        border: 1px solid var(--light-gray);
        width: 350px;
    }

	/* div.grid {
		display: grid;
		grid-template-columns: 150px 1fr;
		grid-template-rows: 28px 28px 28px 28px 1fr 50px 28px 1fr 28px 320px;
		row-gap: 10px;
	} */
	div.flex {
		display: flex;
		flex-direction: column;
		width: 1000px;
	}
	div.grid > div.btn-group {
		display: grid;
		grid-column: 1/ 3;
	}
	div.grid div.right-align {
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
	
	.btn-primary {
        margin: 30px 15px;
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

    .btn-primary, a {
        padding: 5px 8px;
        text-decoration: none;
        color: #4052f7;
        background-color: #d0eaff;
        margin-right: 15px;
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

    #submit-btn{
        background-color: var(--light-blue);
		border: none;
		width: 150px;
		height: 30px;
		border-radius: 5px;
		cursor: pointer;
        margin: 20px 0px 20px 850px;
    }

    #solution{
        font-weight: bold;
        margin: 0px 0px 15px 15px; 
       
    }

    #result{
        font-weight: bold;
        margin-bottom: 15px;
    }

    #show_result{
        width:1000px;
        
        border: 1px solid var(--dark-gray);
        
       
    }
    .btn-group {
    	margin-top: 10px;
    	margin-bottom: 10px;
    }
</style>
<body>
    
	<div id="container">
        
            <div id="question_info">
                
                <label for="algorithmWriter"></label>
                <div>${algorithmQuestionVO.memberVO.nickname}</div>

                <label for="algorithmTierId"></label>
                <div>${algorithmQuestionVO.algorithmTierId}</div>
                
                <label for="algorithmCategoryId"></label>
                <div>${algorithmQuestionVO.commonCodeVO.codeContent}</div>

            </div>
            <div id="line"></div>
            <div id="algorithm_Title">
                <label for="algorithmTitle"></label>
                <div>${algorithmQuestionVO.algorithmTitle}</div>
            </div>
            
            
                <label id="algorithmContent" for="algorithmContent"></label>
                <div>${algorithmQuestionVO.algorithmContent}</div>
          
            <div class="flex">
            
                <div class="btn-text-right">
                    <button class="btn btn-primary">제한사항</button>
                    <a href="/algorithm/explanation/list">알고리즘 해설 보러가기</a>
                </div>
                
                <form:form modelAttribute="myAlgorithmVO" method="post" action="/algorithm/question/view/${companyAlgorithmQuestionId}">	
                    <div>
                        <form:errors path="myAnswer" element="div" cssClass="errors" />
                    </div>
                    <label for="myAnswer"></label> <!-- 웹IDE 테이블에 신규생성? -->
                    <textarea name="myAnswer" id="myAnswer">${algorithmQuestionVO.defaultCode}</textarea>
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
                  <!-- 일반회원이 로그인 했을 시 -->
                  <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'GENERAL'}">
                    <button id="submit-btn" >제출 후 채점하기</button>
                  </c:if>
                <div id="checkAnswer">${popupMessage}</div>
            </div>
        
        <div class="grid">
            
            <div class="btn-group">
                    <div class="right-align">
                        <!-- 로그인 하지 않았을 때 -->
                        <c:if test="${empty sessionScope._LOGIN_USER_}">
                            <a href="/member/auth">로그인하기</a>
                        </c:if>
                        <!-- 해당 게시글을 작성한 기업회원이 로그인 했을 시 -->
                        <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq algorithmQuestionVO.algorithmWriter}">
                            <a href="/algorithm/question/update/${algorithmQuestionVO.companyAlgorithmQuestionId}">수정</a>
                            <a href="/algorithm/question/delete/${algorithmQuestionVO.companyAlgorithmQuestionId}">삭제</a>
                        </c:if>
                        
                    </div>
            </div>
        </div>
        
        <div class="create_container">
            <div class="btn-close">&times;</div>
            <h1 class="create_title">제한 사항</h1>
            <div>
                ${algorithmQuestionVO.algorithmSolution}
            </div>
        </div>
        <div class="overlay"></div>
    </div>
<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>