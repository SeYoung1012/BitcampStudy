package jdbc.store.view;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class BookViewer {
	
	private BookDAO BookDAO;
	private Scanner scan;
	
	public BookViewer() {
		BookDAO = new BookDAO();
		scan = new Scanner(System.in);
	}
	
	public void bookMenu() {
		
		while (true) {
			
			System.out.println("1. 모든 책 목록 보기 "
					+ "2. 책 제목으로 검색 3. 작가로 검색 "
					+ "4. 출판사로 검색 5. 분류별 검색 "
					+ "6. 책 정보 입력하기 7. 책 정보 수정하기 "
					+ "8. 책 정보 삭제하기");
			
			System.out.println("메뉴를 선택해주세요");
			System.out.print(">> ");
			int userChoice = scan.nextInt();
			
			if (userChoice == 1) {
		        selectAll();
		    } else if (userChoice == 2) {
		        selectName();
		    } else if (userChoice == 3) {
		        selectWriter();
		    } else if (userChoice == 4) {
		        selectPublisher();
		    } else if (userChoice == 5) {
		        selectClassfication();
		    } else if (userChoice == 6) {
		    	insert();
		    } else if (userChoice == 7) {
		        update();
		    } else if (userChoice == 8) {
			    delete();
		    } else {
		    	System.out.println("처음으로 돌아갑니다");
	            break;
		    }
		}
	}
	
	public void selectAll() {

	         BookDAO = new BookDAO();
	         List<BookVO> list = new ArrayList<BookVO>();
	         list = BookDAO.selectAll();
	         for (BookVO vo : list) {
	            System.out.println(vo);
	         }
	}
	
	public void selectName() {

	         BookDAO = new BookDAO();
	         List<BookVO> list = new ArrayList<BookVO>();
	         
	         System.out.println("제목을 입력해 주세요");
	         System.out.print(">> ");
	         String name = scan.nextLine();
	         list = BookDAO.selectName(name);
	         for (BookVO vo : list) {
	            System.out.println(vo);
	         }
	}
	
	public void selectWriter() {

	         BookDAO = new BookDAO();
	         List<BookVO> list = new ArrayList<BookVO>();
	         
	         System.out.println("작가를 입력해 주세요");
	         System.out.print(">> ");
	         String writer = scan.nextLine();
	         list = BookDAO.selectWriter(writer);
	         for (BookVO vo : list) {
	            System.out.println(vo);
	         }
	}
	
	public void selectPublisher() {

	         BookDAO = new BookDAO();
	         List<BookVO> list = new ArrayList<BookVO>();
	         
	         System.out.println("출판사를 입력해 주세요");
	         System.out.print(">> ");
	         String publisher = scan.nextLine();
	         list = BookDAO.selectPublisher(publisher);
	         for (BookVO vo : list) {
	            System.out.println(vo);
	         }
	}
	
	public void selectClassfication() {

	         BookDAO = new BookDAO();
	         List<BookVO> list = new ArrayList<BookVO>();
	         
	         System.out.println("분야를 입력해 주세요");
	         System.out.print(">> ");
	         String classfi = scan.nextLine();
	         list = BookDAO.selectClassfication(classfi);
	         for (BookVO vo : list) {
	            System.out.println(vo);
	         }
	}
	
	
	public void insert() {

		System.out.println("새로운 책 정보 등록을 시작합니다");
		System.out.println();
		
		System.out.println("책 아이디를 입력하세요");
		System.out.print(">> ");
	    String BookId = scan.next();
	    
	    System.out.println("책 제목을 입력하세요");
		System.out.print(">> ");
	    String BookName = scan.next();
	    
	    System.out.println("작가를 입력하세요");
		System.out.print(">> ");
	    String BookWriter = scan.next();
	    
	    System.out.println("출판사를 입력하세요");
		System.out.print(">> ");
	    String BookPublisher = scan.next();
	    
	    System.out.println("책 분류를 입력하세요");
		System.out.print(">> ");
	    String BookClassfication = scan.next();
	    
	    System.out.println("책 가격을 입력하세요");
		System.out.print(">> ");
	    String BookPrice = scan.next();
	    
	    System.out.println("책 등록일을 입력하세요");
		System.out.print(">> ");
	    String BookReleasdate = scan.next();
	    	    
	    BookVO vo = new BookVO(BookId, BookName, BookWriter, BookPublisher, BookClassfication, BookPrice, BookReleasdate);
	    
	    int result = BookDAO.insert(vo);

	    if (result == 1) {
	       System.out.println("책 정보 등록 완료");
	    } else {
	       System.out.println("책 정보 등록 실패");
	    }

	 }


	   public void update() {
		   
		   System.out.println("수정할 책의 아이디를 입력해주세요");
		   System.out.print(">> ");
		   String bid = scan.next();
		      
		   System.out.println("수정할 책의 제목을 입력해주세요");
		   System.out.print(">> ");
		   String bname = scan.next();
		      
		   System.out.println("수정할 책의 작가를 입력해주세요");
		   System.out.print(">> ");
		   String bwriter = scan.next();
		      
		   System.out.println("수정할 책의 출판사를 입력해주세요");
		   System.out.print(">> ");
		   String bpubl = scan.next();
		      
		   System.out.println("수정할 책의 분류를 입력해주세요");
		   System.out.print(">> ");
		   String bclass = scan.next();
		      
		   System.out.println("수정할 책의 가격을 입력해주세요");
		   System.out.print(">> ");
		   String bprice = scan.next();
		      
		   System.out.println("수정할 책의 등록일을 입력해주세요");
		   System.out.print(">> ");
		   String bdate = scan.next();
		      
		   BookVO vo = new BookVO(bid, bname, bwriter, bpubl, bclass, bprice, bdate);
		  
		   System.out.println(vo);
	   }


	   public void delete() {

	         System.out.println("삭제할 책의 아이디를 쓰세요.");
	         String bid = scan.next();
	         BookDAO.delete(bid);

	   }
	

}
