package com.mystudy.list1_arraylist;

import java.util.ArrayList;

import java.util.Collections;
import java.util.List;

public class ArrayListExam { // 그냥 ArrayList 라고 클래스명을 만들면 자바에 있는 ArrayList는 사용 불가

	public static void main(String[] args) {
		// ArrayList : Array(배열) 의 속성을 가진 List(목록)
		ArrayList list1 = new ArrayList(); // = ArrayList<?> list1 = new ArrayList(); 모든 데이터타입 다 받아서 사용 가능
		System.out.println("list1.size() : " + list1.size());

		// 입력 : 맨뒤에 추가
		list1.add(new Integer(5));
		list1.add(1); // int -> Integer 자동형변환 되어 입력처리됨
		list1.add(5);
		list1.add(6);
		list1.add(7);
		System.out.println(list1.toString());

		// 입력 : 지정된 특정 위치에 데이터 추가
		list1.add(0, 100); // 인데스 위치에 데이터 추가(삽입)
		System.out.println("0번 인덱스에 100 add : " + list1.toString());

		// 수정 : 지정된 위치의 데이터 수정(변경)
		list1.set(0, 999); // 인덱스 위치의 데이터 변경(수정)
		System.out.println("0번 인덱스에 999 set : " + list1.toString());

		// set : 존재하지 않는 인덱스 접근시 IndexOutOfBoundsException 예외발생
		// list1.set(100, 999); // 인덱스 위치의 데이터 변경(수정)
		// System.out.println("100번 인덱스에 999 set : " + list1.toString());

		// 삭제 : 특정 위치의 데이터 삭제
		list1.remove(0); // 인덱스 위치 데이터 삭제
		System.out.println("0번 인덱스 remove : " + list1.toString());

		// 검색, 조회(R) : 특정 위치에 데이터 읽기 (조회, 검색, 확인)
		Object obj = list1.get(0);
		System.out.println("list1.get(0) : " + obj);

		System.out.println("-----------------");
		Collections.reverse(list1); // 데이터를 단순히 뒤집는 것
		System.out.println("reverse 후 : " + list1);

		System.out.println("list1.subList(1, 4) + " + list1.subList(1, 4));

		ArrayList list2 = new ArrayList(list1.subList(1, 4));
		System.out.println("list2 : " + list2);

		System.out.println("-----Collection.sort()-------");
		System.out.println("list1 : " + list1);
		Collections.sort(list1); // 오름차순 정렬
		System.out.println("list1 : " + list1);

		System.out.println("-----Collection.reverse()-------");
		Collections.reverse(list1); 
		System.out.println("list1 : " + list1);

		System.out.println("===================");
		System.out.println("list1 : " + list1);
		System.out.println("list2 : " + list2);

		list2.add("BB");
		list2.add("TEST");
		System.out.println("list2 : " + list2);

		System.out.println("첫 데이터 : " + list2.get(0));
		System.out.println("list2.size() : " + list2.size());
		System.out.println("마지막 데이터 : " + list2.get(list2.size() - 1));
		System.out.println("list2 : " + list2);

		int list2Cnt = list2.size();
		for (int i = 0; i < list2Cnt; i++) {
			System.out.println(i + " - " + list2.get(i));
		}

		printData(list2);
		printData("list2", list2);
//	      printData("list3", new ArrayList());
//	      ArrayList list4 = null;
		//
//	      printData("list4", list4);

		// 데이터가 있는지 여부 확인
		System.out.println("list2.contains(5) : " + list2.contains(5));

		System.out.println("-------list2의 데이터를 전체 삭제--------");
		printData("list2 삭제 전 : ", list2);

		// 맨 앞에 있는 데이터 삭제
//	      int b = list2.size();   -> 사이즈 값이 변화되면 안되니까 따로 저장해줌
//	      for(int i = 0; i < b; i++) {
//	         list2.remove(0);
//	      }

//	      for(int i = 1; i < 5; i++) {
//	         list2.remove(0);
//	      }

//	      list2.remove(0);
//	      list2.remove(0);
//	      list2.remove(0);
//	      list2.remove(0);
//	      list2.remove(0);
		// list2.removeAll(list2);

		// 맨 뒤쪽에 있는 데이터를 삭제
//	      list2.remove(4); // size : 5, 인덱스 번호 : size -1
//	      list2.remove(3); // size : 4, 인덱스 번호 : size -1
//	      list2.remove(2); // size : 3, 인덱스 번호 : size -1
//	      list2.remove(1); // size : 2, 인덱스 번호 : size -1
//	      list2.remove(0); // size : 1, 인덱스 번호 : size -1

		// 이게 제일 효율적
//	      int lastIndex = list2.size() - 1;
//	      for(int i = lastIndex; i >= 0; i--) {
//	         list2.remove(i);
//	      }

//	      int listCount = list2.size();
//	      for(int i = 0; i < listCount; i++) {
//	         list2.remove(list2.size() - 1 ); // 마지막 인덱스 
//	      }

		list2.clear();

		printData("list2 삭제 후 : ", list2);

	}

	static void printData(List list) {
		if (list == null || list.size() < 1)
			return;
		System.out.print(list.get(0));
		for (int i = 1; i < list.size(); i++) {
			System.out.print(", " + list.get(i));
		}
		System.out.println();
	}

	static void printData(String title, List list) {
		// if(list == null || list.size() < 1) return;
		if (list == null) {
			System.out.println(title + ": null");
			return;
		}
		if (list.size() < 1) {
			System.out.println(title + " : 데이터건수 0");
			return;
		}
		System.out.print(title + " : " + list.get(0));
		for (int i = 1; i < list.size(); i++) {
			System.out.print(", " + list.get(i));
		}
		System.out.println();
	}

}