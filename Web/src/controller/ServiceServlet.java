package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ServiceDAO;
import model.ServiceData;

@WebServlet("/ServiceServlet")
public class ServiceServlet extends HttpServlet {
	public static boolean isNumeric(String str) {
	    // 臾몄���댁�� null ���� 鍮� 臾몄���댁�� 寃쎌�곗���� �レ��濡� ���⑦��吏� ����
	    if (str == null || str.isEmpty()) {
	        return false;
	    }

	    // 臾몄���댁�� 紐⑤�� 臾몄��媛� �レ���몄� 寃���
	    for (char c : str.toCharArray()) {
	        if (!Character.isDigit(c)) {
	            return false;
	        }
	    }

	    // 紐⑤�� 臾몄��媛� �レ���� 寃쎌�곗��留� true 諛���
	    return true;
	}
	private ServiceDAO serviceDAO;
	
	@Override
	public void init() throws ServletException {
		super.init();
		serviceDAO = new ServiceDAO();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String realPath = "C:\\SelfStudyJava\\PredicTube\\WebContent\\Images";
		int maxSize = 5 * 1024 * 1024;
		String encType = "UTF-8";
		
	      HttpSession session = request.getSession();
	      String username = (String)session.getAttribute("name");
	      String email = (String)session.getAttribute("email");
	      
	      MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());
	      
	      Enumeration files = multi.getFileNames();
	      String fname = (String) files.nextElement();
	      String filename = multi.getFilesystemName(fname);
	      

	      String prevalue = multi.getParameter("predicted_value");
	      System.out.println("prevalue: "+prevalue);
	      
	      String channel_id = multi.getParameter("channelID");
	      System.out.println("channel_id: "+channel_id);
	      
	      String title = multi.getParameter("title");
	      // ��洹��� �⑦��: �뱀��臾몄�� 諛� �대え吏� ��嫄�
	      String regexPattern = "[^\\p{L}\\p{N}\\s]+";
	        
	      // �⑦�닿낵 留ㅼ묶
	      Pattern pattern = Pattern.compile(regexPattern);
	      Matcher matcher = pattern.matcher(title);
	        
	      // 留ㅼ묶�� �뱀��臾몄�� 諛� �대え吏� ��嫄�
	      String filteredText = matcher.replaceAll("");
	        
	      System.out.println("���� ���ㅽ��: " + title);
	      System.out.println("���곕��� ���ㅽ��: " + filteredText);

	      String categoryValue = multi.getParameter("category");
	       System.out.println("category: " + categoryValue);
	       
	      Integer category = Integer.parseInt(categoryValue);
	      System.out.println("Integer category: "+category);
	      
	      String sub_count = multi.getParameter("sub_count");
	      System.out.println("sub_count: "+sub_count);
	      
	      long ServiceTime = System.currentTimeMillis();
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      String formattedDate = sdf.format(new Date(ServiceTime));
	      java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(formattedDate);
	      
	      ServiceData service_data = new ServiceData();
	      service_data.setUsername(username);
	      service_data.setEmail(email);
	      service_data.setChannel_id(channel_id);
	      service_data.setTitle(filteredText);
	      service_data.setFilename(filename);
	      service_data.setCategory(category);
	      if (sub_count == null)
	         service_data.setSub_count(-1);
	      else
	         service_data.setSub_count(Integer.parseInt(sub_count));
	      
	      service_data.setResult(prevalue);
	      
	      service_data.setServiceDate(timestamp);
	      
	      if (username != null) {
	    	  serviceDAO.ServiceRegister(service_data);
	      }
	      
//	      response.sendRedirect(request.getContextPath() + "/index.jsp");
	      
	   }
	

}
