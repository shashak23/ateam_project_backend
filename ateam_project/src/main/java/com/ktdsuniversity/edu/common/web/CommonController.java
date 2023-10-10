package com.ktdsuniversity.edu.common.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.common.servicee.CommonService;
import com.ktdsuniversity.edu.common.vo.CommonListVO;
import com.ktdsuniversity.edu.common.vo.CommonVO;

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
	
	// 다 좋은데 같은 걸 입력하면 그걸 체크 못함
	@PostMapping("/home/hashtaglist")
	public ModelAndView createHashtag(@ModelAttribute CommonVO commonVO) {
		ModelAndView mav = new ModelAndView();
		CommonListVO commonListVO = commonService.getAllHashtag();
		List<CommonVO> originHashtagList = commonListVO.getHashtagList();
		
		String[] hashtagArr = commonVO.getCodeContent().split(" ");
		
		int count = 0;
		boolean isExist = false;
		
		for (String hashtag : hashtagArr) {
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
		
		
		if (count == hashtagArr.length) {
			mav.setViewName("redirect:/home/hashtaglist");
			return mav;
		}
		else {
			mav.setViewName("/temp/errorpage");
			return mav;
		}
		
	}
}
