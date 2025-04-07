<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Google 로그인 결과</title>
	<style>
        .logout-button {
            background-color: #fff; /* 배경색 */
            color: #4285F4; /* 글자색 */
            border: 1px solid #4285F4; /* 테두리 */
            padding: 10px 20px; /* 여백 */
            text-align: center; /* 가운데 정렬 */
            text-decoration: none; /* 밑줄 제거 */
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        .logout-button:hover {
            background-color: #f0f0f0; /* 마우스 오버 시 배경색 변경 */
        }
    </style>
</head>
<body>
    <h1>구글 로그인 성공</h1>
	<img src="<%= session.getAttribute("profilePictureUrl") %>" alt="프로필 사진">
    <p>사용자 이름: <%= session.getAttribute("name") %></p>
    <p>사용자 이메일: <%= session.getAttribute("email") %></p>
    <p>로그인한 시간: <%= session.getAttribute("loginTime") %></p>
    
    <!-- 로그아웃 버튼 -->
    <a class="logout-button" href="<%= request.getContextPath() %>/GoogleLogoutServlet">로그아웃</a>
</body>
</html>