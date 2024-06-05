<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// session에 user_info가 있는지 없는지 확인 
	MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
	String logresult = (String) session.getAttribute("logresult");
  if  (user_info.getMb_id().equals("fail")){%>
		 <h1>로그인 해주세요</h1>	
<% } else%>
		 <h1><%=user_info.getMb_id() %>님 환영합니다.</h1>	

	
<h1>회원가입</h1>	
<form action="JoinCon method="post"> 
<p> 회원 아이디 : <input name="mb_id" type="text" placeholder="아이디를 입력해주세요"> </p>
<p> 회원 비밀번호 : <input name="mb_pw" type="password" placeholder="비밀번호를 입력해주세요"> </p>
<p> 회원 이름 : <input name="mb_name" type="text" placeholder="이름을 입력해주세요"> </p>
<p> 회원 연락처 : <input name="mb_phone" type="text" placeholder="전화번호를 입력해주세요"> </p>
<p> 회원 농가정보 : <input name="farm_info" type="text" placeholder="농가 정보를 입력해주세요"> </p>
<p> 회원 가입일짜 : <input name="join_at" type="date"> </p>
<p> 회원 구분 : <input name="mb_type" type="" placeholder=""> </p>
</form>
</body>
</html>