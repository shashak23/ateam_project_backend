<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<link rel="preconnect" href="https://fonts.googleapis.com"> 
         <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet"> 
         <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" /> 
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
         <script src="/js/lib/jquery-3.7.1.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/common.css" />
        <jsp:include page="../layout/header.jsp"/>
		
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>	
<style type= "text/css">
	.title_name {
		font-size: 22px;
		margin: 9px 0 6px 0;
		padding-bottom: 16px;
		border-bottom: 1px solid #EEE;
	}
	.temp,
	#write_area {
		display: flex;
		flex-direction: column;
		align-items: baseline;
		margin-bottom: 10px;
	}

	#write_area > label {
		width: 6%;
		font-weight: bold;
		margin: 20px 0 6px 0;
	}
	#write_area > input {
		width: 100%;
		height: 32px;
		border: 1px solid #A2A2A2;
		border-radius: 5px;
	}
	.ck-editor__editable { 
		height: 350px; 
		margin: auto 0;
	}
	.ck-content {
			font-size: 12px; 	
	}
	#bottom_area {
		display: grid;
		grid-template-columns: 80% 20%;
	}
	#button_2 {
		justify-self: end;
		width: 120px;
		height: 40px;
		background-color: var(--blue);
		color: #EAEAEA;
		font-weight: bold;
		font-size: 16px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	.remove_btn {
		cursor: pointer;
		border: none;
		background-color: transparent;
		margin-right: 12px;
	}
	</style>
</head>
<body>
	<div class="body_container">
		<div class="body_left_aside"></div>
		
		<div class="body">
			<h3 class="title_name"> 자유 게시판 게시글 수정 </h3>
			<form method="post" action="/freeboard/update" modelAttribute="generalPostVO" >
				<input type="hidden" name="generalPostId" value="${generalPostVO.generalPostId}"/>
				<div id="write_area">
					<label for="postTitle">제목</label>
					<input id="postTitle" type="text" name="postTitle" value="${generalPostVO.postTitle}"/>
					<label for="postContent">내용</label>
					<textarea id="editor" name="postContent" style="height: 300px;">${generalPostVO.postContent}</textarea>
				</div>	
				<div id="bottom_area">
					<div class="temp"></div>
					<input id="button_2" type="submit" value="저장" />
				</div>
			</form>								
		</div>

		<div class="body_right_aside"></div>
	</div>
	
			<script>
				CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
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
					placeholder: 'Welcome to CKEditor 5!',
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

<script>
// 미완성된 기능을 알려주는 모달창
   $('.incomplete').click(function() {
      $('.modal, .overlay').addClass('modal_active')
   })
   $('.overlay').click(function() {
      $('.modal, .overlay').removeClass('modal_active')
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
</body>
</html>