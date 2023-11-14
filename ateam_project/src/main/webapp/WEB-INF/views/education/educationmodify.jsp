<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri ="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .school_errors,
 .department_errors {
	opacity: 0.8;
	padding: 10px;
	color: red;
	font-size: 10pt;
  
}
</style>
<script src="/js/lib/jquery-3.7.1.js"></script>
     <script type="text/javascript">
         $().ready(function() {
        	 
        const universityApiUrl = `https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=8a2e49c8c985107112055a268b321623&svcType=api&svcCode=SCHOOL&contentType=json&gubun=univ_list&perPage=10000`;
         const departmentApiUrl = `https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=8a2e49c8c985107112055a268b321623&svcType=api&svcCode=MAJOR&contentType=json&gubun=high_list&perPage=9999`;
        let universities = [];
        let departments = [];

        // API를 호출하여 대학교 정보 가져오기
        $.ajax({
            url: universityApiUrl,
            dataType: 'json',
            success: function(data) {
                universities = data.dataSearch.content;

                // 중복된 대학교 이름 필터링
                const uniqueUniversities = [...new Set(universities.map(university => university.schoolName))];

                // 검색창에서 텍스트 입력 시 대학교 검색 결과 업데이트
                $('#search-university-input').on('input', function() {
                    const searchText = $(this).val().toLowerCase();
                    const searchResults = uniqueUniversities.filter(universityName => universityName.toLowerCase().includes(searchText));
                    // 대학교 검색 결과를 화면에 표시
                    displayUniversitySearchResults(searchResults);
                });
            }
        });

       // API를 호출하여 학과 정보 가져오기
        $.ajax({
            url: departmentApiUrl,
            dataType: 'json',
            success: function(data) {
                departments = data.dataSearch.content;
                // 학과 검색창에서 텍스트 입력 시 학과 검색 결과 업데이트
                $('#search-department-input').on('input', function() {
                    const searchText = $(this).val().toLowerCase();
                    const searchResults = departments.filter(department => department.facilName.toLowerCase().includes(searchText));
                    // 학과 검색 결과를 화면에 표시
                    displayDepartmentSearchResults(searchResults);
                });
            },
        });

        // 대학교 검색 결과를 표시하는 함수
        function displayUniversitySearchResults(results) {
            const searchResultsContainer = $('#search-university-results');
            searchResultsContainer.empty();
            results.forEach(result => {
            	searchResultsContainer.append(`<p class='result-item university' data-name='\${result}'>\${result}</p>`);
            });

            // 대학교 검색 결과 항목을 클릭했을 때 해당 대학이 검색 창에 나타남
            $('.result-item.university').click(function() {
                const selectedUniversityName = $(this).data('name');
                $('#search-university-input').val(selectedUniversityName);
                searchResultsContainer.empty();
            });
        }

     // 학과 검색 결과를 표시하는 함수
        function displayDepartmentSearchResults(results) {
            const searchResultsContainer = $('#search-department-results');
            searchResultsContainer.empty();

            results.forEach(result => {
                const facilNameArray = result.facilName.split(', ');
                facilNameArray.forEach(facil => {
                    	searchResultsContainer.append(`<p class="result-item department" data-name="\${facil}">\${facil}</p>`);
                });
            });

            // 학과 검색 결과 항목을 클릭했을 때 선택한 학과를 검색 창에 설정
            $('.result-item.department').click(function() {
                const selectedDepartment = $(this).data('name');
                $('#search-department-input').val(selectedDepartment);
                searchResultsContainer.empty();
            });
        }
        $("#search-university-input").click(function() {
    	      $("div.school_errors").hide();
    	  });
    	
    	  $("#search-department-input").click(function() {
    	      $("div.department_errors").hide();
    	  });
    });
    </script>
<style type="text/css">
.companyName_errors,
.jobTitle_errors,
.hireDate_errors {
	opacity: 0.8;
	padding: 10px;
	color: red;
	font-size: 10pt;
  
}
</style>
</head>
<body>
<form:form modelAttribute="educationVO" method ="post" action="/memberInfo/modify/update-education">
<input type="hidden" name="educationId" value="${educationVO.educationId}" />
    <h2>대학교 및 학과 검색</h2>

    <div id="university-section">
        <h3>대학교 검색</h3>
        <input type="text" id="search-university-input" name="schoolName" value="${educationVO.schoolName}" placeholder="대학교 검색">
		<form:errors path="schoolName" element="div" cssClass="school_errors" />
        <div id="search-university-results">
            <!-- 지우면 안됩니다 -->
        </div>
    </div>

    <div id="department-section">
        <h3>학과 검색</h3>
        <input type="text" id="search-department-input" name="schoolDepartment" value="${educationVO.schoolDepartment}" placeholder="학과 검색">
		<form:errors path="schoolDepartment" element="div" cssClass="department_errors" />
        <div id="search-department-results">
            <!-- 검색 결과를 여기에 표시할 예정입니다. -->
        </div>
    </div>
     <select id="degree" name="degrees" required>
        <option value="${educationVO.degrees}" disabled selected hidden>선택하세요</option>
        <option value="석사" >석사</option>
        <option value="학사">학사</option>
        <option value="박사">박사</option>
    </select>
    <input type="submit" value="저장"/>
    <a href="/memberInfo/modify/delete-education/${educationVO.educationId}">삭제</a>
</form:form>
</body>
</html>