<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="writeAction.jsp">
		<table class="table">
			<thead>
				<tr>
					<th>쪽지 보내기</th>		
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><textarea placeholder="내용" name="noteContent" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="전송">
	</form>
	
</body>
</html>