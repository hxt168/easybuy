package un.dez.easybuy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import un.dez.easybuy.entity.User;



public class Check implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest reg, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("½øÈëurl¼ì²â");
		HttpServletRequest request=(HttpServletRequest)reg;


		String url=request.getRequestURI();
		String act=null;
		if(url.lastIndexOf("/")!=-1)
			act=url.substring(url.lastIndexOf("/"));
		
		System.out.println(act);
		
		if(act!=null&&act.indexOf("user")==1)
		{
			this.loginCheck(reg, res, chain);
			return;
		}else if(act!=null&&act.indexOf("manage")==1)
		{
			this.adminCheck(reg, res, chain);
			return;
		}
		
		chain.doFilter(reg, res);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	public void loginCheck(ServletRequest reg, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("¼ì²âloginUser");
		HttpServletRequest request=(HttpServletRequest)reg;
		HttpSession session=request.getSession();
		User u=(User)session.getAttribute("loginUser");
		
		if(u!=null)
		{
			chain.doFilter(reg, res);
			return;
		}
		((HttpServletResponse)res).sendRedirect(request.getContextPath()+"/login.jsp");
		
	}
	
	public void adminCheck(ServletRequest reg, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("¼ì²âadminlogin");
		HttpServletRequest request=(HttpServletRequest)reg;
		HttpSession session=request.getSession();
		User u=(User)session.getAttribute("loginUser");
		
		if(u!=null&&u.getEuStatus()==2)
		{
			chain.doFilter(reg, res);
			return;
		}
		((HttpServletResponse)res).sendRedirect(request.getContextPath()+"/login.jsp");
		
	}

}
