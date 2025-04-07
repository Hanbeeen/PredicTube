package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.ServiceData;


public class ServiceDAO {

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
	
	public int ServiceRegister(ServiceData service_data) {
		String REGISTER_SQL = "insert into service (username, email, channel_id, title, filename, category, sub_count, result, serviceDate) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		int result = 0;
		
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(REGISTER_SQL);
			pstmt.setString(1, service_data.getUsername());
			pstmt.setString(2, service_data.getEmail());
			pstmt.setString(3, service_data.getChannel_id());
			pstmt.setString(4, service_data.getTitle());
			pstmt.setString(5, service_data.getFilename());
			pstmt.setInt(6, service_data.getCategory());
			pstmt.setInt(7, service_data.getSub_count());
			pstmt.setString(8, service_data.getResult());
			pstmt.setTimestamp(9, service_data.getServiceDate());
			
			result = pstmt.executeUpdate();
			pstmt.close();
	        conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
