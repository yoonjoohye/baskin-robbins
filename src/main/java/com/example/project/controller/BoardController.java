package com.example.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.BoardVO;
import com.example.project.service.BoardPager;
import com.example.project.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	BoardService boardService;
	//1. 占쌉시깍옙 占쏙옙占� 
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption,
            @RequestParam(defaultValue="") String keyword,
            @RequestParam(defaultValue="1") int curPage) {
		 
        
        int count = boardService.countArticle(searchOption, keyword);
        
     // 페이지 나누기 관련 처리
        BoardPager boardPager = new BoardPager(count, curPage);
        int start = boardPager.getPageBegin();
        int end = boardPager.getPageEnd();
        
        List<BoardVO> list = boardService.listAll(start,end,searchOption, keyword);
        
		ModelAndView mav=new ModelAndView();
		
		  Map<String, Object> map = new HashMap<String, Object>();
		    map.put("list", list); 
		    map.put("count", count); 
		    map.put("searchOption", searchOption); 
		    map.put("keyword", keyword);
		    map.put("boardPager", boardPager);
		    
		    mav.addObject("map", map); 
		    mav.setViewName("board/list"); 
		    return mav; 
	}
	
	//2. 占쌉시깍옙 占쌜쇽옙화占쏙옙
	//@RequestMapping("board/write.do")
	
	@RequestMapping(value="write.do" , method=RequestMethod.GET)
	public String write() {
		return "board/write"; //write.jsp 占쏙옙占쏙옙占쏙옙 占싱듸옙
	}

	//3. 占쌉시깍옙 占쌜쇽옙처占쏙옙
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo, HttpSession session){
	   
	    String writer = (String) session.getAttribute("userId");
	    String userName= (String) session.getAttribute("userName");
	   
	    vo.setWriter(writer);
	    vo.setUserName(userName);
	    boardService.create(vo);
	    return "redirect:list.do";
	}

	
	//4. 占쌉시깍옙 占쏙옙 占쏙옙占쏙옙 占쏙옙회 占쏙옙 占쏙옙회占쏙옙 占쏙옙占쏙옙 처占쏙옙
	
	 @RequestMapping(value="view.do", method=RequestMethod.GET)
	 public ModelAndView view(int bno, HttpSession session){
		 //占쏙옙회占쏙옙 占쏙옙占쏙옙 처占쏙옙 占싸븝옙
		 boardService.increaseViewcnt(bno, session);
		 
		 ModelAndView mav=new ModelAndView();
		 mav.setViewName("board/view");
		 mav.addObject("dto",boardService.read(bno));
		 return mav;
		 
		 
	 }
	
	 //5. 占쌉시깍옙 占쏙옙占쏙옙
	 
	 @RequestMapping(value="update.do", method=RequestMethod.POST)
	 public String update(@ModelAttribute BoardVO vo){
		 boardService.update(vo);
		 return "redirect:list.do";
	 }
	 
	 //6. 占쌉시깍옙 占쏙옙占쏙옙
	 @RequestMapping("delete.do")
	 public String delete(int bno){
		 boardService.delete(bno);
		 return "redirect:list.do";
	 }
	 
	
	
}
