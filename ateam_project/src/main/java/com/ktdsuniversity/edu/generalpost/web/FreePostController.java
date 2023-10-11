package com.ktdsuniversity.edu.generalpost.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.generalpost.service.GeneralPostService;
import com.ktdsuniversity.edu.generalpost.vo.GenaralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class FreePostController {

	@Autowired
	private GeneralPostService generalPostService;
	
	@GetMapping("/freeboard")
	public String viewFree() {
		return "forum/freeboard";
	}
	
	
//	// 전체조회
//	@GetMapping("/freeboard")
//	public ModelAndView viewPostList() {
//		GeneralPostListVO generalPostListVO = generalPostService.getAllBoard();
//		ModelAndView modelAndView = new ModelAndView();
//		
//		modelAndView.setViewName("freeboard");
//		modelAndView.addObject("generalPostListVO",generalPostListVO);
//		
//		return modelAndView;
//	}
	
	@PostMapping("/freeboard/write")
	public ModelAndView writePost(@Valid @ModelAttribute GenaralPostVO generalPostVO
							   , BindingResult bindingResult 
					           , HttpServletRequest request
					           , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		// 요청자의 IP 정보를 ipAddr 변수에 할당한다.
//		generalPostVO.setIpAddr(request.getRemoteAddr());
				
				System.out.println("일반회원용 게시글ID: " + generalPostVO.getGeneralPostId());
				System.out.println("게시글 작성자ID: " + generalPostVO.getPostWriterId());
				System.out.println("게시판ID: " + generalPostVO.getBoardId());
				System.out.println("게시글 제목: " + generalPostVO.getPostTitle());
				System.out.println("게시글 내용: " + generalPostVO.getPostContent());
				System.out.println("작성일자: " + generalPostVO.getPostDate());
				System.out.println("좋아요 수: " + generalPostVO.getLikeCnt());
				System.out.println("조회수: " + generalPostVO.getViewCnt());
				System.out.println("삭제여부: " + generalPostVO.getDeleteYn());
				
				ModelAndView modelAndView = new ModelAndView();
				
				// Validation 체크한 것 중 실패한 것이 있다면.
				if (bindingResult.hasErrors()) {
					// 화면을 보여준다.
					// 게시글 등록은 하지 않는다.
					modelAndView.setViewName("freeboard/write");
					modelAndView.addObject("generalPostVO", generalPostVO);
					return modelAndView;
				}
				
				memberVO.setEmail(memberVO.getEmail());
				// 게시글을 등록한다.
				boolean isSuccess = generalPostService.createNewBoard(generalPostVO);
				if (isSuccess) {
					modelAndView.setViewName("redirect:/freeboard/list");
					return modelAndView;
				}
				else {
					modelAndView.setViewName("freeboard/write");
					modelAndView.addObject("generalPostVO", generalPostVO);
					return modelAndView;
				}
	}
}
