/**
 * 작성자: 김시하 
 * 수정자: 김시하(2023-11-01)
 * 작성일자: 2023-10-16
 * 내용: 질답게시판의 view와 연동되는 controller입니다 
 */
package com.ktdsuniversity.edu.generalpost.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
public class QnAPostController {

	@Autowired
	private GeneralPostService generalPostService;
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	// 전체조회 
	@GetMapping("/qnaboard/list")
	public ModelAndView qnaBoardList(SearchForumVO searchForumVO, @RequestParam(required = false) String hashtagId) {
		log.debug("--1--컨트롤러도착---------------------------"+ hashtagId);
		if (hashtagId != null && hashtagId.length() > 0) {
			searchForumVO.setSearchType("hashtagId");
			searchForumVO.setSearchKeyword(hashtagId);
		}
		
		searchForumVO.setBoardId("CC-20231017-000030");
		
		GeneralPostListVO generalPostListVO = generalPostService.getAllBoard(searchForumVO);
		ModelAndView view = new ModelAndView();
		view.setViewName("forum/qnaboardlist");
		view.addObject("generalPostListVO", generalPostListVO);
		view.addObject("searchForumVO", searchForumVO);
		
		return view;
	}
	
	// 글쓰기 화면 보이기
	@GetMapping("/qnaboard/create")
	public String createQnABoard() {
		return "forum/qnaboardcreate";
	}

	
	// 글 등록
	@PostMapping("/qnaboard/create")
	public ModelAndView createQnABoard(@Valid @ModelAttribute GeneralPostVO generalPostVO
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
		
		XssIgnoreUtil.ignore(generalPostVO); 
		ModelAndView modelAndView = new ModelAndView();
		
		log.debug("1--컨트롤러-도착--------------------------");
		log.debug("데이터 =  " + generalPostVO.getBoardId());
		log.debug("데이터 =  " + generalPostVO.getPostWriter());
		generalPostVO.setPostWriter(memberVO.getEmail());
		
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("forum/qnaboardcreate");
			modelAndView.addObject("generalPostVO", generalPostVO);
			return modelAndView;
		}
		
		generalPostVO.setBoardId("CC-20231017-000030");
		// 게시글을 등록한다.
		boolean isSuccess = generalPostService.createNewBoard(generalPostVO);
		log.debug("서비스 실행");
		if (isSuccess) {
			modelAndView.setViewName("redirect:/qnaboard/list");
			return modelAndView;
		}
		else {
			modelAndView.setViewName("forum/qnaboardlist");
			modelAndView.addObject("generalPostVO", generalPostVO);
			return modelAndView;
		}
	}
	
	// 단건 조회
	@GetMapping("/qnaboard/view/{generalPostId}")
	public ModelAndView qnaBoardSingle(@PathVariable String generalPostId) {
		ModelAndView view = new ModelAndView();
		GeneralPostVO generalPostVO = generalPostService.getOneBoard(generalPostId);
		//XssIgnoreUtil.ignore(generalPostVO); // 들어오는 파라미터한테만 해야해요

		log.debug("--1------컨트롤러---------------------------");
		log.debug("글번호 : " + generalPostVO.getBoardId());
		view.setViewName("forum/qnaboardview");
		view.addObject("generalPostVO", generalPostVO);
		return view;
	}
	
	// 수정페이지 이동
	@GetMapping("/qnaboard/update/{generalPostId}")
	public ModelAndView viewUpdatePage(@PathVariable String generalPostId) {
		   // 요런식으로다가 서비스에서 -> DB에서 게시글 ID로 게시글 가져오는 쿼리 실행
	      GeneralPostVO generalPostVO  = generalPostService.getOneBoard(generalPostId); 
	      XssIgnoreUtil.ignore(generalPostVO); 
	      ModelAndView view = new ModelAndView();
	      view.setViewName("forum/qnaboardupdate");
	      view.addObject("generalPostVO", generalPostVO);
	      

	      return view;
	   }
	
	// 수정 처리
	@PostMapping("/qnaboard/update")
	public ModelAndView updateQnABoard(@ModelAttribute GeneralPostVO generalPostVO
			 							, @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		System.out.println("일반회원용 게시글ID: " + generalPostVO.getGeneralPostId());
		System.out.println("게시글 제목: " + generalPostVO.getPostTitle());
		System.out.println("게시글 내용: " + generalPostVO.getPostContent());
		XssIgnoreUtil.ignore(generalPostVO); 
		
		ModelAndView view = new ModelAndView();
		generalPostVO.setPostWriter(memberVO.getEmail());

		boolean isSuccess = generalPostService.updateOneBoard(generalPostVO);
		if(isSuccess) {
			// 게시글의 수정이 성공이라면
			view.setViewName("redirect:/qnaboard/list");
			return view;
		}
		else {
			// 게시글의 수정이 실패하면
			view.setViewName("forum/qnaboardupdate");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
		
	}
	
	// 삭제페이지  이동
	@GetMapping("/qnaboard/delete/{generalPostId}")
	public ModelAndView viewDeletePage(@ModelAttribute GeneralPostVO generalPostVO
										,@PathVariable String generalPostId) {
		ModelAndView view = new ModelAndView();
		view.setViewName("forum/qnaboarddelete");
		view.addObject("generalPostVO", generalPostVO);
		return view;
	}
	
	// 삭제 처리 
	@PostMapping("/qnaboard/delete/{generalPostId}")
	public ModelAndView deleteQnABoard(@ModelAttribute GeneralPostVO generalPostVO
			, BindingResult bindingResult
			, @PathVariable String generalPostId) {

		ModelAndView view = new ModelAndView();
		
		GeneralPostVO origingeneralPostVO  = generalPostService.getOneBoard(generalPostVO.getGeneralPostId());		
		log.debug("삭제여부 : " + origingeneralPostVO.getDeleteYn());

		// 게시글을 등록한다.
		boolean isSuccess = generalPostService.deleteOneBoard(origingeneralPostVO.getGeneralPostId());
		if (isSuccess) {
			view.setViewName("redirect:/qnaboard/list");
			return view;
		}    
		else {
			view.setViewName("forum/qnaboarddelete");
			view.addObject("generalPostVO", origingeneralPostVO);
			return view;
		}
	}
	
	// 내 게시글 조회
	@GetMapping("/member/mypost")
	public String viewMyPost(@ModelAttribute GeneralPostVO generalPostVO
			               , Model model
			               , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		generalPostVO.setPostWriter(memberVO.getEmail());
		GeneralPostListVO generalPostListVO = generalPostService.getMyPost(generalPostVO);
		List<GeneralPostVO> qnaPostList = generalPostListVO.getGeneralPostList();
		if (qnaPostList != null) {
			qnaPostList = qnaPostList.stream().filter(boardId -> boardId.getBoardId().equals("CC-20231017-000030")).collect(Collectors.toList());
		}
		List<GeneralPostVO> freePostList = generalPostListVO.getGeneralPostList();
		if (freePostList != null) {
			freePostList = freePostList.stream().filter(boardId -> boardId.getBoardId().equals("CC-20231017-000029")).collect(Collectors.toList());
		}
		
		model.addAttribute("qnaPostList", qnaPostList);
		model.addAttribute("freePostList", freePostList);
		return "mypage/mypostinmypage";
	}
	
	// 좋아요 기능
	@PostMapping("/qnaboard/like")  
    public ModelAndView likeQnABoard(@ModelAttribute GeneralPostVO generalPostVO) {

		ModelAndView view = new ModelAndView();
		boolean isSuccess = generalPostService.likeBoard(generalPostVO);
		if(isSuccess) {
			view.setViewName("redirect:/qnaboard/list");
			return view;
		}
		else {
			view.setViewName("forum/qnaboardview");
			view.addObject("generalPostVO", generalPostVO);
			return view;
		}
	}
	
	// 조회수 순 랭킹
	@ResponseBody
	@GetMapping("/qnaboard/rank/viewcnt/{date}")
	public Map<String, Object> getWeeklyRankingView(@PathVariable String date) {
		Map<String, Object> resultMap = new HashMap<>();
		List<GeneralPostVO> rankingList = new ArrayList<>();
		rankingList.addAll(generalPostService.getViewRanking(date));
		resultMap.put("rankings", rankingList);
		return resultMap;
	}
	
	// 좋아요 순 랭킹
	@ResponseBody
	@GetMapping("/qnaboard/rank/likecnt/{date}")
	public Map<String, Object> getWeeklyRankingLike(@PathVariable String date){
		Map<String, Object> resultMap = new HashMap<>();
		List<GeneralPostVO> rankingList = new ArrayList<>();
		rankingList.addAll(generalPostService.getLikeRanking(date));
		resultMap.put("rankings", rankingList);
		return resultMap;
	}

}