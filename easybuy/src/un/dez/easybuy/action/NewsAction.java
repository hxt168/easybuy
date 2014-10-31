package un.dez.easybuy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import un.dez.easybuy.biz.Factory;
import un.dez.easybuy.dao.*;
import un.dez.easybuy.entity.News;
import un.dez.easybuy.util.Pager;
import un.dez.easybuy.util.SystemContext;

public class NewsAction extends BaseAction {

	public void viewbyid(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		String enid=request.getParameter("id");
		INewsdao nd=new Newsdao();
		News news=nd.select(Integer.parseInt(enid));
		
		System.out.println(news.getEnTitle());
		
		System.out.println(enid);
		request.setAttribute("news", news);
		request.getRequestDispatcher("/news_view.jsp").forward(request, response);
	}
	
	public void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				
		String pageOffset=request.getParameter("pager.offset");
		int offset=0;
		if(pageOffset!=null)
			offset=Integer.parseInt(pageOffset);
		SystemContext.setPageOffset(offset);
		SystemContext.setPageSize(12);  //每页显示条数
		INewsdao nd=new Newsdao();
		Pager<News> pager = nd.getPagerLists();
		
		String nowUrl=request.getRequestURI();
		request.setAttribute("nowUrl", nowUrl);
		request.setAttribute("pager", pager);
		request.getRequestDispatcher("/news_list.jsp").forward(request, response);
	}
	
	
	public void manage_list(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		String pageOffset=request.getParameter("pager.offset");
		int offset=0;
		if(pageOffset!=null)
			offset=Integer.parseInt(pageOffset);
		SystemContext.setPageOffset(offset);
		SystemContext.setPageSize(10);  //每页显示条数
		INewsdao nd=new Newsdao();
		Pager<News> pager = nd.getPagerLists();
		
		String nowUrl=request.getRequestURI();
		request.setAttribute("nowUrl", nowUrl);
		request.setAttribute("pager", pager);
		request.getRequestDispatcher("/manage/news.jsp").forward(request, response);
	}
	
	public void manage_add(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//INewsdao nd = Factory.getNesdao();
		//List<News> newsList = nd.getNewsListByCount(7);
		//request.setAttribute("newsList",newsList);
		request.getRequestDispatcher("/manage/news_add.jsp").forward(request, response);
	}
	
	public void manage_doadd(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		PrintWriter out = response.getWriter();
	
		String enTitle = request.getParameter("title");
		String enContent = request.getParameter("content");
		int num = 0;
		if(enTitle != null&&!"".equals(enTitle) && enContent != null){
			
				INewsdao nd = Factory.getNesdao();
				News news = new News();
				news.setEnTitle(enTitle);
				news.setEnContent(enContent);
				num = nd.add(news);
			
		}
		if(num!=0)
		{
			
			out.print("<script>alert('添加成功！');location.href='"+request.getContextPath()+"/news/manage_list';</script>");
		}
		else{
			out.print("<script>alert('对不起，添加失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
	
	public void manage_domodify(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String enId=request.getParameter("id");
		String enTitle = request.getParameter("title");
		String enContent = request.getParameter("content");
		INewsdao ns = Factory.getNesdao();
		int num=0;
		if(enId != null&&enTitle!=null){
			int newsid = Integer.parseInt(enId);
			News news=new News();
			news.setEnId(Integer.parseInt(enId));
			news.setEnTitle(enTitle);
			news.setEnContent(enContent);
			num=ns.update(news);
			
		}
		if(num!=0)
		{
			
			out.print("<script>alert('添加成功！');location.href='"+request.getContextPath()+"/news/manage_list';</script>");
		}
		else{
			out.print("<script>alert('对不起，添加失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
		
	}
	//   /news/manage_modify
	public void manage_modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

				String id=request.getParameter("id");
				if(id!=null)
				{
					int nid=Integer.parseInt(id);
					INewsdao nd = Factory.getNesdao();
					News news=nd.select(nid);
					request.setAttribute("news",news);
					request.getRequestDispatcher("/manage/news_modify.jsp").forward(request, response);
				}
			}
	
	public void manage_dodel(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String newsid = request.getParameter("enId");
		int num=0;
		
		if(newsid == null){
			int nid = Integer.parseInt("newsid");
			INewsdao ns = Factory.getNesdao();
			List<News> newsList = ns.getNewsByEnid(nid);
			
			if(num!=0)
			{
				
				out.print("<script>alert('删除成功！');location.href='"+request.getContextPath()+"/news/manage_list';</script>");
			}
			else{
				out.print("<script>alert('对不起，删除失败！');history.go(-1);</script>");
			}
			out.flush();
			out.close();
		}
	}
}