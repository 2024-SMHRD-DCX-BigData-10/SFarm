package com.smhrd.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.smhrd.model.FarmhouseDAO;
import com.smhrd.model.FarmhouseDTO;
import com.smhrd.model.MemberDTO;

import java.util.ArrayList;

@WebServlet("/S_NameCardCon")
public class NameCardCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("NameCardCon");

        request.setCharacterEncoding("UTF-8");
        String moveURL = null;

        HttpSession session = request.getSession();
        MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
        System.out.println(user_info.getMb_id());

        if (user_info == null) {
            moveURL = "Main.jsp";
            System.out.println("명함발급안됨");
            response.sendRedirect(moveURL);
        } else {
            String mb_id = user_info.getMb_id();
            FarmhouseDAO dao = new FarmhouseDAO();
            ArrayList<FarmhouseDTO> fh_dto = dao.getFarmhouseDTO(mb_id);

            if (fh_dto.size() > 0) {
                String fh_name = fh_dto.get(0).getFh_name();
                String url = "http://yourdomain.com/namecard.jsp?mb_id=" + mb_id + "&fh_name=" + fh_name;

                ServletContext context = getServletContext();
                String realPath = context.getRealPath("/images/qrcode.png");
                
                // Ensure the directory exists
                Path imagePath = Paths.get(context.getRealPath("/images"));
                if (!Files.exists(imagePath)) {
                    Files.createDirectories(imagePath);
                }

                try {
                    generateQRCodeImage(url, 300, 300, realPath);
                    request.setAttribute("qrCodePath", "images/qrcode.png");
                    request.setAttribute("mb_id", mb_id);
                    request.setAttribute("fh_name", fh_name);
                    moveURL = "namecard.jsp";
                } catch (WriterException e) {
                    e.printStackTrace();
                    moveURL = "Main.jsp";
                }
            } else {
                moveURL = "Main.jsp";
                System.out.println("농가 정보가 없습니다.");
            }
            request.getRequestDispatcher(moveURL).forward(request, response);
        }
    }

    private void generateQRCodeImage(String text, int width, int height, String filePath)
            throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        Path path = Paths.get(filePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
    }
}
