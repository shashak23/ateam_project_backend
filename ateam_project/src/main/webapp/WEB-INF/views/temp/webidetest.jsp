<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>CodeFlask Test Page</title>
<script src="https://unpkg.com/codeflask/build/codeflask.min.js"></script>
    <style>
    body {
        font-family: Arial;
        margin: 30px;
        background-color: black;
    }
    
    .test {
        background: #eee;
        border-radius: 5px 5px 5px 5px;
    }
    </style>
</head>
<body>
    <button onclick="getCode()">aaa</button>
    <h1 id="header1">Testing below:</h1>

    <div class="test" id="test">
        public class Solution {
            public int solution() {
                return 0;
            }
        }
    </div>
    <script>

        function getCode() {
            console.log(document.querySelector(".codeflask textarea").value)
        }

    const flask = new CodeFlask('.test', {
        language: 'js',
        lineNumbers: true,
        areaId: 'thing1',
        ariaLabelledby: 'header1',
        handleTabs: true
    });
    flask.addLanguage("java", Prism.languages["java"]);
        
    window['flask'] = flask;
        
    const code = flask.getCode()
    
    // $(document).ready(function(){  
    //     console.log(code)
    // })
    

    </script>

</body>
</html>