package com.spring.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;


// @Service : @Component 상속확장 어노테이션
// 		비즈니스 로직 처리 서비스 영역에 사용
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	private BoardDAOSpring boardDAO;
	

	public BoardServiceImpl() {
		System.out.println(">> BoardServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertBoard(BoardVO vo) {
		
		vo.setSeq(111);
		boardDAO.insertBoard(vo); //111 입력 성공
		
		
		vo.setSeq(111);
		boardDAO.insertBoard(vo); //111 입력 실패 - 최종적으로 롤백처리
		
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
		
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}

}
