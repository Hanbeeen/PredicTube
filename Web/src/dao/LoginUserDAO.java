package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.LoginUser;

public class LoginUserDAO {

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/AIdear?useUnicode=true&characterEncoding=UTF-8";
		String user = "root";
		String password = "1234";
		
		return DriverManager.getConnection(url, user, password);
	}
	
	public int UserRegister(LoginUser login_user) {
		String REGISTER_SQL = "insert into users (username, email, loginDate) values (?, ?, ?)";
		
		int result = 0;
		
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(REGISTER_SQL);
			pstmt.setString(1, login_user.getUsername());
			pstmt.setString(2, login_user.getEmail());
			pstmt.setTimestamp(3, login_user.getLoginDate());
			
			result = pstmt.executeUpdate();
			pstmt.close();
	        conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
