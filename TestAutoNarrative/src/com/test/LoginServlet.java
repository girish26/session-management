package com.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("In get Method");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("logoutRequest")!=null&&request.getParameter("logoutRequest").equals("yes")){
			request.getSession().invalidate();
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		System.out.println("userName is--> "+userName+"\npassword--->> "+password);
		if(userName.equals("girish")&&password.equals("pass$1234")){
			request.getSession().setAttribute("userName", userName);
			request.getRequestDispatcher("landingPage.jsp").forward(request, response);
		}else
			request.getRequestDispatcher("login.jsp?valid=no").forward(request, response);
	}
	}
}
