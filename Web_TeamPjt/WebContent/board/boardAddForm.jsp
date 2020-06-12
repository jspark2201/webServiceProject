<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idea add</title>
</head>
<body>아이디어 작성</h1>

<form action="<%=request.getContextPath()%>/board/boardAddAction.jsp" method="post"  enctype="multipart/form-data">
    <div>Title : </div>
    <div><input name="title" id="title" type="text"/></div>
    <div><label for = "platform">플랫폼 : </label>
        <input type = "checkbox" name = "platform" value = "web">web
        <input type = "checkbox" name = "platform" value = "android">android
        <input type = "checkbox" name = "platform" value = "embeded">embeded
		<input type = "checkbox" name = "platform" value = "ios">ios
    </div>
    <div>
    <label for = "genre">장르 : </label>
        <input type = "checkbox" name = "genre" value = "health">health
        <input type = "checkbox" name = "genre" value = "psychology">psychology
        <input type = "checkbox" name = "genre" value = "game">game
    </div>
    <div>boardContent : </div>
    <div><textarea name="content" id="content" rows="5" cols="50"></textarea></div>
       <div><input type="file" name="filename1" size=40></div>
    
    <div>requirements : </div>
    <div><textarea name="requirements" id="requirements" rows="5" cols="50"></textarea></div>

    <div>
        <input type="submit" value="글입력"/>
        <input type="reset" value="초기화"/>
    </div>
</form>

</body>
</html>