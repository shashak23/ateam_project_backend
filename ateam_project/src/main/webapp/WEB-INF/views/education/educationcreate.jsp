<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                const facilNameArray = result.facilName.split(', '); // 쉼표로 구분된 항목을 배열로 분리
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
    });
    </script>
</head>
<body>
<form method ="post">
    <h2>대학교 및 학과 검색</h2>

    <div id="university-section">
        <h3>대학교 검색</h3>
        <input type="text" id="search-university-input" name="schoolName" placeholder="대학교 검색">

        <div id="search-university-results">
            <!-- 검색 결과를 여기에 표시할 예정입니다. -->
        </div>
    </div>

    <div id="department-section">
        <h3>학과 검색</h3>
        <input type="text" id="search-department-input" name="schoolDepartment" placeholder="학과 검색">

        <div id="search-department-results">
            <!-- 검색 결과를 여기에 표시할 예정입니다. -->
        </div>
    </div>
      <select id="degree" name="degrees">
        <option value="" disabled selected hidden>선택하세요</option>
        <option value="석사">석사</option>
        <option value="학사">학사</option>
        <option value="박사">박사</option>
    </select>
    <input type="submit" value="저장"/>
</form>
</body>
</html>