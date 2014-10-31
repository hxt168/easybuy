package un.dez.easybuy.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import un.dez.easybuy.biz.Factory;
import un.dez.easybuy.dao.ICategorydao;
import un.dez.easybuy.dao.IParentCategorydao;
import un.dez.easybuy.dao.IProductdao;
import un.dez.easybuy.entity.*;

@SuppressWarnings("serial")
public class CategoryAction extends BaseAction {
	
	public void manage_view(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id=request.getParameter("id");
		System.out.println(id);
		
	}
	
	//   category/manage_list
	public void manage_list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<ParentCategory> pc=Factory.getParentCategorydao().getListAllContainCategory();
		request.setAttribute("pc", pc);
		request.getRequestDispatcher("/manage/productClass.jsp").forward(request, response);
		
	}
	
//  category/manage_add
	public void manage_add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		IParentCategorydao pd=Factory.getParentCategorydao();
		List<ParentCategory> pcList=pd.getAllList();
		request.setAttribute("pcList", pcList);
		request.getRequestDispatcher("/manage/productClass_add.jsp").forward(request, response);
		
	}
	
//  category/manage_doadd
	public void manage_doadd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String parentId=request.getParameter("parentId");
		String name=request.getParameter("className");
		int num=0;
		if(parentId!=null&&name!=null)
		{
			if("0".equals(parentId))
			{
				
				IParentCategorydao pd=Factory.getParentCategorydao();
				ParentCategory pc=new ParentCategory();
				pc.setEpcParentName(name);
				num=pd.add(pc);
			}else{
				int pid=Integer.parseInt(parentId);
				ICategorydao cd=Factory.getCategorydao();
				Category cg=new Category();
				cg.setEpcName(name);
				ParentCategory pc=new ParentCategory();
				pc.setEpcParentId(pid);
				cg.setParentCategory(pc);
				num=cd.add(cg);
			}
			
			
		}
		if(num!=0)
		{
			ServletContext application=this.getServletContext(); 
			application.removeAttribute("parentCategoryList");
			out.print("<script>alert('添加成功！');location.href='"+request.getContextPath()+"/category/manage_list';</script>");
		}
		else{
			out.print("<script>alert('对不起，添加失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();

		
	}
	
	//category/manage_domodify
	public void manage_domodify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String parentId=request.getParameter("parentId");
		String parentId2=request.getParameter("pid");
		String childId=request.getParameter("cid");
		String name=request.getParameter("className");
		int num=0;
		if(parentId!=null&&name!=null)
		{
			if("0".equals(parentId)&&parentId2!=null)
			{
				int pid=Integer.parseInt(parentId2);
				IParentCategorydao pd=Factory.getParentCategorydao();
				ParentCategory pc=new ParentCategory();
				pc.setEpcParentId(pid);
				pc.setEpcParentName(name);
				num=pd.update(pc);
			}else if(childId!=null)
			{
				int ppid=Integer.parseInt(parentId);
				int cid=Integer.parseInt(childId);
				ICategorydao cd=Factory.getCategorydao();
				Category cg=new Category();
				cg.setEpcId(cid);
				cg.setEpcName(name);
				ParentCategory pc=new ParentCategory();
				pc.setEpcParentId(ppid);
				cg.setParentCategory(pc);
				num=cd.update(cg);
			}
		}
		if(num!=0)
		{
			ServletContext application=this.getServletContext(); 
			application.removeAttribute("parentCategoryList");
			out.print("<script>alert('修改成功！');location.href='"+request.getContextPath()+"/category/manage_list';</script>");
		}
		else{
			out.print("<script>alert('对不起，修改失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
	
	//category/manage_modify
	public void manage_modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String parentId=request.getParameter("pid");
		String childId=request.getParameter("cid");
		IParentCategorydao pd=Factory.getParentCategorydao();
		
		if(parentId!=null)
		{
			int pid=Integer.parseInt(parentId);
			ParentCategory pc=pd.loadById(pid);
			request.setAttribute("parentCategory", pc);
		}
		else if(childId!=null)
		{
			ICategorydao cd=Factory.getCategorydao();
			int cid=Integer.parseInt(childId);
			Category category=cd.loadById(cid);
			request.setAttribute("category", category);
			List<ParentCategory> pcList=pd.getAllList();
			request.setAttribute("pcList", pcList);
			
		}else{
			return;
		}
		
		
		request.getRequestDispatcher("/manage/productClass_modify.jsp").forward(request, response);
		
	}
	
	//  category/manage_pdel
	public void manage_pdel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String parentId=request.getParameter("pid");
		int num=0;
		if(parentId!=null)
		{
			int pid=Integer.parseInt(parentId);
			ICategorydao cd=Factory.getCategorydao();
			List<Category> cateList=cd.getListByParentId(pid);
			if(cateList!=null&&cateList.size()>0)
			{
				out.print("<script>alert('对不起，请先删除二级目录再删除此目录！');history.go(-1);</script>");
				return;
			}
			IParentCategorydao pcd=Factory.getParentCategorydao();
			num=pcd.del(pid);
		}
		if(num!=0)
		{
			ServletContext application=this.getServletContext(); 
			application.removeAttribute("parentCategoryList");
			out.print("<script>alert('删除成功！');location.href='"+request.getContextPath()+"/category/manage_list';</script>");
		}
		else{
			out.print("<script>alert('对不起，删除失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
		
	}
	
//  category/manage_cdel
	public void manage_cdel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String childId=request.getParameter("cid");
		int num=0;
		if(childId!=null)
		{
			int cid=Integer.parseInt(childId);
			IProductdao pd=Factory.getProductdao();
			List<Product> plist=pd.getListByCategoryIdAndCount(cid, 1);
			if(plist!=null&&plist.size()>0)
			{
				out.print("<script>alert('对不起，请先删除此目录下的商品再删除此目录！');history.go(-1);</script>");
				return;
			}
			ICategorydao cd=Factory.getCategorydao();
			num=cd.del(cid);
		}
		if(num!=0)
		{
			ServletContext application=this.getServletContext(); 
			application.removeAttribute("parentCategoryList");
			out.print("<script>alert('删除成功！');location.href='"+request.getContextPath()+"/category/manage_list';</script>");
		}
		else{
			out.print("<script>alert('对不起，删除失败！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
		
	}
	
	
	
}
