<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="event" class="User.User" scope="request" />

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>개인정보조회</h2>
	<table border=1>
	<tr>
		<td>아이디</td>
		<td><jsp:getProperty name="event" property="id" /> 
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><jsp:getProperty name="event" property="pwd" /> 
		</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td><jsp:getProperty name="event" property="nickname" /> 
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><jsp:getProperty name="event" property="email" /> 
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><jsp:getProperty name="event" property="number" /> 
		</td>
	</tr>
	<tr>
		<td>플랫폼</td>
		<td><jsp:getProperty name="event" property="platform" /> 
		</td>
	</tr>
	<tr>
		<td>흥미분야</td>
		<td><jsp:getProperty name="event" property="genre" /> 
		</td>
	</tr>
	</table>
	<br><a href="/teamproject/mypage">마이페이지로 돌아가기</a>
</body>
</html>