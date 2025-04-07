<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Google 로그인</title>
</head>
<body>
    <h1>Google 로그인</h1>
    <a href="<%= generateGoogleLoginURL() %>">
        <img src="https://developers.google.com/identity/images/btn_google_signin_dark_normal_web.png" alt="Google 로그인">
    </a>

    <%!
        // Google 로그인 URL 생성 함수
        private String generateGoogleLoginURL() {
            String clientId = "224149760852-jmujm1mbr46c9bo4l3748nf074b0bio1.apps.googleusercontent.com"; // 여기에 클라이언트 ID를 설정합니다.
            String redirectUri = "http://localhost:8080/GoogleLogin/GoogleLoginServlet"; // 위에서 설정한 리디렉션 URI와 일치해야 합니다.
            String scope = "email profile openid"; // 필요한 권한 범위를 설정합니다.

            // Google OAuth 2.0 로그인 URL 생성
            String googleLoginURL = "https://accounts.google.com/o/oauth2/auth" +
                "?client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&response_type=code" +
                "&scope=" + scope +
                "&access_type=offline";

            return googleLoginURL;
        }
    %>
</body>
</html>