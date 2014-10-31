package un.dez.easybuy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Ecoding implements Filter {
	String e="";

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if(e==null||"".equals("e")){
			e="UTF-8";
		}
		System.out.println("±àÂë¹ýÂËing");
		request.setCharacterEncoding(e);
		response.setContentType("text/html;charset="+e);
		chain.doFilter(request, response);

	}

	
	public void init(FilterConfig config) throws ServletException {
		 e=config.getInitParameter("initParam");
	}

}
