package com.ktdsuniversity.edu.generalpost.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 전체조회
	@GetMapping("/freeboard/list")
	public ModelAndView freeBoardList() {
		GeneralPostListVO generalPostListVO = generalPostService.getAllBoard();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forum/freeboardlist");
		modelAndView.addObject("generalPostListVO",generalPostListVO);
		return modelAndView;
	}

	// 글쓰기 화면 
	@GetMapping("/freeboard/create")
	public String createFreeBoard() {
		return "/forum/freeboardcreate";
	}
	
	// 등록 
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
			modelAndView.setViewName("forum/freeboardcreate");
			modelAndView.addObject("generalPostVO", generalPostVO);
			return modelAndView;
		}
		
		generalPostVO.setPostWriterId(memberVO.getEmail());
		// 게시글을 등록한다.
		boolean isSuccess = generalPostService.createNewBoard(generalPostVO);
		if (isSuccess) {
			modelAndView.setViewName("redirect:/freeboard/list");
			return modelAndView;
		}    
		else {
			modelAndView.setViewName("forum/freeboardcreate");
			modelAndView.addObject("generalPostVO", generalPostVO);
			return modelAndView;
		}
	}
	
	// 단건 조회 처리
	@GetMapping("/freeboard/view/{generalPostId}")
	public ModelAndView freeBoardSingle(@PathVariable String generalPostId) {
		
		GeneralPostVO generalPostVO = generalPostService.getOneBoard(generalPostId);
		ModelAndView view = new ModelAndView();
		view.setViewName("forum/freeboardview");
		view.addObject("generalPostVO", generalPostVO);
		return view;
	}	
	
	// 수정처리 
	@PostMapping("/freeboard/update")
	public ModelAndView updateFreeBoardPost (@ModelAttribute GeneralPostVO generalPostVO
										, BindingResult bindingResult) {
		System.out.println("일반회원용 게시글ID: " + generalPostVO.getGeneralPostId());
		System.out.println("게시글 제목: " + generalPostVO.getPostTitle());
		System.out.println("게시글 내용: " + generalPostVO.getPostContent());
		System.out.println("작성일자: " + generalPostVO.getPostDate());
		
		ModelAndView view = new ModelAndView();
		
		// Validation 체크한 것 중 실패한 것이 있다면.
		if (bindingResult.hasErrors()) {
			// 글쓰기 화면을 보여준다.
			// 게시글 등록은 하지 않는다.
			view.setViewName("forum/freeboardupdate");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
		
		generalPostVO.getGeneralPostId();
		// 게시글을 등록한다.
		boolean isSuccess = generalPostService.updateOneBoard(generalPostVO);
		if (isSuccess) {
			view.setViewName("redirect:/freeboard/list");
			return view;
		}    
		else {
			view.setViewName("forum/freeboardupdate");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
		
//		boolean isSuccess = generalPostService.updateOneBoard(generalPostVO);
//
//		if(isSuccess) {
//			// 성공했다면
//			return "redirect:/forum/freeboard/list" + generalPostVO.getPostDate();
//		}
//		else {
//			// 아니라면
//			model.addAttribute("generalPostVO", generalPostVO);
//			return "forum/freeboardupdate";
//		}
	}
	
	
	// 삭제 - 근데 수정
	@PostMapping("/freeboard/delete")
	public ModelAndView deleteFreeBoardPost (@ModelAttribute GeneralPostVO generalPostVO
											, BindingResult bindingResult) {
		System.out.println("일반회원용 게시글ID: " + generalPostVO.getGeneralPostId());
		System.out.println("게시글 제목: " + generalPostVO.getPostTitle());
		System.out.println("게시글 내용: " + generalPostVO.getPostContent());
		System.out.println("작성일자: " + generalPostVO.getPostDate());
		System.out.println("삭제여부: " + generalPostVO.getDeleteYn());

		ModelAndView view = new ModelAndView();
		
		// Validation 체크한 것 중 실패한 것이 있다면.
		if (bindingResult.hasErrors()) {
			// 글쓰기 화면을 보여준다.
			// 게시글 등록은 하지 않는다.
			view.setViewName("forum/freeboarddelete");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
		
		generalPostVO.getGeneralPostId();
		// 게시글을 등록한다.
		boolean isSuccess = generalPostService.deleteOneBoard(generalPostVO);
		if (isSuccess) {
			view.setViewName("redirect:/freeboard/list");
			return view;
		}    
		else {
			view.setViewName("forum/freeboarddelete");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
	}
	
//	@PostMapping("/freeboard/{generalPostId}")
//    public String updateFreeBoardPost(@ModelAttribute GeneralPostVO generalPostVO) {
//        generalPostService.updateOneBoard(generalPostVO);
//        // 수정 후 리다이렉트할 URL을 여기에 추가하세요.
//        return "redirect:/your_target_url";
//    }
	
//	// 수정
//	@PostMapping("/freeboard/update")
//	public ModelAndView updateFreeBoard(@ModelAttribute GeneralPostVO generalPostVO) {
//		System.out.println("일반회원용 게시글ID: " + generalPostVO.getGeneralPostId());
//		System.out.println("게시글 작성자ID: " + generalPostVO.getPostWriterId());
//		System.out.println("게시판ID: " + generalPostVO.getBoardId());
//		System.out.println("게시글 제목: " + generalPostVO.getPostTitle());
//		System.out.println("게시글 내용: " + generalPostVO.getPostContent());
//		System.out.println("작성일자: " + generalPostVO.getPostDate());
//		System.out.println("좋아요 수: " + generalPostVO.getLikeCnt());
//		System.out.println("조회수: " + generalPostVO.getViewCnt());
//		System.out.println("삭제여부: " + generalPostVO.getDeleteYn());
//		
//		ModelAndView view = new ModelAndView();
//		boolean isSuccess = generalPostService.updateOneBoard(generalPostVO);
//		if(isSuccess) {
//			// 게시글의 수정이 성공이라면
//			view.setViewName("redirect:/freeboard/view" + generalPostVO.getPostDate());
//			return view;
//		}
//		else {
//			// 게시글의 수정이 실패하면
//			view.setViewName("forum/freeboardupdate");
//			view.addObject("generalPostVO", generalPostVO);
//			return view;
//		}
//		
//	}
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
}