/**
 * 작성자: 김태현
 * 작성일자: 2023-10-13
 * 내용: 공지를 보여주고 처리하는 화면의 클래스입니다.
 */

package com.ktdsuniversity.edu.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.member.vo.MemberVO;
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
	
	@PostMapping("/notice/list")
	public ModelAndView viewAllNotice( @ModelAttribute NoticeVO noticeVO,
									  @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		ModelAndView mav = new ModelAndView();
		noticeVO.setPostWriter(memberVO.getEmail());
		
		boolean isSuccess = noticeService.createNotice(noticeVO);
		
		if (isSuccess) {
			mav.setViewName("redirect:/notice/list");
			return mav;
		}
		
		else {
			mav.addObject("noticeVO", noticeVO);
			mav.setViewName("notice/noticelist");
			return mav;
		}
		
	}
	
	@GetMapping("/notice/create")
	public String viewCreateNotify() {
		return "/notice/noticecreate";
	}
	
	@PostMapping("/notice/create")
	public ModelAndView doCreateaNotify(@ModelAttribute NoticeVO noticeVO,
										@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		ModelAndView mav = new ModelAndView();
		
		noticeVO.setPostWriter(memberVO.getEmail());
		
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
