<%@page import="com.smhrd.model.MemberDTO"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="com.smhrd.model.FarmhouseDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
    String mb_id = user_info.getMb_id();
	ArrayList<FarmhouseDTO> fh_dto= new FarmhouseDAO().getFarmhouseDTO(mb_id);
	for(FarmhouseDTO x : fh_dto){%>
		<p> x.getMb_id();
	<% }%>
	</p>
	<%	for(FarmhouseDTO x : fh_dto){%>
		<p> x.getfh_name();
	<% }%>
	</p>
		</p>
	<%	for(FarmhouseDTO x : fh_dto){%>
		<p> x.getfh_owner();
	<% }%>
	</p>
		<%	for(FarmhouseDTO x : fh_dto){%>
		<p> x.getagri_name();
	<% }%>
	</p>
</body>
</html>