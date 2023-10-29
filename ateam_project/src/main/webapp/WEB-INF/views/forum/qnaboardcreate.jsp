<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri ="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Buffer Overflow</title>
         <link rel="preconnect" href="https://fonts.googleapis.com"> 
         <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet"> 
         <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" /> 
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
         <script src="/js/lib/jquery-3.7.1.js"></script> 
         <link rel="stylesheet" href="/css/style.css"> 
        <jsp:include page="../layout/header.jsp"/>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
const viewCountElement = document.getElementById('viewCount');

const postId = freeboard.generalPostId; // 게시물의 고유 ID (예시로 대입)

// 서버로부터 조회수 업데이트 정보를 가져옵니다.
function updateViewCount() {
	fetch(`/updateViewCount?postId=${postId}`, {
		method: 'GET'
	})
	.then(response => response.json())
	.then(data => {
		// 업데이트된 조회수를 가져와서 화면에 표시합니다.
		viewCountElement.textContent = data.viewCount;
	})
	.catch(error => {
		console.error('에러 발생:', error);
	});
}

// 페이지 로딩 시 초기 조회수 업데이트를 수행합니다.
updateViewCount();

// 페이지 뷰 시 매번 업데이트하는 대신, 필요한 이벤트(예: 게시물 뷰)에서 호출하세요.
// updateViewCount();
});

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
	
<!-- 소스 다운 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<style type= "text/css">
	#title_controller {
		margin-left: 5px;
	}
	.seperate-line {
		border: 1px solid #ccc;
		
		
		margin: 10px 0px 7px 0px;
	}
	

	div.grid div.right-align {
		text-align: right;
	}

	label {
		padding-left: 10px; 
		
	}
	
	
	.ck-editor__editable { 
		height: 400px; 
	    width: 1000px;
	}
    .ck-content { font-size: 12px; }

	.btn-group {
    position: relative;
    right: 880px;
    top: 120px;
    
}
.add_button ,.save_button {
	position: relative;
	left: 5px;
	background-color:#75c2f6;
	border: none;
	width: 70px;
	height: 30px;
	border-radius: 5px;

}


    
    input{  
	  font: 13px arial;
	  margin:10px;
	}
	#write-page {
		margin-top: 20px;
		width: 1030px;
		height: 500px;
	}
	.hashtag {
		position: relative;
		top: 100px;
	}

	
</style>
<script type="text/javascript">
$().ready(function(){
	var input = document.querySelector('input[name=hashtag]')
    var tagify = new Tagify(input, {
        
    	whitelist : ["Python","Java","Oracle","React","Vue.js","C","JavaScript", "CSS", "HTML", "Spring", "Rudy", "MYSQL", "jQuery", "Angular", "C++"],
    	maxTags: 15,
    	enforceWhitelist: true,
    	
    })
	
	// 폼 제출 이벤트 처리
	$(".hashtag").submit(function(e) {
        e.preventDefault(); // 폼 기본 동작 막기

    });
	// 해시태그를 저장할 배열
    const hashtagsArray = [];

    // 해시태그 추가 버튼 클릭 이벤트 핸들러
    function addHashtag() {
        const hashtagInput = document.getElementById("hashtagInput");
        const hashtag = hashtagInput.value;

        if (hashtag.trim() !== "") {
            // 중복 해시태그 체크 (중복일 경우 추가하지 않음)
            if (!hashtagsArray.includes(hashtag)) {
                hashtagsArray.push(hashtag);
                displayHashtags();
            }
        }

        // 입력 필드 초기화
        hashtagInput.value = "";
    }

    // 해시태그 배열을 화면에 표시
    function displayHashtags() {
        const displayHashtagsDiv = document.getElementById("displayHashtags");
        displayHashtagsDiv.innerHTML = "";

        for (const hashtag of hashtagsArray) {
            const hashtagSpan = document.createElement("span");
            hashtagSpan.className = "hashtag-display";
            hashtagSpan.textContent = hashtag;

            const removeButton = document.createElement("button");
            removeButton.textContent = "X";
            removeButton.addEventListener("click", function () {
                removeHashtag(hashtag);
            });

            hashtagSpan.appendChild(removeButton);
            displayHashtagsDiv.appendChild(hashtagSpan);
        }
    }

    // 해시태그 삭제 버튼 클릭 이벤트 핸들러
    function removeHashtag(hashtag) {
        const index = hashtagsArray.indexOf(hashtag);
        if (index > -1) {
            hashtagsArray.splice(index, 1);
            displayHashtags();
        }
    }

    // 저장 버튼 클릭 이벤트 핸들러
    function saveHashtags() {
        // hashtagsArray를 JSON 문자열로 변환
        const hashtagsJSON = JSON.stringify(hashtagsArray);

        // hashtagsJSON을 서버로 전송 (AJAX 등을 사용)
        // 이때, 서버 컨트롤러에서 JSON 문자열을 파싱하여 처리

        // 예시: AJAX로 서버로 데이터 전송 (jQuery 사용)
        $.ajax({
            type: "POST",
            url: "/hashtag/post", // 서버의 엔드포인트 URL로 변경
            data: hashtagsJSON,
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                // 서버 응답에 따른 동작
                console.log("서버 응답:", response);
            },
            error: function (error) {
                // 오류 처리
                console.error("에러 발생:", error);
            }
        });
    }
});


</script>
</head>
<body>
	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1 id="title_controller"> QnA 작성 페이지</h1>
	<div class="seperate-line"></div>
	<form name="generalPostVO" method = "post">		
		<div id="write-page">
			<div class="postTitle_controller">
			<label for = "postTitle"> 제목 </label>
			<input type = "text" name="postTitle" 
					value="${generalPostVO.postTitle}"/>
			</div>		
			<label id="post_position" for = "postContent"> 내용 </label>
			<textarea  name="postContent" id="editor">${generalPostVO.postContent}</textarea>
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
		</div>
	</form>
	<div class="hashtag">
	    <input type="text" id="hashtagInput" name="hashtag" placeholder="#해시태그">
	</div>
	<div class="btn-group">
	    <div class="right-align">
	        <input class="add_button" type="button" value="추가" onclick="addHashtag()">
	        <input class="save_button"type="button" value="저장" onclick="saveHashtags()">
	    </div>
	</div>
	<div id="displayHashtags">
	    <!-- 여기에 해시태그가 표시될 부분 : 어떻게 구현한담? -->
	</div>
</body>
</html>