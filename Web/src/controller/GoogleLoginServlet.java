package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.util.Date;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.net.URL;
import java.text.SimpleDateFormat;

import org.json.JSONObject;

import dao.LoginUserDAO;
import model.LoginUser;

@WebServlet("/GoogleLoginServlet")
public class GoogleLoginServlet extends HttpServlet {
	
	private LoginUserDAO userDAO;
	
	@Override
	public void init() throws ServletException {
		super.init();
		userDAO = new LoginUserDAO();
	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자가 로그인한 후 Google에서 제공한 인증 코드
        String code = request.getParameter("code");
        response.setCharacterEncoding("UTF-8");

        if (code != null) {
            // 인증 코드를 사용하여 Google에서 액세스 토큰을 가져오는 코드
        	// Google OAuth 2.0 엔드포인트 및 인증 정보
        	String tokenUrl = "https://accounts.google.com/o/oauth2/token";
        	String CLIENT_ID = System.getenv("GOOGLE_CLIENT_ID");
            String CLIENT_SECRET = System.getenv("GOOGLE_CLIENT_SECRET");
        	String redirectUri = "http://localhost:8080/GoogleLogin/GoogleLoginServlet";

        	// 액세스 토큰 요청을 위한 POST 데이터
        	String postData = "code=" + code + "&client_id=" + clientId + "&client_secret=" + clientSecret
        	    + "&redirect_uri=" + redirectUri + "&grant_type=authorization_code";

        	// HTTP POST 요청으로 액세스 토큰 가져오기
        	HttpURLConnection tokenConnection = (HttpURLConnection) new URL(tokenUrl).openConnection();
        	tokenConnection.setDoOutput(true);
        	tokenConnection.setRequestMethod("POST");
        	tokenConnection.getOutputStream().write(postData.getBytes("UTF-8"));

        	// 액세스 토큰 가져오기
        	InputStream tokenResponse = tokenConnection.getInputStream();
        	String tokenJson = new BufferedReader(new InputStreamReader(tokenResponse))
        	    .lines().collect(Collectors.joining());
        	
        	// JSON 응답에서 액세스 토큰 추출
        	String accessToken = new JSONObject(tokenJson).getString("access_token");
        	
            // 여기서 사용자 정보를 가져오는 코드를 추가
            String userInfoUrl = "https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken;
            HttpURLConnection userInfoConnection = (HttpURLConnection) new URL(userInfoUrl).openConnection();
            userInfoConnection.setRequestProperty("Accept-Charset", "UTF-8");
            InputStream userInfoResponse = userInfoConnection.getInputStream();
            String userInfoJson = new BufferedReader(new InputStreamReader(userInfoResponse, "UTF-8"))
                .lines().collect(Collectors.joining());
            
            // JSON 응답에서 사용자 정보와 프로필 사진 URL 추출
            String userEmail = new JSONObject(userInfoJson).getString("email");
            String userName = new JSONObject(userInfoJson).getString("name");
            String userProfilePictureUrl = new JSONObject(userInfoJson).getString("picture");
            
            // 로그인 성공 시간을 저장하는 변수
        	long loginTime = System.currentTimeMillis();
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	String formattedDate = sdf.format(new Date(loginTime));
        	java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(formattedDate);
            
            // 사용자 정보를 DB에 저장하기 위해 model 세팅
            LoginUser login_user = new LoginUser();
            login_user.setUsername(userName);
            login_user.setEmail(userEmail);
            login_user.setLoginDate(timestamp);
            
            // 사용자 정보를 DB에 저장
            userDAO.UserRegister(login_user);
            
            
            // 사용자 정보를 얻은 후 세션에 저장
            HttpSession session = request.getSession();
            session.setAttribute("profilePictureUrl", userProfilePictureUrl);
            session.setAttribute("name", userName);
            session.setAttribute("email", userEmail);
            session.setAttribute("loginTime", timestamp);
            
            // 사용자 정보를 request 속성에 저장
//            request.setAttribute("profilePictureUrl", userProfilePictureUrl); // 프로필 사진 URL
//            request.setAttribute("name", userName); // 사용자 이름
//            request.setAttribute("email", userEmail); // 사용자 이메일
//            request.setAttribute("loginTime", formattedLoginTime); // 로그인 성공 시간

            
            // Google 로그인 성공 페이지로 이동 (result.jsp)
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            
        } else {
            // 로그인하지 않은 상태로 페이지 로드
            response.sendRedirect("/GoogleLogin/google_login_check.jsp");
        }
    }
}