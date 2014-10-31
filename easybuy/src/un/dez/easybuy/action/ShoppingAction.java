package un.dez.easybuy.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import un.dez.easybuy.biz.Factory;
import un.dez.easybuy.entity.*;

@SuppressWarnings("serial")
public class ShoppingAction extends BaseAction {
	
	public void viewCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//ShoppingCart shoppingCart=(ShoppingCart) request.getSession().getAttribute("shoppingCart");
		request.getRequestDispatcher("/shopping.jsp").forward(request, response);
	}
	/*
	 * /shopping/user_check
	 */
	public void user_check(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User u=(User)request.getSession().getAttribute("loginUser");
		//if(u==null)
			//u=Factory.getUserdao().searchUser("admin", "123");
		System.out.println(u.getEuRealName());
		System.out.println(u.getEuAddress());
		request.getSession().setAttribute("loginUser", u);
		request.getRequestDispatcher("/shopping_check.jsp").forward(request, response);
	}
	
	//  /shopping/addDetail?pid=1
	public void addDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String pid=request.getParameter("pid");
		if(pid==null||"".equals(pid))
			return;
		Product product=Factory.getProductdao().getProductById(Integer.parseInt(pid));
		ShoppingCart shoppingCart=(ShoppingCart) request.getSession().getAttribute("shoppingCart");
		if(shoppingCart==null)
		{
			shoppingCart=new ShoppingCart();
		}
		shoppingCart.addDetail(product, 1);
		request.getSession().setAttribute("shoppingCart", shoppingCart);
		response.sendRedirect(request.getContextPath()+"/shopping/viewCart");
	}
	
	// 加入购物车 /shopping/addDetailShopping?pid=1
	public void addDetailShopping(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String pid=request.getParameter("pid");
		if(pid==null||"".equals(pid))
			return;
		Product product=Factory.getProductdao().getProductById(Integer.parseInt(pid));
		ShoppingCart shoppingCart=(ShoppingCart) request.getSession().getAttribute("shoppingCart");
		if(shoppingCart==null)
		{
			shoppingCart=new ShoppingCart();
		}
		shoppingCart.addDetail(product, 1);
		request.getSession().setAttribute("shoppingCart", shoppingCart);
		
		//response.sendRedirect(request.getContextPath()+"/shopping/viewCart");
		out.write("true");
	}
	
	public void delDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String shopDid=request.getParameter("did");
		PrintWriter out=response.getWriter();
		if(shopDid==null||"".equals(shopDid))
			return;
		ShoppingCart shoppingCart=(ShoppingCart) request.getSession().getAttribute("shoppingCart");
		if(shoppingCart==null)
		{
			out.write("false");
			return;
		}
		shoppingCart.removeDetail(Integer.parseInt(shopDid));
		request.getSession().setAttribute("shoppingCart", shoppingCart);
		out.write("true");
		out.flush();
		out.close();
	}
	
	public void modifyDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String shopDid=request.getParameter("did");
		String count=request.getParameter("count");
		if(shopDid==null||"".equals(shopDid)||count==null||"".equals(count))
			return;
		ShoppingCart shoppingCart=(ShoppingCart) request.getSession().getAttribute("shoppingCart");
		if(shoppingCart==null)
		{
			//out.write("false");
			return;
		}
		shoppingCart.modifyDetailQuantity(Integer.parseInt(shopDid), Integer.parseInt(count));
		request.getSession().setAttribute("shoppingCart", shoppingCart);
		out.write(count);
		out.flush();
		out.close();
		
	}
	
	
}
