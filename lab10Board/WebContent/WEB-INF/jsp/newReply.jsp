<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="lab10Board.vo.ReplyVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
		String json = "[";
		ArrayList<ReplyVO> rvo = (ArrayList) request.getAttribute("replyList");	
			for (int i = 0; i < rvo.size(); i++) {
				json += "{\"content\":\""+rvo.get(i).getContent()+"\", \"writer\":\""+rvo.get(i).getWriter()+"\"}";			
				if (i != rvo.size() - 1)
					json += ",";
			}
	json += "]";
	%>
	<%=json%>
