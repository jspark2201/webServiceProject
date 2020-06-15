<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="event" class="user.UserBean" scope="request" />

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이벤트 내용</h2>
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
	</table>
	<br><a href="/teamproject/Login?action=list">메인페이지로 돌아가기</a>
</body>
</html>