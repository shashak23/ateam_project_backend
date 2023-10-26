///**
// * 작성자: 남현욱
// * 작성일자: 2023-10-23
// * 내용: 기업회원 내 게시글 controller입니다
// */
//
//
//package com.ktdsuniversity.edu.companymypost.web;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.SessionAttribute;
//
//import com.ktdsuniversity.edu.AteamProjectApplication;
//import com.ktdsuniversity.edu.companymypost.service.CompanyMyPostService;
//import com.ktdsuniversity.edu.companymypost.vo.SearchCompanyMyPostVO;
//import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
//import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;
//
//@Controller
//public class CompanyMyPostController {
//	
//	@Autowired
//	private CompanyMyPostService companyMyPostService;
//
//	@GetMapping("/companyMyPost/list")
//	public String viewCompanyMyPostList(@ModelAttribute SearchCompanyMyPostVO searchCompanyMyPostVO, Model model) {
//		
//		model.addAttribute("searchCompanyMyPostVO",searchCompanyMyPostVO);
//		return "
//	}
//	
//	private Logger log = LoggerFactory.getLogger(AteamProjectApplication.class);
//	
//	@PostMapping("/companyMyPost/create/{companyEmail}")
//	public Map<String, Object> doCreateNewComments(@PathVariable String generalPostId,
//			@ModelAttribute GeneralCommentVO generalCommentVO,
//			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
//		generalCommentVO.setGeneralPostId(generalPostId);
//		generalCommentVO.setCommentWriter(generalMemberVO.getGeneralMemberEmail());
//		boolean isSuccess = generalCommentService.createNewComment(generalCommentVO);
//
//		Map<String, Object> resultMap = new HashMap<>();
//		resultMap.put("result", isSuccess);
//		return resultMap;
//	}
//
//	@PostMapping("/companyMyPost/delete/{companyEmail}")
//	public Map<String, Object> doDeleteComments(@PathVariable String generalCommentId,
//			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
//		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId,
//				generalMemberVO.getGeneralMemberEmail());
//		Map<String, Object> resultMap = new HashMap<>();
//		resultMap.put("result", isSuccess);
//		return resultMap;
//	}
//
//	@PostMapping("/companyMyPost/update/{companyEmail}")
//	public Map<String, Object> doUpdateComments(@PathVariable String generalCommentId,
//			@ModelAttribute GeneralCommentVO generalCommentVO,
//			@SessionAttribute("_LOGIN_USER") GeneralMemberVO generalMemberVO) {
//		generalCommentVO.setGeneralCommentId(generalCommentId);
//		generalCommentVO.setCommentWriter(generalMemberVO.getGeneralMemberEmail());
//		boolean isSuccess = generalCommentService.updateOneComment(generalCommentVO);
//
//		Map<String, Object> resultMap = new HashMap<>();
//		resultMap.put("result", isSuccess);
//		return resultMap;
//	}
//
//	
//
//}
