package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.smhrd.model.FarmhouseDAO;
import com.smhrd.model.FarmhouseDTO;

import java.util.ArrayList;
import java.util.List;

@WebServlet("/S_NameCardCon")
public class NameCardCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("NameCardCon 서비스 메서드 시작");

        request.setCharacterEncoding("UTF-8");

        String mb_id = request.getParameter("mb_id");
        System.out.println("받은 mb_id: " + mb_id);

        if (mb_id == null || mb_id.isEmpty()) {
            System.out.println("mb_id가 null이거나 빈 문자열입니다.");
            response.sendRedirect("SFarm_main.jsp");
            return;
        }

        FarmhouseDAO f_dao = new FarmhouseDAO();
        ArrayList<FarmhouseDTO> farm_name = f_dao.getFarmhouse(mb_id);

        System.out.println("받은 농장 이름 목록: " + farm_name);

        if (farm_name == null || farm_name.isEmpty()) {
            System.out.println("명함 발급을 위한 필요한 정보가 없습니다.");
            response.sendRedirect("SFarm_main.jsp");
            return;
        }

        List<String> qrPaths = new ArrayList<>();
        for (FarmhouseDTO fh_dto : farm_name) {
            String fh_name = fh_dto.getFh_name();
            String encoded_fh_name = URLEncoder.encode(fh_name, StandardCharsets.UTF_8.toString());
            String url = "http://192.168.0.25:8081/maven/SFarmStoryCon?fh_name=" + encoded_fh_name;

            ServletContext context = getServletContext();
            String qr_path = "/images/" + fh_name + ".png";
            String realPath = context.getRealPath(qr_path);

            // Ensure the directory exists
            Path imagePath = Paths.get(context.getRealPath("/images"));
            if (!Files.exists(imagePath)) {
                Files.createDirectories(imagePath);
            }

            try {
                System.out.println("Generating QR code for URL: " + url);
                System.out.println("QR code will be saved at: " + realPath);
                generateQRCodeImage(url, 300, 300, realPath);
                qrPaths.add(qr_path);
            } catch (WriterException e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("farm_name", farm_name);
        request.setAttribute("qrPaths", qrPaths);
        request.getRequestDispatcher("namecard.jsp").forward(request, response);
    }

    private void generateQRCodeImage(String text, int width, int height, String filePath)
            throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        Path path = Paths.get(filePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
    }
}
