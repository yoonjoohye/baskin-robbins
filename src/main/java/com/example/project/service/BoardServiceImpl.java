package com.example.project.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.dao.BoardDAO;
import com.example.project.model.dto.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO boardDao;
// 1. 占쌜억옙占쏙옙
	@Override
	public void create(BoardVO vo) {
		// TODO Auto-generated method stub
		String title=vo.getTitle();
		String content=vo.getContent();
		String writer=vo.getWriter();
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		boardDao.create(vo);	
	}
	
//2. 占쏢세븝옙占쏙옙
	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		return boardDao.read(bno);
	}
 //3. 占쏙옙占쏙옙
	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDao.update(vo);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		boardDao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) {
	    return boardDao.listAll(start, end, searchOption, keyword);
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) {
		
		// TODO Auto-generated method stub
				long update_time = 0;
			       
			       if(session.getAttribute("update_time_"+bno) != null){
			                               // �꽭�뀡�뿉�꽌 �씫�뼱�삤湲�
			           update_time = (Long)session.getAttribute("update_time_"+bno);
			       }
			      
			       long current_time = System.currentTimeMillis();
			      
			       if(current_time - update_time > 5*1000){
			           boardDao.increaseViewcnt(bno);
			         
			           session.setAttribute("update_time_"+bno, current_time);
			           
			       }
				
	}
	
	@Override
	public int countArticle(String searchOption, String keyword) {
	    return boardDao.countArticle(searchOption, keyword);
	
	}

}
