<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해시태그 조회 테스트</title>
<style>
  * {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    background-color: #333;
    color: #ddd;
  }

  .Content {
    border: 1px solid #ccc;
    border-radius: 5px;
    margin: 5px;
    padding: 5px;
  }
  .hashtag_wrap {
    display: flex;
    flex-wrap: wrap;
    width: 300px;
    border: 1px solid #e5e5e5;
    border-radius: 8px;
    margin-bottom: 30px;
  }

  .hashtag_wrap > .hashtag {
    padding: 3px 10px;
    margin: 5px 6px;
    border-radius: 12px;
    border: 0;
    background-color: #75C2F6;
    color: #e5e5e5;
  }

  #codeContent {
    outline: none;
  }
</style>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script>
  $().ready(function() {
    let tag = {}
    let counter = 0

    function addTag(value) {
      tag[counter] = value
      counter++
    }

    function marginTag() {
      return Object.values(tag).filter(function(word) {
        return world !== ''
      })
    }


    $('#create_btn').click(function() {
      let body = {'codeContent': $('#codeContent').val()}
      if ($('#codeContent').val().trim() != '') {
        $.post(
          "/code/create/해시태그",
          body,
          function(response) {
          let result = response.result
          if (result) {
            load_hashtag()
            Swal.fire({
		         	  text: "성공스",
		         	  icon: "success"
		         	});
            $('#codeContent').val('')
          }
          else {
        	  Swal.fire({
	         	  text: "실패스",
	         	  icon: "warning"
	         	});
            console.log($('#codeContent').val())
            console.log(body)
          }
        })
      }
    })

    load_hashtag = function() {
      $('.hashtag_wrap').html('')
      $.get('code/해시태그', function(response) {
        console.log(response.length)
        console.log(response[0].codeContent)
        for (let i = 0; i < response.length; i++) {
          let template = `<div class="Content">
                            \${response[i].codeContent}
                          </div>`
          
          $('.hashtag_wrap').append(template)
        }
      })
    }
    load_hashtag()
  })
</script>
</head>
<body>
  <div>
    해시태그 목록
  </div>
  <div class="hashtag_wrap"></div>
    <label for="codeContent">입력: </label>
    <input type="text" name="codeContent" id="codeContent" />
    <button id="create_btn">생성</button>
</body>
</html>