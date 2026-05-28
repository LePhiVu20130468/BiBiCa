package vn.edu.hcmuaf.fit.bibica.utils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.BodyPublishers;

public class GoogleUtils {
    public static final String GOOGLE_CLIENT_ID = "813885466812-6g7keicudc5rbeu1i4j5nqfo6rfrbrpu.apps.googleusercontent.com";
    public static final String GOOGLE_CLIENT_SECRET = "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";
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/bookstore/signin-google"; // URL servlet xử lý
    public static final String GOOGLE_LINK_GET_TOKEN = "https://oauth2.googleapis.com/token";
    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static final String GOOGLE_GRANT_TYPE = "authorization_code";

    public static String getToken(String code) throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        String params = "client_id=" + GOOGLE_CLIENT_ID +
                "&client_secret=" + GOOGLE_CLIENT_SECRET +
                "&redirect_uri=" + GOOGLE_REDIRECT_URI +
                "&code=" + code +
                "&grant_type=" + GOOGLE_GRANT_TYPE;

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(GOOGLE_LINK_GET_TOKEN))
                .header("Content-Type", "application/x-www-form-urlencoded")
                .POST(BodyPublishers.ofString(params))
                .build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        // Parse JSON để lấy access_token
        JsonObject jobj = new Gson().fromJson(response.body(), JsonObject.class);
        return jobj.get("access_token").getAsString();
    }

    public static GooglePojo getUserInfo(String accessToken) throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(link))
                .GET()
                .build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        return new Gson().fromJson(response.body(), GooglePojo.class);
    }
}