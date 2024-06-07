<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>농가 목록</title>
</head>
<body>
    <h2>농가 목록</h2>
    <%
        ArrayList<FarmhouseDTO> fh_dto_list = (ArrayList<FarmhouseDTO>) request.getAttribute("fh_dto_list");

        if (fh_dto_list != null) {
            for (FarmhouseDTO dto : fh_dto_list) {
                String mb_id = dto.getMb_id();
                String fh_name = dto.getFh_name();
    %>
                <p>
                    <iframe src="S_NameCardCon?mb_id=<%= mb_id %>&fh_name=<%= fh_name %>"><%= fh_name %>""></iframe>
                </p>
    <%
            }
        } else {
    %>
            <p>농가 정보가 없습니다.</p>
    <%
        }
    %>
</body>
</html>
