/**
 * 작성자: 김시하
 * 작성일자: 2023-10-26
 * 내용: 해시태그를 처리할 Controller
 */
package com.ktdsuniversity.edu.generalposthashtag.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ktdsuniversity.edu.generalposthashtag.service.HashtagService;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

public class HashtagController {

	// 해시태그 리스트
	private List<HashtagVO> hashtagList;
	
	@Autowired
    private HashtagService hashtagService;

	
	@PostMapping("/post")
    public ResponseEntity<String> postTag(@RequestParam String postTag) {
        // 여기에서 postTag를 데이터베이스에 저장하거나 필요한 작업을 수행
        return ResponseEntity.ok("해시태그가 저장되었습니다.");
    }
//    @GetMapping("/hashtags")
//    public String viewHashtags(Model model) {
//        List<HashtagVO> hashtags = hashtagService.getAllHashtags();
//        model.addAttribute("hashtags", hashtags);
//        return "hashtags";
//    }
//
//    @PostMapping("/hashtags/insert")
//    public String insertHashtag(@RequestParam String hashtagId) {
//        hashtagService.saveHashtag(hashtagId);
//        return "redirect:/hashtags";
//    }
//
//    @GetMapping("/hashtags/delete/{id}")
//    public String deleteHashtag(@PathVariable String generalPostHashtagId) {
//        hashtagService.deleteHashtag(generalPostHashtagId);
//        return "redirect:/hashtags";
//    }
//	
}
