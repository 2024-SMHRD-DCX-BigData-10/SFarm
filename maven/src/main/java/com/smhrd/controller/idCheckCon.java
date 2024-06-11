package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.MemberDAO;

@WebServlet("/idCheckCon")
public class idCheckCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mb_id = request.getParameter("mb_id");
        System.out.println(mb_id + " check");

        boolean idCheck = new MemberDAO().idCheck(mb_id);
        String result;
        if (idCheck) {
            result = "사용할 수 없는 아이디입니다.";
        } else {
            result = "사용 가능한 아이디입니다.";
        }

        response.setContentType("application/text; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(result);
    }
}
