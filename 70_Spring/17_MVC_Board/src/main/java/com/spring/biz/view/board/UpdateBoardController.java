package com.spring.biz.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.biz.view.controller.Controller;

public class UpdateBoardController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		 
		System.out.println(">>> 게시글 수정");
         // 1. 전발받은 데이터 추출(확인)
         String seq = request.getParameter("seq");
         String title = request.getParameter("title");
         String writer = request.getParameter("writer");
         String content = request.getParameter("content");
         
         // 2. DB연동처리(입력)
         BoardVO vo = new BoardVO();
         vo.setSeq(Integer.parseInt(seq));
         vo.setTitle(title);
         vo.setWriter(writer);
         vo.setContent(content);
         
         BoardDAO boardDAO = new BoardDAO();
         boardDAO.updateBoard(vo);
	
       //3. 화면네비게이션(목록페이지로 이동)
 		//response.sendRedirect("getBoardList.do");
 		
		
		return "getBoardList.do";
	}

}
