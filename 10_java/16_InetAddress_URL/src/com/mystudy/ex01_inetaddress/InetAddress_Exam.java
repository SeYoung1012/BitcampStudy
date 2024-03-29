package com.mystudy.ex01_inetaddress;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class InetAddress_Exam {

	public static void main(String[] args) throws UnknownHostException {
		//InetAddress : IP 주소 관련 클래스
		InetAddress iaddr = InetAddress.getLocalHost();
		System.out.printf("호스트 이름: %s\n",iaddr);
		System.out.println("호스트명: " +iaddr.getHostName());
		System.out.println("호스트 IP주소 :" + iaddr.getHostAddress());
		//-------------------------------
		
		System.out.println("---네이버 주소 검색---");
		iaddr = InetAddress.getByName("www.naver.com"); // 도메인명
		System.out.printf("호스트 이름: %s\n",iaddr);
		System.out.println("호스트명: " +iaddr.getHostName());
		System.out.println("호스트 IP주소 :" + iaddr.getHostAddress());
		
		System.out.println("---네이버 IP주소들 검색---");
		InetAddress[] iaArr = InetAddress.getAllByName("www.naver.com");
		
		for(InetAddress ia : iaArr) {
			System.out.println("호스트명 : " + ia.getHostName());
			System.out.println("호스트 IP주소 : " + ia.getHostAddress());
		}
		
		
		
		
	}

}
