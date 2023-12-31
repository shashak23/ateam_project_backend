/**
 * 작성자: 김태현
 * 수정자: 김광원
 * 작성일: 2023-10-16
 * 내용: 임시로 작업한 내용을 홈페이지에 띄웁니다.
 */

package com.ktdsuniversity.edu;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.notice.service.NoticeService;
import com.ktdsuniversity.edu.notice.vo.NoticeListVO;
import com.ktdsuniversity.edu.notice.vo.NoticeVO;



@Controller
public class TempHome {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("home/main")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		NoticeListVO noticeListVO = noticeService.getValidateList();
		Random rd= new Random();
		int rdIndex = rd.nextInt(noticeListVO.getNoticeList().size());
		
		NoticeVO noticeVO = noticeListVO.getNoticeList().get(rdIndex);
		
		mav.setViewName("temp/temphome");
		mav.addObject("noticeVO", noticeVO);
		return mav;
	}
}
