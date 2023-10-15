package com.ktdsuniversity.edu.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.notice.service.NoticeService;
import com.ktdsuniversity.edu.notice.vo.NoticeListVO;
import com.ktdsuniversity.edu.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice/list")
	public ModelAndView viewAllNotice() {
		ModelAndView mav = new ModelAndView();
		NoticeListVO noticeList = noticeService.getNoticeListVO();
		
		mav.setViewName("notice/noticelist");
		mav.addObject("noticeList", noticeList);
		
		return mav;
	}
	
	@GetMapping("/notice/create")
	public String viewCreateNotify() {
		return "/notice/noticecreate";
	}
	
	@PostMapping("/notice/create")
	public ModelAndView doCreateaNotify(@ModelAttribute NoticeVO noticeVO) {
		ModelAndView mav = new ModelAndView();
		System.out.println("전입니다.");
		boolean isSuccess = noticeService.createNotice(noticeVO);
		System.out.println();
		
		if (isSuccess) {
			mav.setViewName("redirect:/notice/list");
			return mav;
		}
		else {
			mav.setViewName("notice/noticecreate");
			mav.addObject("notice", noticeVO);
		}
		return mav;
	}
	
	@GetMapping("/notice/modify/{noticeId}")
	public ModelAndView viewModifyNotice(@PathVariable String noticeId) {
		ModelAndView mav = new ModelAndView();
		NoticeVO notice = noticeService.getOneNotice(noticeId);
		
		mav.setViewName("notice/noticemodify");
		mav.addObject("notice", notice);
		
		return mav;
	}
	
	@PostMapping("/notice/modify")
	public ModelAndView doModifyNotice(@ModelAttribute NoticeVO noticeVO) {
		System.out.println("아이디: " + noticeVO.getPostTitle());
		
		ModelAndView mav = new ModelAndView();
		boolean isSuccess = noticeService.updateNotice(noticeVO);
		
		if (isSuccess) {
			mav.setViewName("redirect:/notice/list");
			return mav;
		}
		else {
			mav.setViewName("notice/noticemodify");
			mav.addObject("notice", noticeVO);
			
			return mav;
		}
	}
	
	@GetMapping("/notice/delete/{noticeId}")
	public String doDeleteNotice(@PathVariable String noticeId) {
		boolean isSuccess = noticeService.deleteNotice(noticeId);
		
		if (isSuccess) {
			return "redirect:/notice/list";
		}
		
		else {
			return "/notice/noticedeletefail";
		}
		
	}
}
