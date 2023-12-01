<html>
<head>
	<meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" ref="/node_modules/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/node_modules/font-awesome/css/font-awesome.min.css" />
    <script src="/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/node_modules/jdenticon/dist/jdenticon.min.js"></script>
	
	<!-- 넓이 높이 조절 -->
	<style>
	.ck.ck-editor {
    	max-width: 500px;
	}
	.ck-editor__editable {
	    min-height: 300px;
	}
	</style>
</head>
<body>
    <h3>Classic editor</h3>
    <div id="classic">
        <p>This is some sample content.</p>
    </div>
    <script>
    ClassicEditor
    .create( document.querySelector( '#editor' ), {
        plugins: [ CodeBlock, /* ... */ ],
        toolbar: [ 'codeBlock', /* ... */ ]
    } )
    .then( /* ... */ )
    .catch( /* ... */ );
    </script>
</body>
</html>