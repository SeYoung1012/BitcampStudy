package polymorphism04;

import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser4 {

	public static void main(String[] args) {
		System.out.println("--- 스프링 컨테이너 구동전 ----");
		
		//1. 스프링 컨테이너 구동(스프링 설정 파일 읽어서)
	
		GenericApplicationContext factory = new GenericXmlApplicationContext("applicationContext_04.xml");
		
		System.out.println("---스프링 컨테이너 구동후 ----");
		
		//2. 스프링 컨테이너 사용 : 생성된 객체 요청(lookup)
		
		System.out.println("--tv 요청 사용 ---");
		TV tv = (TV)factory.getBean("tv4");
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		System.out.println("tv : " + tv);
		
		
		
		System.out.println("--- 스프링 컨테이너 사용 후 종료처리---");
		//3.스프링 컨테이너 종료(close)
		factory.close();
		
		
		
		
		
		
		
		

	}

}
