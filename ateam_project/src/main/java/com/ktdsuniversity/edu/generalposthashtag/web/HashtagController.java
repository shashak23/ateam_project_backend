/**
 * 작성자: 김시하
 * 작성일자: 2023-10-26
 * 내용: 해시태그를 처리할 Controller
 */
package com.ktdsuniversity.edu.generalposthashtag.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.generalposthashtag.service.HashtagService;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagListVO;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

import jakarta.validation.Valid;

public class HashtagController {

	// 해시태그 리스트
	private List<HashtagVO> hashtagList;
	
	@Autowired
    private HashtagService hashtagService;

	/* 10.28.토 여기서부터 다시 하기 
	 * @PostMapping("/hashtag/post") public ModelAndView
	 * createTag(@Valid @ModelAttribute HashtagVO hashtagVO , Model model) {
	 * ModelAndView view = new ModelAndView();
	 * 
	 * boolean hashtagListVO = hashtagService.createHashtag(hashtagVO);
	 * model.addAttribute("hashtagListVO", hashtagListVO);
	 * model.addAttribute("hashtagVO", hashtagVO); return ""; }
	 */

}
