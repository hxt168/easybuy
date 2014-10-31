package un.dez.easybuy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import un.dez.easybuy.biz.Factory;
import un.dez.easybuy.dao.*;
import un.dez.easybuy.entity.*;
import un.dez.easybuy.util.Pager;
import un.dez.easybuy.util.SystemContext;


public class OrderAction extends BaseAction {

	/*
	 *   /order/user_addOrder
	 */
	public void user_addOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String euRealName=request.getParameter("euRealName");
		String eoUserPhone=request.getParameter("euMobile");
		String eoUserAddress=request.getParameter("euAddress");
		String eoType=request.getParameter("eoType");
		ShoppingCart shoppingCart=(ShoppingCart)request.getSession().getAttribute("shoppingCart");
		User user=(User)request.getSession().getAttribute("loginUser");
		IProductdao pd=Factory.getProductdao();
		IOrderdao od=Factory.getOrderdao();
		int num=0;
		//System.out.println(3444);
		if(shoppingCart!=null&&euRealName!=null&&!"".equals(euRealName)&&eoUserPhone!=null&&eoType!=null)
		{
			boolean canBuy=true;
			//判断有没有商品库存不够
			for(Detail d:shoppingCart.getItems())
			{
				int stock=pd.getProductById(d.getProduct().getEpId()).getEpStock();
				if(stock<d.getEodQuantity())
				{
					canBuy=false;
					out.print("<script>alert('对不起，您想购买的"+d.getProduct().getEpName()+" 目前库存量只有"+stock+"了,请返回购物车修改此商品购买数量');location.href='"+request.getContextPath()+"/shopping/user_viewCart';</script>");
					return;
				}
				
				
			}
			
			Order order=new Order();
			order.setEoRealName(euRealName);
			order.setEoType(Integer.parseInt(eoType));
			order.setEoUserAddress(eoUserAddress);
			order.setEoUserPhone(eoUserPhone);
			order.setEoCost(shoppingCart.getTotalCost());
			order.setEoUser(user);
			order.setEoStatus(1);
			order.setList(shoppingCart.getItems());
			num=od.addOrderAndDetail(order);
			//商品库存减少，销量增加
			if(num!=0)
			{
				for(Detail d:shoppingCart.getItems())
				{
					pd.subStock(d.getProduct().getEpId(), d.getEodQuantity());
					pd.addSellAmount(d.getProduct().getEpId(), d.getEodQuantity());
				}
			}
		}
		if(num!=0)
		{
			request.getSession().removeAttribute("shoppingCart");
			response.sendRedirect(request.getContextPath()+"/shopping_result.jsp");
		}
		else{
			out.print("<script>alert('对不起，订单订购失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}

	/*
	 *   /order/manage_list
	 */
	public void manage_list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageOffset=request.getParameter("pager.offset");
		String eoStatus=request.getParameter("eoStatus");
		String eoUserAddress=request.getParameter("eoUserAddress");
		String eoRealName=request.getParameter("eoRealName");
		String date1=request.getParameter("date1");
		String date2=request.getParameter("date2");
		int offset=0;
		if(pageOffset!=null)
			offset=Integer.parseInt(pageOffset);
		SystemContext.setPageOffset(offset);
		SystemContext.setPageSize(7);
		Map<String,Object> m=new HashMap<String,Object>();
		if(eoStatus!=null&&!"".equals(eoStatus))
		{
			int status=Integer.parseInt(eoStatus);
			m.put("eoStatus",status);
		}
		if(eoUserAddress!=null&&!"".equals(eoUserAddress))
		{
			//System.out.println(eoUserAddress);
			//eoUserAddress=new String(eoUserAddress.getBytes("ISO-8859-1"),"utf-8");
			request.setAttribute("eoUserAddress", eoUserAddress);
			
			m.put("eoUserAddress", eoUserAddress);
		}
		if(eoRealName!=null&&!"".equals(eoRealName))
		{
			//eoRealName=new String(eoRealName.getBytes("ISO-8859-1"),"utf-8");
			request.setAttribute("eoRealName", eoRealName);
			m.put("eoRealName", eoRealName);
		}
		if(date1!=null&&!"".equals(date1))
		{
			m.put("date1", date1);
		}
		if(date2!=null&&!"".equals(date2))
		{
			m.put("date2", date2);
		}
		String nowUrl=request.getRequestURI();
		
	
		request.setAttribute("nowUrl", nowUrl);
		Pager<Order> orderlist=Factory.getOrderdao().getSearchListOrder(m);
		request.setAttribute("orderlist", orderlist);
		request.getRequestDispatcher("/manage/order.jsp").forward(request, response);
	}
	
	/*
	 *   /order/manage_del
	 */
	public void manage_del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String orderId=request.getParameter("oid");
		int num=0;
		if(orderId!=null)
		{
			int oid=Integer.parseInt(orderId);
			num=Factory.getOrderdao().delOrder(oid);
		}
		if(num!=0)
		{
			
			out.print("<script>alert('删除成功！');location.href='"+request.getContextPath()+"/order/manage_list';</script>");
		}
		else{
			out.print("<script>alert('对不起，删除失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
	
	
	/*
	 *   /order/manage_domodify
	 */
	public void manage_domodify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String orderId=request.getParameter("oid");
		String eoStatus=request.getParameter("eoStatus");
		String eoType=request.getParameter("eoType");
		String euAddress=request.getParameter("euAddress");
		String euMobile=request.getParameter("euMobile");
		String euRealName=request.getParameter("euRealName");
		
		int num=0;
		if(orderId!=null&&eoStatus!=null&&eoType!=null&&euAddress!=null&&euMobile!=null&&euRealName!=null)
		{
			int oid=Integer.parseInt(orderId);
			int status=Integer.parseInt(eoStatus);
			int type=Integer.parseInt(eoType);
			Order order=new Order();
			
			order.setEoId(oid);
			order.setEoStatus(status);
			order.setEoType(type);
			order.setEoUserPhone(euMobile);
			order.setEoUserAddress(euAddress);
			order.setEoRealName(euRealName);	
			
			num=Factory.getOrderdao().updateOrder(order);
		}
		
		
		if(num!=0)
		{
			
			out.print("<script>alert('修改成功！');location.href='"+request.getContextPath()+"/order/manage_list';</script>");
		}
		else{
			out.print("<script>alert('对不起，修改失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
	/*
	 *   /order/manage_modify
	 */
	public void manage_modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String orderId=request.getParameter("oid");
		if(orderId!=null)
		{
			int oid=Integer.parseInt(orderId);
			Order order=Factory.getOrderdao().getOrderById(oid);
			request.setAttribute("order", order);
			request.getRequestDispatcher("/manage/order_modify.jsp").forward(request, response);
		}
	}
	
	/*
	 *   /order/user_view
	 */
	public void user_view(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		User u=(User)request.getSession().getAttribute("loginUser");
		String oid=request.getParameter("oid");
		if(u!=null&&oid!=null)
		{
			
			
			Order order=Factory.getOrderdao().getOrderById(Integer.parseInt(oid));
			if(order!=null&&order.getEoUser().getEuUserId()==u.getEuUserId())
			{
				request.setAttribute("order", order);
				request.getRequestDispatcher("/userManage/order_view.jsp").forward(request, response);
				return;
			}
			out.print("您无权访问此页面！");
		}
		
	}

	
	
	/*
	 *   /order/user_list
	 */
	public void user_list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User u=(User)request.getSession().getAttribute("loginUser");
		
		String pageOffset=request.getParameter("pager.offset");
		if(u!=null)
		{
			int offset=0;
			if(pageOffset!=null)
				offset=Integer.parseInt(pageOffset);
			SystemContext.setPageOffset(offset);
			SystemContext.setPageSize(7);
			Pager<Order> orderlist=Factory.getOrderdao().getOrderByUserId(u.getEuUserId());
			if(orderlist.getData().size()==0)
				request.setAttribute("hasnull", 1);
			request.setAttribute("orderlist", orderlist);
			request.getRequestDispatcher("/userManage/order.jsp").forward(request, response);
		}
	}

}
