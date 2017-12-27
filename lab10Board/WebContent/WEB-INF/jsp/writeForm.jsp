<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 작성</title>
</head>
<body>
<form name="writeForm" action="write.do">
<table border = "1" class="type03">
		<tr>
			<th>글제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td><input type="text" name="writer"></td>
		</tr>
		<tr>
			<th>글내용</th>
			<td><input type="text" name="content"></td>
		</tr>
</table>
<input type="submit" value="글쓰기">
</form>
</body>
</html>