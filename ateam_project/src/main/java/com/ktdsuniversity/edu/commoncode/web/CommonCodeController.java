/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 		 김태현(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 조회 화면을 보여주고 처리하는 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.web;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktdsuniversity.edu.commoncode.service.CommonCodeService;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;

@Controller
public class CommonCodeController {
	@Autowired
	private CommonCodeService commonCodeService;
	
	@GetMapping("/code/{codeName}")
	@ResponseBody
	public List<CommonCodeVO> searchCode(@PathVariable String codeName) {
		return commonCodeService.search(codeName);
	}
	
	/**
	 * 공통 코드를 생성하는 API입니다. 
	 * 중복된 값은 생성하지 않습니다. 한 개만 넣었는데 그게 중복인 경우에는 실패로 나옵니다.
	 * @param codeName 공통코드의 타입 예) 해시태그, 알고리즘카테고리 등
	 * @param commonCodeVO 코드에 삽입할 컨텐츠입니다.
	 * @return 성공하면 true를 반환하고, 실패하면 false를 반환합니다. 
	 */
	@PostMapping("/code/create/{codeName}")
	@ResponseBody
	public Map<String, Object> createCommonCode(@PathVariable String codeName,
										 @ModelAttribute CommonCodeVO commonCodeVO) {
		Map<String, Object> resultMap = new HashMap<>();
		
		// 보내준 코드 리스트를 받아오기
		List<CommonCodeVO> originCommonCodeList = commonCodeService.search(codeName);
		
		// Set을 이용해 중복된 값을 제거하기
		String[] newCommonContentArr = commonCodeVO.getCodeContent().split(" ");
		
		Set<String> newCommonContentSet = new HashSet<>();
		for (String str : newCommonContentArr) {
			newCommonContentSet.add(str);
		}
		for (String string : newCommonContentSet) {
			System.out.println(string);
		}
		int count = 0;
		boolean isExist = false;
		boolean isSuccess = false;
		
		for (String newContents : newCommonContentSet) {
			for (CommonCodeVO originContents : originCommonCodeList) {
				if(newContents.equals(originContents.getCodeContent())) {
					count++;
					isExist = true;
					break;
				}
			}
			if (!isExist) {
				commonCodeVO.setCodeType(codeName);
				commonCodeVO.setCodeContent(newContents);
				isSuccess = commonCodeService.createCommonCode(commonCodeVO);
				
				if (isSuccess) {
					count++;
				}
			}
			isExist = false;
		}
		
		if (count == newCommonContentSet.size()) {
			resultMap.put("result", isSuccess);
			return resultMap;
		}
		else {
			resultMap.put("result", false);
			return resultMap;
		}
	}
	
	@GetMapping("/testpage")
	public String testMethod() {
		return "temp/hashtagselect";
	}
}
