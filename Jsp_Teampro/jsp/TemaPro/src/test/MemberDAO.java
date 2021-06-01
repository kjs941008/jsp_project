package test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberDBManage;

@WebServlet("/MemberDAO")
public class MemberDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		
		requset.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = requset.getParameter("userID");
		response.getWriter().write(new MemberDBManage().IdCheck(userID) + "");
		
	}
}