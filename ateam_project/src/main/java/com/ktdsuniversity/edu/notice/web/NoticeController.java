/**
 * 작성자: 김태현
 * 작성일자: 2023-10-13
 * 내용: 공지를 보여주고 처리하는 화면의 클래스입니다.
 */

package com.ktdsuniversity.edu.notice.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.Put;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.notice.service.NoticeService;
import com.ktdsuniversity.edu.notice.vo.NoticeListVO;
import com.ktdsuniversity.edu.notice.vo.NoticeVO;
import com.ktdsuniversity.edu.util.XssIgnoreUtil;

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
	public ModelAndView viewAllNotice(@ModelAttribute NoticeVO noticeVO,
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
		
		XssIgnoreUtil.ignore(noticeVO);

		ModelAndView mav = new ModelAndView();
		
		noticeVO.setPostWriter(memberVO.getEmail());
		
		boolean isSuccess = noticeService.createNotice(noticeVO);
		System.out.println();
		
		if (isSuccess) {
			mav.setViewName("redirect:/home/admin");
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
	
	@ResponseBody
	@GetMapping("/notice/delete/{noticeId}")
	public Map<String, Object> doDeleteNotice(@PathVariable String noticeId) {
		boolean isSuccess = noticeService.deleteNotice(noticeId);
		Map<String, Object> resultSet = new HashMap<>();
		
		
		if (isSuccess) {
			resultSet.put("result", "success");
			return resultSet;
		}
		
		else {
			resultSet.put("result", "fail");
			return resultSet;
		}
	}
	
	@ResponseBody
	@GetMapping("/admin/noticelist")
	public List<NoticeVO> getAdminNoticeList() {
		List<NoticeVO> resultList = new ArrayList<>();
		NoticeListVO noticeListVO = new NoticeListVO(); 
		
		noticeListVO = noticeService.getValidateList();
		resultList.addAll(noticeListVO.getNoticeList());
		noticeListVO = noticeService.getInvalidateList();
		resultList.addAll(noticeListVO.getNoticeList());
		noticeListVO = noticeService.getDeleteList();
		resultList.addAll(noticeListVO.getNoticeList());
		
		return resultList;
	}
	
	@ResponseBody
	@GetMapping("/admin/notice/onoff/{onOff}/{noticeId}")
	public Map<String, Object> toggleOnOff(@PathVariable String onOff, @PathVariable String noticeId) {
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setOnOff(onOff);
		noticeVO.setNoticeId(noticeId);
		
		boolean isSuccess = noticeService.toggleOnOff(noticeVO);
		Map<String, Object> resultSet = new HashMap<>();
		
		if (isSuccess) {
			resultSet.put("result", "success");
			return resultSet;
		}
		else {
			resultSet.put("result", "fail");
			return resultSet;
		}
	}
	
	@ResponseBody
	@GetMapping("/admin/notice/view/{noticeId}")
	public NoticeVO getOneNotice(@PathVariable String noticeId) {

		NoticeVO noticeVO = noticeService.getOneNotice(noticeId);
		
//		XssIgnoreUtil.ignore(noticeVO);
		
		return noticeVO;
	}
}
