<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<script type="text/javascript">
	$().ready(function() {
		
		$.get("/code/알고리즘카테고리", function(response) {
			for (var i = 0; i < response.length; i++) {
				var code = response[i]
				var option = $("<option value='" +code.codeId+"'>"+code.codeContent+"</option>");
				$("#algorithm_category").append(option);
			}
		});
	    
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

<style>
    .ck-editor__editable { 
        height: 520px; 
    }
    .ck-content { 
        font-size: 12px; 
    }
	
	#container{
		width: 800px;
		height:1000px;
		margin: 0 auto;
		margin-top: 40px;
		
	}

    div.grid {
        display: grid;
        grid-template-columns: 1fr;
        grid-template-rows: 40px 70px 40px 70px 40px 1fr 40px;
    }

	.grid > .label{
		font-weight: 600;
	}

	#algorithm_category{
		height: 40px;	
		transition: box-shadow 0.3s ease;
	}

	#algorithm_category:hover {
   	 	border: 2px solid #1E90FF; 
	}

    div.grid > div.btn-group {
		display: grid;
        grid-column: 1 / 2;
        margin-top: 12px;
	}

    div.grid div.right-align {
		text-align: right;
	}

	.grid > .title{
		font-weight: bold;
	}

	.grid > .title::after{
		content:" *";
		color:red;
		font-size: 80%;
	}

	.grid > .label::after{
		content:" *";
		color:red;
		font-size: 80%;
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

	.grid > .btn-group > .right-align > #submitButton{
		background-color: var(--light-blue);
		border: none;
		width: 70px;
		height: 30px;
		border-radius: 5px;
		cursor: pointer;
		/* transition: box-shadow 0.1s ease; */
	}

	/* .grid > .btn-group > .right-align > #submitButton:hover{
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); 
	} */

    div.errors {
	    background-color: #ff00004a;
	    opacity: 0.8;
	    padding: 10px;
	    color: #333;
	}

	div.errors:last-child {
	    margin-bottom: 15px;
	}
</style>
<body>	
	<div id="container">
		<form:form modelAttribute="algorithmExplanationVO" method="post">
			<div>
				<form:errors path="algorithmCategoryId" element="div" cssClass="errors"/>
				<form:errors path="postTitle" element="div" cssClass="errors"/>
				<form:errors path="postContent" element="div" cssClass="errors"/>
			</div>
			<div class="grid">
				
				<label class="label" for="algorithmCategoryId">알고리즘 카테고리</label>
				<select name="algorithmCategoryId" id="algorithm_category">
					<option value="">알고리즘 카테고리를 선택하세요</option>
				</select>
				<span class="title">제목</span>
				
				<input id="postTitle" type="text" name="postTitle" placeholder="제목을 입력해 주세요."
					value="${algorithmExplanationVO.postTitle}" />
				
				<label class="label" for="postContent">내용</label>
				<textarea name="postContent" id="postContent">${algorithmExplanationVO.postContent}</textarea>
				<script>
		    	CKEDITOR.ClassicEditor.create(document.getElementById("postContent"), {
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
	                placeholder: '내용을 입력해주세요.',
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
		        </script>
				<div class="btn-group">
					<div class="right-align">
						<input id="submitButton" type="submit" value="등록" />
					</div>
				</div>
			</div>
		</form:form>
	</div>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>