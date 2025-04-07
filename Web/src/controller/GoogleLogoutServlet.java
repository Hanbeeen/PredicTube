package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/GoogleLogoutServlet")
public class GoogleLogoutServlet extends HttpServlet {
    // 로그아웃 서블릿
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션 무효화
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        // 로그아웃 후 다른 작업 수행 (예: 로그아웃 성공 페이지로 리디렉션)
        response.sendRedirect("/GoogleLogin/index.jsp");
    }
}
