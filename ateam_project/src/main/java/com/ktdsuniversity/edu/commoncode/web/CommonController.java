package com.ktdsuniversity.edu.commoncode.web;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.commoncode.servicee.CommonService;
import com.ktdsuniversity.edu.commoncode.vo.CommonListVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonVO;

@Controller
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	@GetMapping("/home/hashtaglist")
	public ModelAndView viewHashtagList() {
		ModelAndView mav = new ModelAndView();
		CommonListVO commonListVO = commonService.getAllHashtag();
		mav.setViewName("temp/hashtagselect");
		mav.addObject("commonListVO", commonListVO);
		
		return mav;
	}
	
	@PostMapping("/home/hashtaglist")
	public ModelAndView createHashtag(@ModelAttribute CommonVO commonVO) {
		ModelAndView mav = new ModelAndView();
		CommonListVO commonListVO = commonService.getAllHashtag();
		List<CommonVO> originHashtagList = commonListVO.getHashtagList();
		
		String[] hashtagArr = commonVO.getCodeContent().split(" ");
		
		// 중복된 값 제거
		Set<String> hashtagSet = new HashSet<>();
		for (String str : hashtagArr) {
			hashtagSet.add(str);
		}
		
		int count = 0;
		boolean isExist = false;
		
		for (String hashtag : hashtagSet) {
			for (CommonVO originhashtag : originHashtagList) {
				if (hashtag.equals(originhashtag.getCodeContent())) {
					count++;
					isExist = true;
					break;
				}
			}
			if (!isExist) {
				commonVO.setCodeContent(hashtag);
				boolean isSuccess = commonService.createHashtag(commonVO);
				
				if (isSuccess) {
					count++;
				}
			}
			isExist = false;
		}
		
		if (count == hashtagSet.size()) {
			mav.setViewName("redirect:/home/hashtaglist");
			return mav;
		}
		else {
			mav.setViewName("/temp/errorpage");
			return mav;
		}
		
	}
}
