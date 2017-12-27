<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="lab10Board.vo.BoardVO"%>
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
<title>글 수정</title>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
</head>
<body>
<form action="modify.do">
<table border = "1" class="type03">
		<%
			ArrayList<BoardVO> list = (ArrayList<BoardVO>)request.getAttribute("article");
			if (list != null) {
				for (BoardVO vo : list) {
		%>
	 	<input type="hidden" name="seq" value="<%=vo.getSeq()%>"/>
		<tr>
			<th>글제목</th>
			<td><input type="text" name="title" value="<%=vo.getTitle()%>"></td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td><input type="text" name="writer" value="<%=vo.getWriter()%>"></td>
		</tr>
		<tr>
			<th>글내용</th>
			<td><input type="text" name="content" value="<%=vo.getContent()%>"></td>
		</tr>
		<%
			}
			}
		%>
<input type="submit" value="글수정">
</table>
</form>
</body>
</html>