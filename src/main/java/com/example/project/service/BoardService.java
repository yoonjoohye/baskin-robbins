package com.example.project.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.dto.BoardVO;

public interface BoardService {
	
	//1. 작성
	public void create(BoardVO vo);
	
	//2. 상세 보기
	public BoardVO read(int bno);
	
	//3. 수정
	public void update(BoardVO vo);
	
	//4. 삭제
	public void delete(int bno);
	
	//5. 전체 목록
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword);
	
	
	//6. 조회수
	public void increaseViewcnt(int bno, HttpSession session);
	
	// 07. 게시글 레코드 갯수 메서드 추가
	public int countArticle(String searchOption, String keyword);

}
