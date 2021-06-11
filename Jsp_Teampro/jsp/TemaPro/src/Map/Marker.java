package Map;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapmarking")
public class Marker extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		
		requset.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String addr2 = requset.getParameter("addr2");
		response.getWriter().write(new MapDBManage().marking(addr2) + "");
		
	}
}