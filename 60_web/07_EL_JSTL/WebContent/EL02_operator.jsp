<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> EL 연산자</title>
</head>
<body>
	<h1> EL : 문자열 연산자, 비교연산자, 논리연산자</h1>
	<h2> 문자열 붙이기</h2>
	<p> "Hello" + "World" -----> "Hello World"</p>
	<p> 표현식 : "Hello" + "World" -> <%="Hello" + "World" %></p>
	<%-- <p> EL : "Hello" + "World" -> ${"Hello" + "World"}</p>--%>
	
	<h3> EL 문자열 붙이기 += 기호 사용</h3>
	<p> EL : "Hello" + "World" -> ${"Hello" += "World"}</p>
	<p> EL : "Hello" + "World" -> ${"Hello"}  &nbsp;&nbsp; ${"World"}</p>
	<hr><hr>
	
	<h2> EL 비교 연산자</h2>
	<p>비교 연산자 (부호) : ==, != < , >, <=, >= 사용가능 </p>
	<p> 비교 연산자(영문) : eq, ne, lt, gt, le, ge 추가로 사용가능 </p>
	<p>100 > 50 : ${ 100 > 50 }</p>
	<p>100 gt 50 : ${ 100 gt 50 }</p>
	
	<p> 100 >=  50 : ${100 >= 50  } </p>
	<p> 100 ge  50 : ${100 ge 50  } </p>
	
	
	<p> 100 ==  50 : ${100 == 50  } </p>
	<p> 100 eq  50 : ${100 eq 50  } </p>
	<hr><hr>
	
	<h2> EL 논리 연산자 : &&, || , !, and, or, not</h2>
	<p>100 > 50 && 200 > 10 : ${ 100 > 50 && 200 > 10}</p>
	<p>100 > 50 and 200 > 10 : ${ 100 > 50 and 200 > 10}</p>
	<p>100 gt 50 and 200 gt 10 : ${ 100 gt 50 and 200 gt 10}</p>
	
	<p>!(100 > 50 && 200 > 10 ) : ${!(100 > 50 && 200 > 10 ) } </p>
	<p>not (100 > 50 && 200 > 10 ) : ${not(100 > 50 && 200 > 10 ) } </p>
	
	
	
</body>
</html>