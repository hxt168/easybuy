package un.dez.easybuy.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import un.dez.easybuy.biz.Factory;
import un.dez.easybuy.dao.IParentCategorydao;
import un.dez.easybuy.dao.IProductdao;
import un.dez.easybuy.dao.Productdao;
import un.dez.easybuy.entity.Category;
import un.dez.easybuy.entity.Detail;
import un.dez.easybuy.entity.ImageFilePath;
import un.dez.easybuy.entity.ParentCategory;
import un.dez.easybuy.entity.Product;
import un.dez.easybuy.util.Pager;
import un.dez.easybuy.util.SystemContext;



@SuppressWarnings("serial")
public class ProductAction extends BaseAction {
	//��ҳ���ش�����Ʒ��������Ʒ
	public void _indexload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<Product> products1=Factory.getProductdao().getListPromoteAsCount(8);
		 request.setAttribute("products1", products1);
		 List<Product> products2=Factory.getProductdao().getListOrderBySellAmount(12);
		 request.setAttribute("products2", products2);
		 request.getRequestDispatcher("/comein.jsp").forward(request, response);
	}
	//��Ʒ����ҳ�ļ���
	public void _view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("epId"));
		String pageOffset=request.getParameter("pager.offset");
		int offset=0;
		if(pageOffset!=null)
			offset=Integer.parseInt(pageOffset);
		SystemContext.setPageOffset(offset);
		SystemContext.setPageSize(7);
		Pager<Detail> pager=Factory.getOrderdao().getOrderListByProductId(id);
		request.setAttribute("pager", pager);
		if(pager.getData().size()==0)
			request.setAttribute("isnull", 1);
		Product product=Factory.getProductdao().getProductById(id);
		System.out.println(product.getEpName());
		String nowUrl=request.getRequestURI()+"?"+request.getQueryString();
		
		request.setAttribute("nowUrl", nowUrl);
		request.setAttribute("product",product);
		request.getRequestDispatcher("/product_view.jsp").forward(request,response);
	}
	
		
	
	//��Ʒ����ҳ��   /product/manage_list
		public void manage_list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String id=request.getParameter("cid");
			IProductdao pd=Factory.getProductdao();
			Pager<Product> pager;
			
			String pageOffset=request.getParameter("pager.offset");
			int offset=0;
			if(pageOffset!=null)
				offset=Integer.parseInt(pageOffset);
			SystemContext.setPageOffset(offset);
			SystemContext.setPageSize(7); //
			if(id!=null&&!"".equals(id))
			{
				int cid=Integer.parseInt(id);
				pager=pd.getPagerListByCategoryId(cid);
			}else{
				pager=pd.getPagerListByCategoryId(0);
			}
			this.putCategory(request, response);
			request.setAttribute("pager",pager);
			request.getRequestDispatcher("/manage/product.jsp").forward(request,response);
		}
		//�鿴�����Ʒ  
		//  /product/manage_add
		public void manage_add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.putCategory(request, response);	
			request.getRequestDispatcher("/manage/product_add.jsp").forward(request,response);
		}
		//�����Ʒ  
		//  /product/manage_doadd
		
		public void manage_doadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String epName ;
			String epDescription;
			String epPrice;
			String epStock;
			String cid;
			String epProductNum;
			PrintWriter out = response.getWriter();
			
			//�½�һ���յ�SmartUpload��
			SmartUpload su = new SmartUpload();
			//���ñ���
			su.setCharset("utf-8");
			//��su������г�ʼ��
			PageContext context = JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8*1024, true);

			su.initialize(context);
			try{
				//��������ͽ�ֹ�ϴ����ļ�����
				su.setAllowedFilesList("jpg,png,gif");
				//���ļ��ϴ�ҳ�����ݷ�װ��su����
				su.upload();
				//��ȡ�����ϴ��ļ��������Ϣ(ע:request��ȡ��Ϣ����Ҫ����su.upload()֮��)
				Request suRequest = su.getRequest();
				epName = suRequest.getParameter("epName");
				epDescription=suRequest.getParameter("epDescription");
				epPrice=suRequest.getParameter("epPrice");
			    epStock=suRequest.getParameter("epStock");
			    cid=suRequest.getParameter("cid");
				epProductNum=suRequest.getParameter("epProductNum");
				System.out.println(epName);
				
			}catch(Exception ex){
				ex.printStackTrace();
				String msg = ex.getMessage();
				//out.println("<script> alert('"+msg+"'); location.href('sinUpload.jsp');</script>");
				out.println("<script> alert('�ϴ��ı�����ͼƬ��ʽ'); history.go(-1);</script>");
				return;
			}
			//��ȡ�����ϴ����ļ�
			Files files = su.getFiles();
			com.jspsmart.upload.File file = files.getFile(0);
			
			//�÷�װ�õ�imgFile��
			
			ImageFilePath imgFile=new ImageFilePath(file.getFileName());
	
			java.io.File folder = new java.io.File(request.getRealPath("/")+imgFile.getFilePath());
			if(!folder.exists()){
				//����ļ�·�������ڣ��򴴽�֮
				folder.mkdirs();
			}
			
			//ƴװ�ļ�����
			
			
			//�����ļ���ָ����·��
			if(imgFile.isFileRight())
			{
				try {
					file.saveAs(imgFile.getFilePathName(), SmartUpload.SAVE_VIRTUAL);
				} catch (SmartUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//sqlFilePath="/"+dateStr+"/"+file.getFileName();
			}
			int num=0;
			System.out.println(imgFile.getSqlPathName());
			if(epName!=null&&epPrice!=null&&cid!=null&&epProductNum!=null)
			{
				Product pro=new Product();
				Category cg=new Category();
				cg.setEpcId(Integer.parseInt(cid));
				pro.setEpDescription(epDescription);
				pro.setCategory(cg);
				pro.setEpIsPromote(0);
				pro.setEpName(epName);
				pro.setEpPrice(Float.parseFloat(epPrice));
				pro.setEpProductNum(epProductNum);
				pro.setEpPromotePrice(Float.parseFloat(epPrice));
				pro.setEpStock(Integer.parseInt(epStock));
				pro.setEpFileName(imgFile.getSqlPathName());
				num=Factory.getProductdao().add(pro);
			}
			
			if(num!=0)
			{
				
				out.print("<script>alert('��Ʒ��ӳɹ���');location.href='"+request.getContextPath()+"/product/manage_list';</script>");
			}
			else{
				out.print("<script>alert('�Բ�����Ʒ���ʧ�ܣ�');history.go(-1);</script>");
			}
			out.flush();
			out.close();
			
		}
		//�޸���Ʒ  
				//  /product/manage_modify
		public void manage_modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String pid=request.getParameter("epId");
			if(pid!=null)
			{
				
				Product pro=Factory.getProductdao().getProductById(Integer.parseInt(pid));
				this.putCategory(request, response);
				request.setAttribute("pro", pro);
				request.getRequestDispatcher("/manage/product_modify.jsp").forward(request,response);
				
			}
			
		}
		
		
		//�޸���Ʒ  
		//  /product/manage_domodify
				
	public void manage_domodify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String epName ;
			String epId;
			String epDescription;
			String epPrice;
			String epStock;
			String cid;
			String epProductNum;
			String epIsPromote;
			String epPromotePrice;
			String fileName;
			PrintWriter out = response.getWriter();
			
			//�½�һ���յ�SmartUpload��
			SmartUpload su = new SmartUpload();
			//���ñ���
			su.setCharset("utf-8");
			//��su������г�ʼ��
			PageContext context = JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8*1024, true);

			su.initialize(context);
			try{
				//��������ͽ�ֹ�ϴ����ļ�����
				su.setAllowedFilesList("jpg,png,gif");
				//su.setDeniedFilesList("doc,xls");	
			
				//���ļ��ϴ�ҳ�����ݷ�װ��su����
				su.upload();
				//��ȡ�����ϴ��ļ��������Ϣ(ע:request��ȡ��Ϣ����Ҫ����su.upload()֮��)
				Request suRequest = su.getRequest();
				epId = suRequest.getParameter("epId");
				epName = suRequest.getParameter("epName");
				epDescription=suRequest.getParameter("epDescription");
				epPrice=suRequest.getParameter("epPrice");
			    epStock=suRequest.getParameter("epStock");
			    cid=suRequest.getParameter("cid");
			    epProductNum=suRequest.getParameter("epProductNum");
			    epIsPromote=suRequest.getParameter("epIsPromote");
			    fileName=suRequest.getParameter("fileName");
			    epPromotePrice=suRequest.getParameter("epPromotePrice");
				System.out.println(epName);
				
			}catch(Exception ex){
				ex.printStackTrace();
				//String msg = ex.getMessage();
				out.println("<script> alert('�ϴ��ı�����ͼƬ��ʽ'); history.go(-1);</script>");
				
				return;
			}
			//��ȡ�����ϴ����ļ�
			Files files = su.getFiles();
			com.jspsmart.upload.File file = files.getFile(0);
			
			//�����ϴ�·��
			
			ImageFilePath imgFile=new ImageFilePath(file.getFileName());
			
			java.io.File folder = new java.io.File(request.getRealPath("/")+imgFile.getFilePath());
			if(!folder.exists()){
				//����ļ�·�������ڣ��򴴽�֮
				folder.mkdirs();
			}
			
			//�����ļ���ָ����·��
			if(imgFile.isFileRight())
			{
				try {
					file.saveAs(imgFile.getFilePathName(), SmartUpload.SAVE_VIRTUAL);
				} catch (SmartUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			int num=0;
			
			if(epId!=null&&epName!=null&&epPrice!=null&&cid!=null&&epProductNum!=null)
			{
				Product pro=new Product();
				Category cg=new Category();
				cg.setEpcId(Integer.parseInt(cid));
				pro.setEpId(Integer.parseInt(epId));
				pro.setEpDescription(epDescription);
				pro.setCategory(cg);
				pro.setEpIsPromote(Integer.parseInt(epIsPromote));
				pro.setEpName(epName);
				pro.setEpPrice(Float.parseFloat(epPrice));
				pro.setEpProductNum(epProductNum);
				pro.setEpPromotePrice(Float.parseFloat(epPromotePrice));
				pro.setEpStock(Integer.parseInt(epStock));
				if(imgFile.isFileRight())
				{
					pro.setEpFileName(imgFile.getSqlPathName());
				}
				num=Factory.getProductdao().update(pro);
			}
			
			if(num!=0)
			{
				
				out.print("<script>alert('��Ʒ�޸ĳɹ���');location.href='"+request.getContextPath()+"/product/manage_list';</script>");
			}
			else{
				out.print("<script>alert('�Բ�����Ʒ�޸�ʧ�ܣ�');history.go(-1);</script>");
			}
			out.flush();
			out.close();
			
		}
	
	public void manage_del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String epId=request.getParameter("epId");
		PrintWriter out = response.getWriter();
		int num=0;
		if(epId!=null&&!"".equals(epId))
		{
			int pid=Integer.parseInt(epId);
			SystemContext.setPageOffset(0);
			SystemContext.setPageSize(2);
			Pager<Detail> pager=Factory.getOrderdao().getOrderListByProductId(pid);
			if(pager.getData()!=null&&pager.getData().size()!=0)
			{
				out.print("<script>alert('�Բ�������ɾ������Ʒ�Ķ�����ɾ������Ʒ��');history.go(-1);</script>");
				return;
			}
			num=Factory.getProductdao().del(pid);
		}
		if(num!=0)
		{
			
			out.print("<script>alert('��Ʒɾ���ɹ���');location.href='"+request.getContextPath()+"/product/manage_list';</script>");
		}
		else{
			out.print("<script>alert('�Բ�����Ʒɾ��ʧ�ܣ�');history.go(-1);</script>");
		}
		out.flush();
		out.close();
		
	}
		//һ��Ŀ¼ ����Ŀ¼ ʡ������
	public void putCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ParentCategory> pclist=Factory.getParentCategorydao().getListAllContainCategory();
		String jscode="";
		if(pclist!=null)
		{
			for(ParentCategory pc:pclist)
			{
				
				
				jscode+="pc['"+pc.getEpcParentId()+"']=[";
				if(pc.getList()!=null)
				{
					for(int i=0;i<pc.getList().size();i++)
					{
						Category c=pc.getList().get(i);
						if(i!=0)
							jscode+=",";
						jscode+="\""+c.getEpcId()+"-"+c.getEpcName()+"\"";
						
					
					}
					
				}
				
				
				jscode+="];\n";
			}
			
		}
		request.setAttribute("jscode", jscode);
		request.setAttribute("pclist", pclist);
		
	}
		
		//���ݸ������ѯ
		// /product/listByParent
	public void listByParent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid=Integer.parseInt(request.getParameter("id"));
		SystemContext.setPageSize(8);
		String pageOffset=request.getParameter("pager.offset");
		if(pageOffset==null){
			//pageOffset=request.getParameter("pageOffset");
			pageOffset="0";
		}
		SystemContext.setPageOffset(Integer.parseInt(pageOffset));
		String parentName=Factory.getParentCategorydao().loadById(pid).getEpcParentName();
		Pager<Product> pager=Factory.getProductdao().getPagerListByParentId(pid);
		//List<Product> products=pager.getData();
		request.setAttribute("nowUrl",request.getRequestURL());
		request.setAttribute("parentName",parentName);
		request.setAttribute("parentId", pid);
		//request.setAttribute("products",products);
		request.setAttribute("pager",pager);
		request.getRequestDispatcher("/product_list.jsp").forward(request, response);
	}
	//���������ѯ
	// /product/listByChild
	public void listByChild(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("id"));
		SystemContext.setPageSize(8);
		String pageOffset=request.getParameter("pager.offset");
		if(pageOffset==null){
			pageOffset=request.getParameter("pageOffset");
			if(pageOffset==null)pageOffset="0";
		}
		SystemContext.setPageOffset(Integer.parseInt(pageOffset));
        Category category=Factory.getCategorydao().loadById(cid);
		Pager<Product> pager=Factory.getProductdao().getPagerListByCategoryId(cid);
		//List<Product> products=pager.getData();
		request.setAttribute("nowUrl",request.getRequestURL());
		request.setAttribute("category",category);
		request.setAttribute("parentId", category.getParentCategory().getEpcParentId());
		//request.setAttribute("products",products);
		request.setAttribute("pager",pager);
		request.getRequestDispatcher("/product_list.jsp").forward(request, response);
	}
	//�����Ƿ������ѯ
	// /product/listByPromote
	public void listByPromote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SystemContext.setPageSize(8);
		String pageOffset=request.getParameter("pager.offset");
		if(pageOffset==null){
			pageOffset=request.getParameter("pageOffset");
			if(pageOffset==null)pageOffset="0";
		}
		SystemContext.setPageOffset(Integer.parseInt(pageOffset));
		Pager<Product> pager=Factory.getProductdao().getPagerListPromote();
		//List<Product> products=pager.getData();
		request.setAttribute("nowUrl",request.getRequestURL());
		//request.setAttribute("products",products);
		request.setAttribute("pager",pager);
		request.setAttribute("parentId", "-1");
		request.getRequestDispatcher("/product_list.jsp").forward(request, response);
	}
}
