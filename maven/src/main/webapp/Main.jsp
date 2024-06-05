<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>	
<form action="joinmembership.jsp" method="post"> 
<p> 회원 아이디 : <input name="MB_ID" type="text" placeholder="아이디를 입력해주세요"> </p>
<p> 회원 비밀번호 : <input name="MB_PW" type="password" placeholder="비밀번호를 입력해주세요"> </p>
<p> 회원 이름 : <input name="MB_NAME" type="text" placeholder="이름을 입력해주세요"> </p>
<p> 회원 연락처 : <input name="MB_PHONE" type="text" placeholder="전화번호를 입력해주세요"> </p>
<p> 회원 농가정보 : <input name="MB_FARMHOUSE_INFO" type="text" placeholder="농가 정보를 입력해주세요"> </p>
<p> 회원 가입일짜 : <input name="JOINED_AT" type="date"> </p>
<p> 회원 구분 : <input name="MB_TYPE" type="" placeholder=""> </p>
</form>
</body>
</html>