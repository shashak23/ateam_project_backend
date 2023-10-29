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

   h3{
    margin-left: 22px;
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
    padding:150px;
   }

   #contents_bottom > .coding_test_explanation:hover,
    #contents_bottom > .algorithm_explanation:hover {
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3); 
    }

    #contents_bottom > .algorithm_explanation >.explanation_separate_line{
        display: flex;
        justify-content: center;
        margin-top: 15px;
        font-size:xx-large;
        font-weight: bold;
    }
   
    #ranking1,
    #ranking2,
    #ranking3,
    #ranking4,
    #ranking5   
    {
        display: flex;
        flex-direction: column;
        margin-left: 50px;
        width:700px;
        height:60px;
        border-bottom: 1px solid lightgrey;
        
    }
   
    #question_name{
        display: flex;
        justify-content: center;
        font-weight: bold;
        margin-top: 20px;
        
    }

    .test_name{
        margin-left: 25px;
        margin-top: 20px;
    }

    .line{
        border: 1px solid lightgrey;
        width: 450px;
        margin-left: 25px;
        margin-top: 20px;
    }

    .test_hashtag{
        margin-left: 25px;
        margin-top: 40px;
    }

    .coding_test_explanation_link{
        padding:150px;
    }

    .explanation_img{
        margin: 30px 0px 0px 160px;
    }

    .explanation_separate_line{
        border: 1 solid lightgrey;
    }

</style>

</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
    <div id="body_container">
        <div id="contents_top"> 
            <div class="coding_test_ranking">
                <div id="ranking1"> 
                    <span id="question_name">초고난도 문제 모음 레벨1부터 레벨5까지 완벽 커버</span>
                    <a href="/algorithm/question/view/AQ-20231028-000195"></a>     
                </div>
                <div id="ranking2">
                    <span id="question_name">기업 코딩 테스트 대비 기출 문제</span>
                    <a href="/algorithm/question/view/AQ-20231028-000195"></a>  
                </div>
                <div id="ranking3">
                    <span id="question_name">C++, C언어를 활용한 코딩 테스트</span>
                    <a href="/algorithm/question/view/AQ-20231028-000195"></a>  
                </div>
                <div id="ranking4">
                    <span id="question_name">인공지능과 기계학습 총합본</span>
                    <a href="/algorithm/question/view/AQ-20231028-000195"></a>  
                </div>
                <div id="ranking5">
                    <span id="question_name">2022년 상반기 기업 기출 문제 모음 레벨1부터 레벨5까지 완벽 커버</span>
                    <a href="/algorithm/question/view/AQ-20231028-000195"></a>  
                </div>
                
            </div>
        </div>
        <div id="contents_middle">
            <p> 
                <a href="/algorithm/question/list" class="showalltests">
                    <h3>코딩 테스트 ></h3>
                </a>
            </p>
            <div class="coding_test">
                <div class="test1 incomplete">
                    <div class="test_name">C++, C언어를 활용한 코딩 테스트</div>
                    <div class="line"></div>
                    <div class="test_hashtag">#C++ #자료구조 #알고리즘 #하반기 취업 #bag #그리디</div>
                </div>
                <div class="test2 incomplete">
                    <div class="test_name">인공지능과 기계학습 총합본</div>
                    <div class="line"></div>
                    <div class="test_hashtag">#C++ #강화학습 #지도학습 #outlier처리</div>
                </div>
                <div class="test3 incomplete">
                 
                    <div class="test_name">2022년 상반기 기업 기출 문제 모음 레벨1부터 레벨5까지 완벽 커버</div>
                    <div class="line"></div>
                    <div class="test_hashtag">#LV.1 #LV.2 #LV.5 #기출 모음</div>
                </div>
                <div class="test4 incomplete">
                  
                    <div class="test_name">기업 코딩 테스트 대비 기출 문제</div>
                    <div class="line"></div>
                    <div class="test_hashtag">#C++ #Java #알고리즘 #하반기 취업</div>
                </div>
            </div>
        </div>
        <div id="contents_bottom">
                <button class="coding_test_explanation">
                    <a href="/algorithm/explanation/list" class="coding_test_explanation_link">
                        <h2>코딩 테스트 문제 풀이</h2>
                    </a>
                </button>
                <div class="algorithm_explanation">
                    <img src="/images/알고리즘 해설.png" class="explanation_img">
                    <a href="/algorithm/explanation/list" class="explanation_link"></a>
                    <div class="explanation_separate_line">알고리즘 해설</div>
                </div>            
        </div>
    </div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script>
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