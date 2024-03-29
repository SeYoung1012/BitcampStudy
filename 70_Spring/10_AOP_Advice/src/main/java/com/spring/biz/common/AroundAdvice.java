package com.spring.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;

public class AroundAdvice {
	
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		//핵심 메소드 실행 전
		
		System.out.println("[Around BEFORE] 비즈니스 로직 실행 전 처리");
		Object returnObj = pjp.proceed(); //조인 포인트 메소드 실행
		
		//핵심 메소드 실행 후
		
		System.out.println("[Around AFTER] 비즈니스 로직 실행 후 처리");
		
		return returnObj;
	}

}
