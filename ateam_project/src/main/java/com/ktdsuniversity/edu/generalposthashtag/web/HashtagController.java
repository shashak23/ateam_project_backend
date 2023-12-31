/**
 * 작성자: 김시하
 * 수정자: 김시하(2023-11-01)
 * 작성일자: 2023-10-26
 * 내용: 해시태그를 처리할 Controller
 */
package com.ktdsuniversity.edu.generalposthashtag.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.generalposthashtag.service.HashtagService;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagListVO;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

@Controller
public class HashtagController {
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	@Autowired
    private HashtagService hashtagService;

	// 해시태그별 목록 조회
	@GetMapping("/hashtag/list")
	public ModelAndView qnaBoardSearchByHashtag() {
		HashtagListVO hashtagListVO = new HashtagListVO();
		ModelAndView view = new ModelAndView();
		view.setViewName("forum/qnaboardlist");
		view.addObject("hashtagListVO", hashtagListVO);
		return view;
	}
	
	// 사이드바 해시태그 전체 조회
	@ResponseBody
	@GetMapping("/qnaboard/hashtag/{postId}")
	public List<HashtagVO> getHashtagList(@PathVariable String postId){
		return hashtagService.getHashtagList(postId);
	}
	
	@ResponseBody
	@GetMapping("/qnaboard/hashtag/list/{postId}")
	public Map<String, Object> getHastagListByGeneralPostId(@PathVariable String postId) {
		Map<String, Object> resultMap = new HashMap<>();
		List<HashtagVO> hashtagList = hashtagService.getHastagListByGeneralPostId(postId);
		resultMap.put("result", hashtagList);
		return resultMap;
	}

}
