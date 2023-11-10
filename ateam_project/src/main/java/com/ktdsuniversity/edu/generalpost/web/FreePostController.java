/**
 * 작성자: 김시하
 * 수정자: 김시하(2023-10-23)
 * 수정자: 장보늬(2023-10-25)
 * 작성일자: 2023-10-16
 * 내용: 자유게시판을 위한 Controller
 */
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.generalpost.service.GeneralPostService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.SearchForumVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.util.XssIgnoreUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class FreePostController {

	@Autowired
	private GeneralPostService generalPostService;

	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	// 전체조회
	@GetMapping("/freeboard/list")
	public ModelAndView freeBoardList(SearchForumVO searchForumVO) {
		log.debug("--1--리스트컨트롤러 도착--------");
		searchForumVO.setBoardId("CC-20231017-000029");
		GeneralPostListVO generalPostListVO = generalPostService.getAllBoard(searchForumVO);
		ModelAndView view = new ModelAndView();
		
		view.setViewName("forum/freeboardlist");
		view.addObject("generalPostListVO", generalPostListVO);
		view.addObject("searchForumVO", searchForumVO);

		return view;
	}

	// 글쓰기 화면 보이기
	@GetMapping("/freeboard/create")
	public String createFreeBoard() {
		return "forum/freeboardcreate";
	}

	// 등록
	@PostMapping("/freeboard/create")
	public ModelAndView createFreeBoard(@Valid @ModelAttribute GeneralPostVO generalPostVO
										, BindingResult bindingResult
										, HttpServletRequest request
										, @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		System.out.println("일반회원용 게시글ID: " + generalPostVO.getGeneralPostId());
		System.out.println("게시글 작성자ID: " + generalPostVO.getPostWriter());
		System.out.println("게시판ID: " + generalPostVO.getBoardId());
		System.out.println("게시글 제목: " + generalPostVO.getPostTitle());
		System.out.println("게시글 내용: " + generalPostVO.getPostContent());
		System.out.println("작성일자: " + generalPostVO.getPostDate());
		System.out.println("좋아요 수: " + generalPostVO.getLikeCnt());
		System.out.println("조회수: " + generalPostVO.getViewCnt());
		System.out.println("삭제여부: " + generalPostVO.getDeleteYn());

		ModelAndView modelAndView = new ModelAndView();
		log.debug("1--컨트롤러---자유----------------------");

		XssIgnoreUtil.ignore(generalPostVO);

		// Validation 체크한 것 중 실패한 것이 있다면.
		if (bindingResult.hasErrors()) {
			// 글쓰기 화면을 보여준다.
			// 게시글 등록은 하지 않는다.
			modelAndView.setViewName("freeboard/create");
			modelAndView.addObject("generalPostVO", generalPostVO);
			return modelAndView;
		}
		log.debug("--2--작성-컨트롤러 도착--------");

		generalPostVO.setBoardId("CC-20231017-000029");
		generalPostVO.setPostWriter(memberVO.getEmail());
		// 게시글을 등록한다.
		boolean isSuccess = generalPostService.createNewFreeBoard(generalPostVO);
		if (isSuccess) {
			modelAndView.setViewName("redirect:/freeboard/list");
			return modelAndView;
		} else {
			modelAndView.setViewName("freeboard/create");
			modelAndView.addObject("generalPostVO", generalPostVO);
			return modelAndView;
		}
	}

	// 단건 조회 처리
	@GetMapping("/freeboard/view/{generalPostId}")
	public ModelAndView freeBoardSingle(@PathVariable String generalPostId) {
		GeneralPostVO generalPostVO = generalPostService.getOneBoard(generalPostId);
		XssIgnoreUtil.ignore(generalPostVO); 
		ModelAndView view = new ModelAndView();
		view.setViewName("forum/freeboardview");
		view.addObject("generalPostVO", generalPostVO);
		return view;
	}

	// 수정 페이지 이동
	@GetMapping("/freeboard/update/{generalPostId}")
	public ModelAndView viewUpdatePage(@PathVariable String generalPostId) {

		
		// 요런식으로다가 서비스에서 -> DB에서 게시글 ID로 게시글 가져오는 쿼리 실행
		GeneralPostVO generalPostVO = generalPostService.getOneBoard(generalPostId);
		XssIgnoreUtil.ignore(generalPostVO); 
		ModelAndView view = new ModelAndView();
		view.setViewName("forum/freeboardupdate");
		view.addObject("generalPostVO", generalPostVO);

		return view;
	}

	// 수정
	@PostMapping("/freeboard/update")
	public ModelAndView updateFreeBoard(@ModelAttribute GeneralPostVO generalPostVO) {
		System.out.println("일반회원용 게시글ID: " + generalPostVO.getGeneralPostId());
		System.out.println("게시글 제목: " + generalPostVO.getPostTitle());
		System.out.println("게시글 내용: " + generalPostVO.getPostContent());
		XssIgnoreUtil.ignore(generalPostVO); 
		ModelAndView view = new ModelAndView();
		boolean isSuccess = generalPostService.updateOneBoard(generalPostVO);
		if (isSuccess) {
			// 게시글의 수정이 성공이라면
			view.setViewName("redirect:/freeboard/list");
			return view;
		} else {
			// 게시글의 수정이 실패하면
			view.setViewName("forum/freeboardupdate");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}

	}

	// 삭제 페이지 이동
	@GetMapping("/freeboard/delete/{generalPostId}")
	public ModelAndView viewDeletePage(@ModelAttribute GeneralPostVO generalPostVO,
			@PathVariable String generalPostId) {
		ModelAndView view = new ModelAndView();
		view.setViewName("forum/freeboarddelete");
		view.addObject("generalPostVO", generalPostVO);
		return view;
	}

	// 삭제 - 근데 수정
	@PostMapping("/freeboard/delete/{generalPostId}")
	public ModelAndView deleteFreeBoard(@ModelAttribute GeneralPostVO generalPostVO, BindingResult bindingResult,
			@PathVariable String generalPostId) {

		ModelAndView view = new ModelAndView();

		GeneralPostVO origingeneralPostVO = generalPostService.getOneBoard(generalPostVO.getGeneralPostId());
		log.debug("삭제여부 : " + origingeneralPostVO.getDeleteYn());
		generalPostVO.getGeneralPostId();
		// 게시글을 등록한다.
		boolean isSuccess = generalPostService.deleteOneBoard(origingeneralPostVO.getGeneralPostId());
		if (isSuccess) {
			view.setViewName("redirect:/freeboard/list");
			return view;
		} else {
			view.setViewName("forum/freeboarddelete");
			view.addObject("generalPostVO", origingeneralPostVO);
			return view;
		}
	}

	// 좋아요 기능
	@PostMapping("/freeboard/like")
	public ModelAndView likeFreeBoard(@ModelAttribute GeneralPostVO generalPostVO) {

		ModelAndView view = new ModelAndView();
		boolean isSuccess = generalPostService.likeBoard(generalPostVO);
		if (isSuccess) {
			view.setViewName("redirect:/freeboard/list");
			return view;
		} else {
			view.setViewName("forum/freeboardview");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
	}

}