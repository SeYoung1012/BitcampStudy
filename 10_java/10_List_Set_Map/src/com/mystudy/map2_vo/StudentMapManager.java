package com.mystudy.map2_vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

public class StudentMapManager {

	public static void main(String[] args) {
		// 1. 3명의 학생데이터(성명,국어,영어,수학)를
		// StudentVO 클래스를 이용해서 만들고(저장하고)
		// "홍길동", 100, 90, 81
		// "이순신", 95, 88, 92
		// "김유신", 90, 87, 77
		// ---------------------
		// 2. Map<String, StudentVO> 타입의 변수(map)에 저장하고
		// 3. map에 있는 데이터를 사용해서 화면출력
		// 성명 국어 영어 수학 총점 평균
		// --------------------------
		// 홍길동 100 90 81 270 90.33
		// ...
		// -----------------------------
		// 4. 저장된 map에 있는 김유신 학생의 국어 점수를 90점으로 수정
		// 5. "김유신" 학생의 성적만 화면 출력
		// 5-2 "김유신" 학생의 성명, 총점, 평균 화면을 출력
		// -----------------------------------------------
		
		
		// 1. 3명의 학생데이터(성명,국어,영어,수학)를 StudentVO 타입으로 생성
		
		StudentVO stu1 = new StudentVO( "홍길동", 100, 90, 81 );
		StudentVO stu2 =  new StudentVO("이순신", 95, 88, 92 );
		StudentVO stu3 =  new StudentVO("김유신", 90, 87, 77 );
		
		//2.Map<String, StudentVO> 타입의 변수(map)에 저장하고
		
		Map<String, StudentVO> map = new HashMap<>();
		map.put(stu1.getName(), stu1);
		map.put(stu2.getName(), stu2);
		map.put(stu3.getName(), stu3);
		System.out.println(map);
		
		//위의 3명의 데이터를 list에 입력하고 Map 타입으로 전환하기(개인별로)
		List<StudentVO> list = new ArrayList<>();
		list.add(stu1);
		list.add(stu2);
		list.add(stu3);
		
		Object obj = list.get(1);
		System.out.println("list1.get(1) : " + obj);
		
		
		
		// 3. map에 있는 데이터를 사용해서 전체 화면출력 - values 를 씀.
		//Collection <StudentVO> values = map.values(); //여러번 쓸 때.
		
		for(StudentVO student : map.values()) {
			student.printData(); //한 번만 사용할 때.
			
		}
		
		
		//4. 저장된 map에 있는 김유신 학생의 국어 점수를 95점으로 수정
		System.out.println(map.containsKey("김유신"));
		StudentVO vo = map.get("김유신");
		System.out.println(">>변경 전 : " + vo.getName()+ "-" +vo);
		vo.setKor(95);
		System.out.println(">>변경 후 : "+ vo.getName()+ "-" + vo);
		
		//5. "김유신" 학생의 성적만 화면 출력
		vo.printData();
		
		// 5-2. "김유신" 학생의 성적, 총점, 평균 출력
		System.out.println("---" + vo.getName() + "성적-----");
		System.out.println("성명 :" + vo.getName());		
		System.out.println("국어 :" + vo.getKor());		
		System.out.println("영어 :" + vo.getEng());		
		System.out.println("수학 :" + vo.getMath());		
		System.out.println("총점 :" + vo.getTot());		
		System.out.println("평균 :" + vo.getAvg());		
		
		
		
		
		
		

	}

}
