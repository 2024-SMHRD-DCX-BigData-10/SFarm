package com.smhrd.controller;

import okhttp3.*;
import org.json.JSONObject;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.concurrent.TimeUnit;

@WebServlet("/GenerateImage")
public class OpenAIImageGenerator extends HttpServlet {
    private static final String API_KEY = System.getenv("OPENAI_API_KEY");

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 디버깅을 위해 API 키를 콘솔에 출력 (프로덕션 코드에서는 절대 하지 마세요)
        System.out.println("API Key: " + API_KEY);

        String prompt = request.getParameter("prompt");
        if (prompt != null && !prompt.isEmpty()) {
            String imageUrl = generateImage("farmimage");
            BufferedImage image = downloadImage(imageUrl);
            BufferedImage transparentImage = makeImageTransparent(image, 0.5f);
            response.setContentType("image/png");
            ImageIO.write(transparentImage, "png", response.getOutputStream());
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or empty prompt parameter");
        }
    }

    public static String generateImage(String prompt) throws IOException {
        OkHttpClient client = new OkHttpClient.Builder()
            .connectTimeout(30, TimeUnit.SECONDS)
            .writeTimeout(30, TimeUnit.SECONDS)
            .readTimeout(30, TimeUnit.SECONDS)
            .build();

        MediaType mediaType = MediaType.parse("application/json");
        JSONObject json = new JSONObject();
        json.put("prompt", prompt);
        json.put("n", 1);
        json.put("size", "1024x1024");

        String jsonBody = json.toString();

        RequestBody body = RequestBody.create(mediaType, jsonBody);

        Request request = new Request.Builder()
                .url("https://api.openai.com/v1/images/generations")
                .post(body)
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", "Bearer " + API_KEY)
                .build();

        try (Response response = client.newCall(request).execute()) {
            String responseBody = response.body().string();
            if (!response.isSuccessful()) {
                System.err.println("Error: " + responseBody);
                throw new IOException("Unexpected code " + response);
            }

            JSONObject responseJson = new JSONObject(responseBody);
            return responseJson.getJSONArray("data").getJSONObject(0).getString("url");
        }
    }

    public static BufferedImage downloadImage(String imageUrl) throws IOException {
        URL url = new URL(imageUrl);
        try (InputStream in = url.openStream()) {
            return ImageIO.read(in);
        }
    }

    public static BufferedImage makeImageTransparent(BufferedImage image, float transparency) {
        BufferedImage transparentImage = new BufferedImage(
                image.getWidth(), image.getHeight(), BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = transparentImage.createGraphics();
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, transparency));
        g2d.drawImage(image, 0, 0, null);
        g2d.dispose();
        return transparentImage;
    }
}

