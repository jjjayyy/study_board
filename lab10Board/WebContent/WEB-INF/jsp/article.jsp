<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="lab10Board.vo.BoardVO"%>
<%@ page import="lab10Board.vo.ReplyVO" %>
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
table.type02 {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  margin : 20px 10px;
}
table.type02 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #fff;
    border-left: 1px solid #fff;
    background: #eee;
}
table.type02 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글</title>

<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script>
//수정, 삭제시 비밀번호 입력
function pwAlert(){
		var pw = prompt("비밀번호 입력");
		if(pw==1111){
			} else {
		    alert("비밀번호를 다시 입력해주세요");		    
			}
		};
		
//댓글 입력 AJAX활용
 $(function(){
 	$('#reg').hide();
	$('#reply').click(function (){
	
//댓글 입력 텍스트 창 생성
			var repl ="";
				
			 	repl += "<table id='typing'>"
				repl += "<tr><td>작성자</td><td>내용</td></tr>"
				repl += "<tr><td><input type='text' id='writer'><input type='text' id='content'></td></tr>"
				repl += "</table>"
			
			$('#replyWrite').append(repl);
			$('#reply').hide();
			$('#reg').show();
			$('#reg').on("click", function() {

			$.ajax({
					type: 'post', 
					async:true,
					url: 'insertReply.do',
					data: {  "boardSeq" : $("[name='seq']").val(), 
						  	"writer" : $('#writer').val(),
						   "content" : $('#content').val()},
					success: function(data){
						alert("성공"); 
					    	
//getJSON 활용
/* 						var writer = $('#writer').val();
						   var content = $('#content').val();
						   var url = "insertReply.do?writer="  +writer+ "&content=" +content+"&boardSeq=" + $("[name='seq']").val(); 
						  
						   $.getJSON(url, function(data){
	 				 	alert("json"); */
	 				 	
	 					var html=""; 
							$(data).each(function(key, value){
								alert("성공"); 
								html += "<tr><td>" + value.writer + "</td><td>" + value.content + "</td></tr>";
							
							});
							$('#replyTable'). append(html); 
//	 					 	}); 
														  	
							 	$('#typing').remove();
								$('#reg').hide();
								$('#reply').show();
 	 				 	},
					error: function(data){
						alert("에러");
					}
			});
			}); 
		});
 });
	
</script>
</head>
<body>
		<%
			ArrayList<BoardVO> list = (ArrayList<BoardVO>)request.getAttribute("article");
				if (list != null) {
			for (BoardVO vo : list) {
		%>
		
<!-- 글 수정 버튼 -->
<form id="modifyText" action="modifyForm.do">
<input type="submit" onclick="pwAlert()" value="글수정">
<input type="hidden" name="seq2" value="<%=vo.getSeq()%>"/>
</form>

<!-- 글삭제 버튼 -->
<form name=article action="delete.do">
<table border = "1" class = "type03">
<input type="submit" onclick="pwAlert()" value="글삭제">
<input type="hidden" name="seq" value="<%=vo.getSeq()%>"/>
	 	
		<tr>
			<th>글제목</th>
			<td><%=vo.getTitle()%></td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td><%=vo.getWriter()%></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=vo.getRegdate()%></td>
		</tr>
		<tr>
			<th>글내용</th>
			<td><%=vo.getContent()%></td>
		</tr>
		<%
			}
			}
		%>
</table>
</form>

<!-- 댓글 목록 -->
	<table border=1 class=type02>
		<div id=replyTable>
		댓글 <br/>
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<% ArrayList<ReplyVO> relist = (ArrayList<ReplyVO>)request.getAttribute("reply");
			if(relist != null){
				for(ReplyVO vo : relist){
		%>

		<tr>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getContent()%></td>
			<td><%=vo.getRegdate()%></td>
		</tr>
		
		<% }} %>
			</div>
	</table>
<!-- 댓글 입력 창 -->
<div id=replyWrite>
</div>
<button id=reply>댓글등록</button>
<button id=reg>등록완료</button>
</body>
</html>