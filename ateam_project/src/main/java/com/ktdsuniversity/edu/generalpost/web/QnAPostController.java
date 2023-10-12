package com.ktdsuniversity.edu.generalpost.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

public class QnAPostController {
	
	@Autowired
	private GeneralPostService generalPostService;

	@GetMapping("/qnaboard/list")
	public String viewQnABoaord() {
		return "andboard/list";
	}
	
	//목록 조회
	@GetMapping("/qnaboard/list")
	public ModelAndView qnaBoardList() {
		GeneralPostListVO generalPostListVO = generalPostService.getAllBoard();

		ModelAndView view = new ModelAndView();
		view.setViewName("qnaboard/list");
		view.addObject("generalPostListVO", generalPostListVO);
		return view;
	}
	
	// 등록
	@PostMapping("/qnaboard/create")
	public ModelAndView createQnaBoard(@Valid @ModelAttribute GeneralPostVO generalPostVO
			   , BindingResult bindingResult 
	           , HttpServletRequest request
	           , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
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
		
		ModelAndView view = new ModelAndView();
		// validation에서 실패한 것이있다면
		if(bindingResult.hasErrors()) {
			// 글쓰기 화면을 보여준다 
			view.setViewName("qnaboard/create");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
		memberVO.setEmail(memberVO.getEmail());
		// 작성한 글쓰기를 등록한다
		boolean isSuccess = generalPostService.createNewBoard(generalPostVO);
		if(isSuccess) {
			// list화면 보여주기 
			view.setViewName("redirect:/qnaboard/list");
			return view;
		}
		else {
			
			// 아니면 글쓰기 화면 보여줘서 처리하기
			view.setViewName("qnaboard/create");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
		
	}
	
	// 단건 조회
	@GetMapping
	public ModelAndView qnaBoardSingle(@RequestParam int generalPostId) {
		GeneralPostVO generalPostVO = generalPostService.getOneBoard(generalPostId, true);
		ModelAndView view = new ModelAndView();
		view.setViewName("qnaboard/");
		view.addObject("generalPostVO", generalPostVO);
		return view;
	}
	
	// 수정
	@PostMapping("/freeboard/update/{generalpostid}")
	public ModelAndView updateQnaBoard(@ModelAttribute GeneralPostVO generalPostVO) {
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
	
	// 삭제 - 근데 수정 - 테스트
	@PostMapping("/freeboard/update/{generalpostid}")
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
