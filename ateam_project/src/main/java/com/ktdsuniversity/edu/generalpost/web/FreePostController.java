package com.ktdsuniversity.edu.generalpost.web;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.generalpost.service.GeneralPostService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class FreePostController {

	@Autowired
	private GeneralPostService generalPostService;
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);
	
	@GetMapping("/freeboard/list")
	public String viewFree() {
		log.debug("자유게시판 화면--------------------------------");
		return "freeboard/list";
	}
	
	
	// 전체조회
	@GetMapping("/freeboard")
	public ModelAndView freeBoardList() {
		GeneralPostListVO generalPostListVO = generalPostService.getAllBoard();
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("freeboard");
		modelAndView.addObject("generalPostListVO",generalPostListVO);
		
		return modelAndView;
	}
	
	@PostMapping("/freeboard/create")
	public ModelAndView createFreeBoard(@Valid @ModelAttribute GeneralPostVO generalPostVO
							   , BindingResult bindingResult 
					           , HttpServletRequest request
					           , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		// 요청자의 IP 정보를 ipAddr 변수에 할당한다.
//		generalPostVO.setIpAddr(request.getRemoteAddr());
		// common가져오기....
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
			// 글쓰기 화면을 보여준다.
			// 게시글 등록은 하지 않는다.
			modelAndView.setViewName("freeboard/create");
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
			modelAndView.setViewName("freeboard/create");
			modelAndView.addObject("generalPostVO", generalPostVO);
			return modelAndView;
		}
	}
	
	// 조회 요청 처리
	@GetMapping("/freeboard/{generalpostid}")
	public ModelAndView freeBoardSingle(@RequestParam int generalPostId) {
		GeneralPostVO generalPostVO = generalPostService.getOneBoard(generalPostId, true);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("freeboard/{generalpostid}");
		view.addObject("generalPostVO", generalPostVO);
		return view;
	}
	
//	// 등록
//	@GetMapping("/freeboard/create")
//	public ModelAndView createFreeBoard(@PathVariable int generalPostId) {
//		// 수정을 위해 내용을 조회한다
//		GeneralPostVO generalPostVO = generalPostService.getOneBoard(generalPostId, false);
//		
//		ModelAndView view = new ModelAndView();
//		view.setViewName("freeboard/freeboardmodify");
//		view.addObject("generalPostVO", generalPostVO);
//		return view;
//	}
	
	// 수정
	@PostMapping("/freeboard/update/{generalpostid}")
	public ModelAndView updateFreeBoard(@ModelAttribute GeneralPostVO generalPostVO) {
		System.out.println("일반회원용 게시글ID: " + generalPostVO.getGeneralPostId());
		System.out.println("게시글 작성자ID: " + generalPostVO.getPostWriterId());
		System.out.println("게시판ID: " + generalPostVO.getBoardId());
		System.out.println("게시글 제목: " + generalPostVO.getPostTitle());
		System.out.println("게시글 내용: " + generalPostVO.getPostContent());
		System.out.println("작성일자: " + generalPostVO.getPostDate());
		System.out.println("좋아요 수: " + generalPostVO.getLikeCnt());
		System.out.println("조회수: " + generalPostVO.getViewCnt());
		System.out.println("삭제여부: " + generalPostVO.getDeleteYn());
		
		ModelAndView view = new ModelAndView();
		boolean isSuccess = generalPostService.updateOneBoard(generalPostVO);
		if(isSuccess) {
			// 게시글의 수정이 성공이라면
			view.setViewName("redirect:/freeboard/view?id=" + generalPostVO.getPostDate());
			return view;
		}
		else {
			// 게시글의 수정이 실패하면
			view.setViewName("freeboard/modify");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
		
	}
	
	// 삭제 - 근데 수정
	@PostMapping("/freeboard/delete/{generalpostid}")
	public ModelAndView deleteFreeBoard(@ModelAttribute GeneralPostVO generalPostVO) {
		System.out.println("일반회원용 게시글ID: " + generalPostVO.getGeneralPostId());
		System.out.println("게시글 작성자ID: " + generalPostVO.getPostWriterId());
		System.out.println("게시판ID: " + generalPostVO.getBoardId());
		System.out.println("게시글 제목: " + generalPostVO.getPostTitle());
		System.out.println("게시글 내용: " + generalPostVO.getPostContent());
		System.out.println("작성일자: " + generalPostVO.getPostDate());
		System.out.println("좋아요 수: " + generalPostVO.getLikeCnt());
		System.out.println("조회수: " + generalPostVO.getViewCnt());
		System.out.println("삭제여부: " + generalPostVO.getDeleteYn());
		
		ModelAndView view = new ModelAndView();
		boolean isSuccess = generalPostService.updateOneBoard(generalPostVO);
		if(isSuccess) {
			// 게시글의 수정이 성공이라면
			view.setViewName("redirect:/freeboard/view?id=" + generalPostVO.getPostDate());
			return view; // 쿼리에서 조회가 안되게 함
		}
		else {
			// 게시글의 수정이 실패하면
			view.setViewName("freeboard/modify");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
		
	}
	
}