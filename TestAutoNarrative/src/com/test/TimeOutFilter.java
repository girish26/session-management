package com.test;

import java.io.IOException;
import java.util.ArrayList;

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
	

	private ArrayList<String> urlList;
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException{
		
		System.out.println("In filter doFilter method");
		HttpServletRequest httpRequest=(HttpServletRequest) request;
		/*HttpServletResponse httpResponse = (HttpServletResponse) response;
		String url = ((HttpServletRequest) request).getServletPath();
		boolean allowedRequest = false;
		
		if(urlList.contains(url)) {
			allowedRequest = true;
		}
			
		if (!allowedRequest) {
			HttpSession session = httpRequest.getSession(false);
			if (null == session) {
				request.getRequestDispatcher("sessionExpired.jsp").forward(request, response);
			}
		}
		
		chain.doFilter(request, response);
		
		*/
		String url=((HttpServletRequest) request).getServletPath();
		System.out.println(url);		
		if(!url.equals("/login.jsp")){
			HttpSession session=httpRequest.getSession(false);		
			//System.out.println(httpRequest.getSession().getAttribute("userName"));
			if(session==null ){
				System.out.println("---------------------Session timeout----------------------");
				request.getRequestDispatcher("sessionExpired.jsp").forward(request, response);
				return;
			}
		
			chain.doFilter(request, response);
		}else
			chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig config) throws ServletException {
		System.out.println("In filter init method");
		String urls = config.getInitParameter("avoid-urls");
		System.out.println(urls);
		/*if(urls!=null){
			urlList.add(urls);
		}*/
		/*	StringTokenizer token = new StringTokenizer(urls, ",");

		urlList = new ArrayList<String>();

		while (token.hasMoreTokens()) {
			urlList.add(token.nextToken());

		}*/
	}

}
