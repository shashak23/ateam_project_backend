<!-- 작성자: 남현욱
     작성일자: 2023-10-26
     내용: 알고리즘 메인 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 홈 | DevGround</title>
<style type="text/css">
    #body_container{
    width: 1100px;
    height: 1300px;
    margin: 0 auto;
    }

   #contents_top{
   width:1080px; 
   display:flex; 
   justify-content: center;
   margin-top: 40px;
   }

   #contents_top > .coding_test_ranking{
    width:800px;
    height: 300px; 
    border: 1px solid var(--gray);
	border-radius: 5px;
    cursor: pointer;
   }

   /* #contents_top > .coding_test_explanation{
    width:450px;
    height:300px;
    cursor: pointer;
    border: 1px solid var(--gray);
		border-radius: 5px;
        margin-left: 30px;
   } */

   #contents_middle{
    margin-top: 40px;
    width:1080px;
    height:500px;
   }

   #contents_middle > .showalltests{
    width:80px;
    height:40px;
    cursor: pointer;
   
   }

   #contents_middle > .coding_test{
    width:1080px;
    height:500px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 1fr 1fr;
    
   }

    .test1,
    .test2,
    .test3,
    .test4 {
    border: 1px solid var(--gray);
	border-radius: 5px;
    cursor: pointer;
    margin:20px;
    transition: box-shadow 0.3s ease;
    }

    .test1:hover,
    .test2:hover,
    .test3:hover,
    .test4:hover {
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

    .company_one_name,
    .company_two_name,
    .company_three_name,
    .company_four_name {
        width: 250px;
        height: 60px;
        cursor: pointer;
	    border-radius: 5px;
        margin:10px;
        font-size: large;
        font-weight: bold;
    }

    .test_name{
        font-weight: bold;
    }

   #contents_bottom{
    width:1080px;
    display:flex;
    justify-content: center;
    margin-top: 50px;
   }

   #contents_bottom > .coding_test_explanation{
    width: 500px;
    height: 300px;
    border: 1px solid var(--gray);
	border-radius: 5px;
    cursor: pointer;
    box-sizing: border-box;
    transition: box-shadow 0.3s ease;
    padding:140;
   }

   #contents_bottom > .algorithm_explanation{
    width: 500px;
    height: 300px;
    margin-left: 30px;
    cursor: pointer;
    border: 1px solid var(--gray);
	border-radius: 5px;
    box-sizing: border-box;
    transition: box-shadow 0.3s ease;
   }

   #contents_bottom > .algorithm_explanation > .explanation_link{
    width: 500px;
    height: 300px;
    margin:100px;
    padding: 100px 100px 0px 100px;
    box-sizing: border-box;
   }

   #contents_bottom > .coding_test_explanation:hover,
    #contents_bottom > .algorithm_explanation:hover {
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3); 
    }
   

</style>

</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
    <div id="body_container">
        <div id="contents_top"> 
            <div class="coding_test_ranking incomplete">랭킹(삭제여부)</div>
        </div>
        <div id="contents_middle">
            <p> 
                <a href="/algorithm/question/list" class="showalltests">
                    <h3>코딩 테스트 ></h3>
                </a>
            </p>
            <div class="coding_test">
                <div class="test1 incomplete">
                    <span class="company_one_name">회사명
                        <a href=""></a>
                    </span>
                    <div class="test_name">문제명</div>
                    <div class="test_hashtag">문제 해시태그</div>
                </div>
                <div class="test2 incomplete">
                    <span class="company_two_name">회사명
                        <a href=""></a>
                    </span>
                    <div class="test_name">문제명</div>
                    <div class="test_hashtag">문제 해시태그</div>
                </div>
                <div class="test3 incomplete">
                    <span class="company_three_name">회사명
                        <a href=""></a>
                    </span>
                    <div class="test_name">문제명</div>
                    <div class="test_hashtag">문제 해시태그</div>
                </div>
                <div class="test4 incomplete">
                    <span class="company_four_name">회사명
                        <a href=""></a>
                    </span>
                    <div class="test_name">문제명</div>
                    <div class="test_hashtag">문제 해시태그</div>
                </div>
            </div>
        </div>
        <div id="contents_bottom">
                <button class="coding_test_explanation incomplete">
                    <a href="/algorithm/explanation/list" class="coding_test_explanation_link">코테 문제풀이</a>
                </button>
                <div class="algorithm_explanation">
                    <img src="/images/알고리즘" alt="알고리즘 해설.png" class="알고리즘 해설">
                    <a href="/algorithm/explanation/list" class="explanation_link">
                    </a>
                </div>            
        </div>
    </div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
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

       // 랭킹 컨텐츠

    // 월요일마다 갱신함
    const today = new Date()
    const currentDay = today.getDay() // (0: 일요일, 1:월요일)
    const targetDay = 0
    const daysAfterTargetDay = currentDay - targetDay

    const prevMonday = new Date(today)
    prevMonday.setDate(today.getDate() - daysAfterTargetDay + 1)
    
    const year = prevMonday.getFullYear()
    const month = String(prevMonday.getMonth() + 1).padStart(2, '0')
    const day = String(prevMonday.getDate()).padStart(2, '0')

    const formattedMonday = year + '-' + month + '-' + day

    $.get('/home/ranking/\${formattedMonday}', function(response) {
      let list = response.rankings
      for (let i = 0; i < 10; i++) {

        if (list[i].boardId === 'CC-20231017-000029') {
          let ranking_template = `
            <li class="hot_post">
            <a href="/freeboard/view/\${list[i].generalPostId}" target="_blank"" class="incomplete">\${list[i].postTitle}</a>
            </li>`
          let ranking_templateDom = $(ranking_template)
  
          $('.ranking_list').append(ranking_templateDom)
        }
        else {
          let ranking_template = `
            <li class="hot_post">
            <a href="/qnaboard/view/\${list[i].generalPostId}" target="_blank" class="incomplete">\${list[i].postTitle}</a>
            </li>`
          let ranking_templateDom = $(ranking_template)
  
          $('.ranking_list').append(ranking_templateDom)
        }
      }
    })
</script>
</html>