<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="lab10Board.vo.BoardVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script>
//페이지 로드
$(function(){
	$('.pageNumber').load(function(){
		var totalPage = "${totalPage}";
		var countPage = 10;		
	})
})
</script>
</head>
<body>
<form action="writeForm.do">
<table border = "1" class="type09">
		<thead>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		</thead>
		<tbody>
			<%
			ArrayList<BoardVO> list = (ArrayList<BoardVO>)request.getAttribute("list");
			if (list != null) {
				for (BoardVO vo : list) {			
			 String param = "seq=" + vo.getSeq();
			%>
		<tr>
			<th><%=vo.getSeq()%></th>
			<td><a href=article.do?<%=param%>><%=vo.getTitle()%></a></td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getCnt() %></td>
		</tr>
		<%
			}
			}
		%>
		</tbody>
</table>
<input type="submit" value="글작성">
</form>
<!-- 검색 옵션 -->
<form action="search.do">
<select name="selectOne">
	<option value="byTitle">제목</option>
	<option value="byContent">내용</option>
	<option value="byWriter">글쓴이</option>
</select>
<input type="text" name="searchText">
<input type="submit" value="검색">
</form>
<!-- 페이지 넘버 -->
<div name="pageNumber">
<%
	int totalCount =(Integer)request.getAttribute("totalPage");
	int count = 10;
	int totalPage = totalCount/count;
	int currentPage = (Integer)request.getAttribute("currentPage");
	if(totalCount%count>0){
		totalPage += 1;
	}
	for(int i=1; i<=totalPage;i++){
		 String param = "index=" + i;
		 if(currentPage==i*10){
%>
			<b><%=i %></b>			 
<%		 } else { %>	
<a href=board.do?<%=param%>><%=i%></a>
	<%}} %>
</div>
</form>
</body>
</html>