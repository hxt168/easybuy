package un.dez.easybuy.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import un.dez.easybuy.biz.Factory;
import un.dez.easybuy.entity.*;
import un.dez.easybuy.util.*;

@SuppressWarnings("serial")
public class CommentAction extends BaseAction {
	public void list(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		SystemContext.setPageSize(8);
		String pageOffset=request.getParameter("pager.offset");
		if(pageOffset==null)
			pageOffset="0";
		SystemContext.setPageOffset(Integer.parseInt(pageOffset));
		//User user = (User)request.getSession().getAttribute("loginUser");
		Pager<Comment> pager = Factory.getCommentdao().getAllComments();
		List<Comment> comments = pager.getData();
		
		request.setAttribute("nowUrl", request.getRequestURL());
		request.setAttribute("pager", pager);
		request.setAttribute("comments", comments);
		request.getRequestDispatcher("/guestbook.jsp").forward(request, response);
	}
	
	public void manage_list(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		SystemContext.setPageSize(6);
		String pageOffset=request.getParameter("pager.offset");
		if(pageOffset==null)
		pageOffset="0";
		SystemContext.setPageOffset(Integer.parseInt(pageOffset));
		//User user = (User)request.getSession().getAttribute("loginUser");
		Pager<Comment> pager = Factory.getCommentdao().getAllComments();
		List<Comment> comments = pager.getData();
		
		request.setAttribute("nowUrl", request.getRequestURL());
		request.setAttribute("pager", pager);
		request.setAttribute("comments", comments);
		request.getRequestDispatcher("/manage/guestbook.jsp").forward(request, response);
}
	
	 public void _add(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String nickname = request.getParameter("ecNickName");
		String content = request.getParameter("ecContent");
		
		Date ecCreateTime = new Date();
		
		Comment comment = new Comment();
		comment.setEcNickName(nickname);
		comment.setEcContent(content);
		comment.setEcReply("");
		comment.setEcCreateTime(ecCreateTime);
		
		int num=Factory.getCommentdao().addComment(comment);
		if(num!=0)
		{
			out.print("<script>alert('添加成功');location.href='"+request.getContextPath()+"/comment/list';</script>");
		}else{
			out.print("<script>alert('添加失败！');history.go(-1);</script>");
		}
		
		//request.getRequestDispatcher("guestbook.jsp").forward(request, response);
	}
	
	 
	 public void manage_up(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		 int id = Integer.parseInt(request.getParameter("id"));
		 Comment com=Factory.getCommentdao().load(id);
		 request.setAttribute("comment", com);
		 request.getRequestDispatcher("/manage/guestbook_modify.jsp").forward(request, response);
	 }
	 
	public void manage_update(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		 int id = Integer.parseInt(request.getParameter("ecId"));
	
		 String replyContent = request.getParameter("replyContent");
		 
	/*	 Comment comment = new Comment();
		 comment.setEcId(id);
		 comment.setEcReply(replyContent);*/
		 
		 PrintWriter out = response.getWriter();
		 int num = Factory.getCommentdao().update(id,replyContent);
		 if(num!=0)
			{
				out.print("<script>alert('回复成功');location.href='"+request.getContextPath()+"/comment/manage_list';</script>");
			}else{
				out.print("<script>alert('回复失败！');location.go(-1);</script>");
			}
	 }
	
	public void manage_del(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		String ecid=request.getParameter("ecId");
		int num=0;
		if(ecid!=null)
		{
			int id=Integer.parseInt(ecid);
			num=Factory.getCommentdao().delComment(id);
		}
		if(num!=0)
		{
			
			out.print("<script>alert('删除成功！');location.href='"+request.getContextPath()+"/comment/manage_list';</script>");
		}
		else{
			out.print("<script>alert('对不起，删除失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}
