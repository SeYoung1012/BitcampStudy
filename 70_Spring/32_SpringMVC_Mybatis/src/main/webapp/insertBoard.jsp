<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>

<style>
	#container { width: 700px; margin: 0 auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: lightblue; }
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>

	<div id="container">
		<h1>글등록</h1>
		<p><a href="logout.do">로그아웃</a> </p>
		<hr>
		
		
		<form action="insertBoard.do" method="post" enctype="multipart/form-data"> 
		<table>
			<tr>
				<th width="70">제목</th>
				<td>
					<input type="text" name="title" >
				</td>
			</tr>		
			<tr>
				<th >작성자</th>
				<td>
					<input type="text" name="writer" >
				</td>
			</tr>
			<tr>
				<th >내용</th>
				<td>
					<textarea name="content" rows="10" cols="40"></textarea>
				</td>
			</tr>
			<tr>
				<th>업로드</th>
				<td>
					<input type="file" name="uploadFile">
				</td>
			<tr>
			<tr>
				<td colspan="2" class="center">
					<input type="submit" value="새 글등록" >
				</td>
			</tr>
		</table>	
		
		</form>
		
		<p>
			<a href="getBoardList.do">글목록가기</a>
		</p>
	
	</div>
	



</body>
</html>