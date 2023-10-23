<!-- 작성자: 김태현
	 작성일: 23-10-23
	 내용: 공통 자바스크립트를 모아놓은 공간 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

if (pos > 100) {
	scrollProgress.style.display = 'grid'
}
else {
	scrollProgress.style.display = 'none'
}
scrollProgress.addEventListener('click', () => {
	document.documentElement.scrollTop = 0
})
}

window.onscroll = calcScrollValue;
window.onload = calcScrollValue;
</script>
</html>