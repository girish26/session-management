package com.test;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class TimeOutFilter
 */
@WebFilter("/TimeOutFilter")
public class TimeOutFilter implements Filter {

    /**
     * Default constructor. 
     */
    public TimeOutFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("------------------In destroy--------------------");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("In filter doFilter method");
		HttpServletRequest httpRequest=(HttpServletRequest) request;
		HttpSession session=httpRequest.getSession(false);
		//System.out.println(httpRequest.getSession().getAttribute("userName"));
		if(session==null ){
			System.out.println("---------------------Session timeout----------------------");
			request.getRequestDispatcher("sessionExpired.jsp").forward(request, response);
		}else{
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("In filter init method");
	}

}
