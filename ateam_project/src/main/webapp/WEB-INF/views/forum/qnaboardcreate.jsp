<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
	
<!-- 소스 다운 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<style type= "text/css">

	div.grid div.right-align {
		text-align: right;
	}

	label {
		padding-left: 10px; 
		
	}
	
	#write-page > #editor{
	margin-top:10px;
	
	}
	textarea { 
		padding: 10px;
		margin-top:100px;
		width:500px;
		height:500px;
	}
	#write-page > input:first-child {
		
	}
	
	#write-page > input:2th-child(2) {
		position: absolute;
		top:500px;
	}
	.ck-editor__editable { height: 400px; }
    .ck-content { font-size: 12px; }
    
    #write-page > .hash{
    margin-top:50px;
    }

   
    .btn-group {
    width:70px;
    height:70px;
    margin-left:600px;
    }
    
    input{  
	  font: 13px arial;
	  margin:10px;
	}
</style>
<script type="text/javascript">
//해시태그를 저장할 배열
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

 // 추가해야 하는 정보를 객체로 구성
const postData = {
    hashtagid: "hashtagId",
    generalpostid: "generalPostVO.generalPostId",
    postwriter: "generalPostVO.postWriter",
    boardid: "generalPostVO.boardId",
    posttitle: "generalPostVO.postTitle",
    postcontent: "generalPostVO.postContent",
    postdate: "generalPostVO.postDate",
    likecnt: 0,
    viewcnt: 0,
    deleteyn: "N",
    hashtags: hashtagsJSON
}; 

// 변수에 저장
var postTitle = $("#postTitle").val();
var postContent = $(".postContent").val();
var hashtagId= document.getElementById('input[name=hashtagInput]');

console.log(postTitle);
console.log(hashtagId);

// postData 객체를 JSON 문자열로 변환
const dataJSON = JSON.stringify(postData);
// post 전송, 서버 확인 
$.ajax({
    type: "POST",
    url: "/qnaboard/create",
    data: dataJSON,
    contentType: "application/json; charset=utf-8",
    success: function (data, response) {
        console.log("서버 응답:", response);
    },
    error: function (error) {
        console.error("에러 발생:", error);
    }
});
}


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
	
});
</script>
</head>
<body>
	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1> 질답게시판의 작성 페이지</h1>
	<form name="generalPostVO" method = "post">		
		<div id="write-page">
			<label for = "postTitle"> 제목 </label>
			<input id = "postTitle" type = "text" name="postTitle" 
					value="${generalPostVO.postTitle}"/>
			<label for = "postContent"> 내용 </label>
			<textarea name="postContent" id="editor">${generalPostVO.postContent}</textarea>
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
	<div class="hashtag">
	    <input type="text" id="hashtagInput" name="hashtag" placeholder="#해시태그" value="">
	</div>
	<div class="btn-group">
	    <div class="right-align">
	        <input type="button" value="추가" onclick="addHashtag()">
	    </div>
	</div>
	<div id="displayHashtags">
	    <!-- 여기에 해시태그가 표시될 부분 : 어떻게 구현한담? -->
	</div>
			<div class = "btn-group">
				<div class="right-align">
					<input type="submit" value="저장" />
				</div>
			</div>
	</form>
</body>
</html>