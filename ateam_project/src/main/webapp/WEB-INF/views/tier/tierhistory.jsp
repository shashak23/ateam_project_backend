<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(function(){
		$("#viewHistory").click(function(){
			var memberEmail = $(this).closest('tr').data('member-email')
			var url = "/admin/tier/view/" + memberEmail
			window.location.href = url;
		})
	})
</script>
<body>
	<h1>일반회원 티어 승인</h1>
	<div class="member_tier_list">
		<table>
		<thead>
			<tr>
				<th>멤버아이디</th>
				<th>점수</th>
				<th>현재티어</th>
				<th>다음티어</th>
				<th>내역조회</th>
				<th>승급처리</th>								
			</tr>
		</thead>
		<tbody id="tierListArea">
			<c:forEach items="${adminTierListVO.adminTierList}" var="tier">
				<tr class="allTierList" data-member-email="${tier.memberEmail}">
					<td>${tier.memberEmail}</td>
					<td>${tier.score}</td>
					<td>${tier.tierVO.tierName}</td>
					<td>${tier.tierVOTemp.tierNameTemp}</td>
					<td><button id="viewHistory">내역조회</button></td>									
					<td>
					<button>승인</button>
					<button>거절</button>
					</td>										
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>