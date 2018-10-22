package com.example.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.ReplyVO;
import com.example.project.service.ReplyService;
@RestController
@RequestMapping("/reply/*")
public class ReplyController {
  
  @Inject
  ReplyService replyService;
  
  // 1_1. 댓글 입력(@Controller방식으로 댓글 입력)
  @RequestMapping("insert.do")
  public void insert(@ModelAttribute ReplyVO vo, HttpSession session){
     
      String userId = (String) session.getAttribute("userId");
      vo.setReplyer(userId);
     
      replyService.create(vo);
  }
  
  // 2_1. 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
  @RequestMapping("list.do")
  public ModelAndView list(@RequestParam int bno,   ModelAndView mav){
      
      List<ReplyVO> list = replyService.list(bno);
      mav.setViewName("board/replyList");
      mav.addObject("list", list);
   
      return mav;
  }
  
  
  // 2_2. 댓글 목록(@RestController방식 : Json으로 데이터를 리턴)
  /*
  @RequestMapping("listJson.do")
  @ResponseBody // 리턴데이터를 json으로 변환(RestController사용시 @ResponseBody생략가능)
  public List<ReplyVO> listJson(@RequestParam int bno){
      // 페이징 처리
     
      List<ReplyVO> list = replyService.list(bno);
      // list를 리턴
      return list;
  }
  */
  
  // ** Controller 추가 사항 - Rest방식으로 댓글 목록, 수정, 삭제 처리
  
  // 2_3. 댓글 목록
  /*
  @RequestMapping(value="/list/{bno}/", method=RequestMethod.GET)
  public ModelAndView replyList(@PathVariable("bno") int bno, ModelAndView mav){
         
      List<ReplyVO> list = replyService.list(bno);
      mav.setViewName("board/replyList");
      mav.addObject("list", list);
      return mav;
  }
 */
  
  // 3. 댓글 상세 보기
 
  @RequestMapping(value="/detail/{rno}", 
		  method=RequestMethod.GET)
  public ModelAndView replyDetail(@PathVariable("rno") int rno,
		                          ModelAndView mav){
  
	  ReplyVO vo = replyService.detail(rno);
      mav.setViewName("board/replyDetail");
      mav.addObject("vo", vo);
 
      return mav;
  }

  // 4. 댓글 수정 처리 
  @RequestMapping(value="/update/{rno}", method={RequestMethod.PUT,
		                                  RequestMethod.PATCH})
   
  public ResponseEntity<String> replyUpdate
       (@PathVariable("rno") int rno, @RequestBody ReplyVO vo)
  {
      ResponseEntity<String> entity = null;
      try {
          vo.setRno(rno);
          replyService.update(vo);
         
          entity = new ResponseEntity<String>("success", 
        		  HttpStatus.OK);
      } catch (Exception e) {
          e.printStackTrace();
         
          entity = new ResponseEntity<String>(e.getMessage(),
        		  HttpStatus.BAD_REQUEST);
      }
       return entity;
  }
  
  // 5. 댓글 삭제처리
  @RequestMapping(value="/delete/{rno}")
  public ResponseEntity<String> replyDelete(@PathVariable("rno") Integer rno){
      ResponseEntity<String> entity = null;
      try {
          replyService.delete(rno);
          // 댓글 삭제가 성공하면 성공 상태메시지 저장
          entity = new ResponseEntity<String>("success", HttpStatus.OK);
      } catch (Exception e) {
          e.printStackTrace();
          // 댓글 삭제가 실패하면 실패 상태메시지 저장
          entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
      }
      // 삭제 처리 HTTP 상태 메시지 리턴
      return entity;
  }
}
    


