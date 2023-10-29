///**
// * 작성자: 김시하
// * 작성일자: 2023-10-26
// * 내용: 해시태그를 처리할 Controller
// */
//package com.ktdsuniversity.edu.generalposthashtag.web;
//
//import java.util.List;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.ktdsuniversity.edu.generalpost.web.FreePostController;
//import com.ktdsuniversity.edu.generalposthashtag.service.HashtagService;
//import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagListVO;
//import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;
//
//import jakarta.validation.Valid;
//
//@Controller
//public class HashtagController {
//	
//	private Logger log = LoggerFactory.getLogger(FreePostController.class);
//
//	@Autowired
//    private HashtagService hashtagService;
//
//	@PostMapping("/hashtag/post/{hashtagId}")
//	public ModelAndView createHashtag(@ModelAttribute HashtagVO hashtagVO
//										, @PathVariable String hashtagId) {
//		ModelAndView view = new ModelAndView();
//		log.debug("1--컨트롤러도착---------------------------");
//
//		if (hashtagId == null) {
//		    hashtagId = "기본값"; // 또는 다른 적절한 값
//		}
//		
//		boolean isSuccess = hashtagService.createHashtag(hashtagVO);
//		if(isSuccess) {
//			view.setViewName("redirect:/qnaboard/list");
//			return view;
//		}
//		else {
//			view.setViewName("forum/qnaboardcreate");
//			view.addObject("hashtagVO", hashtagVO);
//			return view;
//		}
//	}
//
//}
