package un.dez.easybuy.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class BaseAction extends HttpServlet {

	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String act=request.getRequestURL().substring(request.getRequestURL().lastIndexOf("/")+1);
		//String act=url.substring(url.indexOf("_")+1);
		
		System.out.println(act);
		try {
			Method m=this.getClass().getMethod(act, HttpServletRequest.class,HttpServletResponse.class);
			m.invoke(this, request,response);
			
			
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	
}
