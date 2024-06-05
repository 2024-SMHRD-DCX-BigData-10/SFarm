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
	
	
	if (user_info !=null) {
	%>
	<h1><%=user_info.getMb_name() %> 환영합니다.
	</h1>
			<hr>
		<h1>농가등록</h1>
	<form action="S_JoinFarmCon" method="post">
		<p>
			농가명 : <input name="fh_name" type="text" placeholder="농가 이름 입력">
		</p>
		<p>
			대표자 : <input name="fh_owner" type="text"
				placeholder="">
		</p>
				<p>
			<button>품목추가</button>
			
			품명 : <input name="agri_names" type="text"
				placeholder="">
			품명 : <input name="agri_names" type="text"
				placeholder="">
			품명 : <input name="agri_names" type="text"
				placeholder="">
		</p>
<p>	<input type="submit" type="submit" value="JoinUs"
					class="button fit"></p>
	</form>
	<hr>
	<%
	} else{
	%>
	<h1>로그인 해주세요</h1>


	<h1>회원가입</h1>
	<form action="S_JoinCon" method="post">
		<p>
			회원 아이디 : <input name="mb_id" type="text" placeholder="아이디를 입력해주세요">
		</p>
		<p>
			회원 비밀번호 : <input name="mb_pw" type="password"
				placeholder="비밀번호를 입력해주세요">
		</p>
		<p>
			회원 이름 : <input name="mb_name" type="text" placeholder="이름을 입력해주세요">
		</p>
		<p>
			회원 연락처 : <input name="mb_phone" type="text"
				placeholder="전화번호를 입력해주세요">
		</p>
		<p>
			회원 농가정보 : <input name="farm_info" type="text"
				placeholder="농가 정보를 입력해주세요">
		</p>
		<p>
			회원 구분 : <input name="mb_type" type="text" placeholder="농가회원  or 소비자">
		</p>
				<p>
		<input type="submit" type="submit" value="JoinUs"
					class="button fit">
		</p>
	</form>
	
	<hr>
		<h1>로그인</h1>
	<form action="S_LoginCon" method="post">
		<p>
			회원 아이디 : <input name="mb_id" type="text" placeholder="아이디를 입력해주세요">
		</p>
		<p>
			회원 비밀번호 : <input name="mb_pw" type="password"
				placeholder="비밀번호를 입력해주세요">
		</p>
<p>	<input type="submit" type="submit" value="JoinUs"
					class="button fit"></p>
	</form>
		<%} %>

	

		
</body>
</html>