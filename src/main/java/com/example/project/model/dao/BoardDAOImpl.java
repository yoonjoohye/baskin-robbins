package com.example.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.dto.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	SqlSession SqlSession;

	@Override
	public void create(BoardVO vo) {
		// TODO Auto-generated method stub
		SqlSession.insert("board.insert",vo);
	}

	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("board.view", bno);
	}

	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub
		SqlSession.update("board.updateArticle",vo);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		SqlSession.delete("board.deleteArticle", bno);
	}

	// 05. �Խñ� ��ü ���
	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) {
	 
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	  
	    map.put("start", start-1);
	    map.put("end", end);
	    return SqlSession.selectList("board.listAll", map);
	}


	@Override
	public void increaseViewcnt(int bno) {
		// TODO Auto-generated method stub
		SqlSession.update("board.increaseViewcnt",bno);
		
	}
	
	@Override
	public int countArticle(String searchOption, String keyword){
	    // �˻��ɼ�, Ű���� �ʿ� ����
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return SqlSession.selectOne("board.countArticle", map);
	}
	

}
