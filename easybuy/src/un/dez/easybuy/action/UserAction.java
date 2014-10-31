package un.dez.easybuy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import un.dez.easybuy.biz.Factory;
import un.dez.easybuy.entity.User;
import un.dez.easybuy.util.Pager;
import un.dez.easybuy.util.SystemContext;

@SuppressWarnings("serial")
public class UserAction extends BaseAction {
//��¼
	public void _login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String passWord=request.getParameter("passWord");
		String code=request.getParameter("code");
		String rand = (String)request.getSession().getAttribute("rand");
		User user=Factory.getUserdao().searchUser(userName, passWord);
		if(rand!=null&&rand.equals(code))
		{
			if(user!=null){
				request.getSession().setAttribute("loginUser",user);
				response.sendRedirect(request.getContextPath()+"/");
				return;
			}
			else{
				request.setAttribute("userName", userName);
				request.setAttribute("msg","�û����������");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("userName", userName);
			request.setAttribute("msg","��֤�����");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			
		}
		
	}
	
	public void loginout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}

//ע��
	public void _register(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {	
		String userName=request.getParameter("userName");
		String passWord=request.getParameter("passWord");
		String code=request.getParameter("code");
		String rand = (String)request.getSession().getAttribute("rand");
		User user=new User();
		user.setEuUserName(userName);
		user.setEuPassword(passWord);
		user.setEuStatus(1);
		user.setEuIdentityCode("");
		user.setEuSex("��");
		user.setEuRealName("");
		if(rand!=null&&rand.equals(code))
		{
			User user2=Factory.getUserdao().searchUserName(userName);
			if(user2==null)
			{
				int result=Factory.getUserdao().addUser(user);
				if(result>0){
					//request.getSession().setAttribute("loginUser",user);
					response.sendRedirect(request.getContextPath()+"/reg_result.jsp");
				}
				else{
					request.setAttribute("userName", userName);
					request.setAttribute("msg","ע��ʧ�ܣ�");
					request.getRequestDispatcher("/register.jsp").forward(request, response);
				}
			}else{
				request.setAttribute("userName", userName);
				request.setAttribute("msg","�û����Ѵ��ڣ�");
				request.getRequestDispatcher("/register.jsp").forward(request, response);
				
			}
		}else{
			request.setAttribute("userName", userName);
			request.setAttribute("msg","��֤�����");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}
	}
	
	//��̨ �����û�
	public void manage_add(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.getRequestDispatcher("/manage/user_add.jsp").forward(request, response);
		
	}
	//��̨ �����û�
	public void manage_addUser(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		 PrintWriter out=response.getWriter();
		    String userName=request.getParameter("userName");
			String passWord=request.getParameter("passWord");
			String name=request.getParameter("name");
			String sex=request.getParameter("sex");
			String birthyear=request.getParameter("birthyear");
			String birthmonth=request.getParameter("birthmonth");
			String birthday=request.getParameter("birthday");
			String email=request.getParameter("email");
			String status=request.getParameter("status");
			String mobile=request.getParameter("mobile");
			String address=request.getParameter("address");
		//	String photo=request.getParameter("photo");
		//System.out.println(photo.substring(photo.lastIndexOf("\\")+1));
		int result=0;
		if(userName!=null&&!"".equals(userName)&&passWord!=null&&!"".equals(passWord))
		{
			User user=new User();
			user.setEuUserName(userName);
			user.setEuPassword(passWord);
			user.setEuRealName(name);
			user.setEuSex(sex);
			user.setEuBirthday(birthyear+"-"+birthmonth+"-"+birthday);
			user.setEuMobile(mobile);
			user.setEuEmail(email);
			user.setEuAddress(address);
			user.setEuIdentityCode("");
			user.setEuStatus(Integer.parseInt(status));
		
			result=Factory.getUserdao().addUser(user);
		}
		
		if(result>0){
			out.println("<script type='text/javascript'>alert('����û��ɹ�!');location.href='"+request.getContextPath()+"/user/manage_userlist'</script>");
			//response.sendRedirect(request.getContextPath()+"/user/manage_userlist");
		}else{
			out.println("<script type='text/javascript'>alert('�û����ʧ��!');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
	//�����û��б�
	public void manage_userlist(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		SystemContext.setPageSize(8);
		String pageOffset=request.getParameter("pager.offset");
		if(pageOffset==null){
			pageOffset=request.getParameter("pageOffset");
			if(pageOffset==null)pageOffset="0";
		}
		SystemContext.setPageOffset(Integer.parseInt(pageOffset));
		Pager<User> page=Factory.getUserdao().userList();
		List<User> users=page.getData();
		request.setAttribute("nowUrl",request.getRequestURL());
		request.setAttribute("users",users);
		request.setAttribute("page",page);
		request.getRequestDispatcher("/manage/user.jsp").forward(request, response);
	}
	//����Ҫ�޸ĵ��û�����
	public void manage_modifyUser(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		int pageOffset=Integer.parseInt(request.getParameter("pageOffset"));
		int UserId=Integer.parseInt(request.getParameter("id"));
		User user=Factory.getUserdao().findUser(UserId);
		request.setAttribute("pageOffset", pageOffset);
		request.setAttribute("user",user);
		if(user.getEuBirthday()!=null&&!"".equals(user.getEuBirthday()))
		{
			String[] bir=user.getEuBirthday().split("-");
			request.setAttribute("birthyear", bir[0]);
			request.setAttribute("birthmonth", bir[1]);
			request.setAttribute("birthday", bir[2]);
		}
		
		request.getRequestDispatcher("/manage/user_modify.jsp").forward(request, response);
	}
	//�޸ĸ��û�����
	public void manage_updateUser(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		 PrintWriter out=response.getWriter();
		 int pageOffset=Integer.parseInt(request.getParameter("pageOffset"));
		 int id=Integer.parseInt(request.getParameter("id"));
			//String passWord=request.getParameter("passWord");
			String name=request.getParameter("name");
			String sex=request.getParameter("sex");
			String birthyear=request.getParameter("birthyear");
			String birthmonth=request.getParameter("birthmonth");
			String birthday=request.getParameter("birthday");
			String status=request.getParameter("status");
			String email=request.getParameter("email");
			String moblie=request.getParameter("mobile");
			String address=request.getParameter("address");
		//	String photo=request.getParameter("photo");
		//System.out.println(photo.substring(photo.lastIndexOf("\\")+1));
		User user=new User();
		user.setEuUserId(id);
	//	user.setEuPassword(passWord);
		user.setEuRealName(name);
		user.setEuSex(sex);
		user.setEuBirthday(birthyear+"-"+birthmonth+"-"+birthday);
		user.setEuEmail(email);
		user.setEuMobile(moblie);
		user.setEuAddress(address);
		user.setEuStatus(Integer.parseInt(status));
		
		int result=Factory.getUserdao().updateUser(user);
		if(result>0){
			out.println("<script type='text/javascript'>alert('�û��޸ĳɹ�!');location.href='"+request.getContextPath()+"/user/manage_userlist?pageOffset="+pageOffset
					 +"'</script>");
		}	
		else{
			out.println("<script type='text/javascript'>alert('�û��޸�ʧ��!');history.go(-1);'</script>");
		}
	}
	//ɾ�����û�
	public void manage_delUser(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		PrintWriter out=response.getWriter();
		int pageOffset=Integer.parseInt(request.getParameter("pageOffset"));
		int id=Integer.parseInt(request.getParameter("id"));
		 int result=Factory.getUserdao().delUser(id);
		 if(result>0){
			 out.println("<script type='text/javascript'>alert('�û�ɾ���ɹ�!');location.href='"+request.getContextPath()+"/user/manage_userlist?pageOffset="+pageOffset
					 +"'</script>");
			}	
			else{
			 out.println("<script type='text/javascript'>alert('�û�ɾ��ʧ��!');location.href='"+request.getContextPath()+"/user/manage_userlist?pageOffset="+pageOffset
					 +"'</script>");
		}
	}
	
	
	
	
	//�����û���Ϣ
	public void user_modifyUser(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		int UserId=((User)request.getSession().getAttribute("loginUser")).getEuUserId();
		User user=Factory.getUserdao().findUser(UserId);
		request.setAttribute("user",user);
		if(user.getEuBirthday()!=null&&!"".equals(user.getEuBirthday())&&user.getEuBirthday().indexOf("-")>0)
		{
			String[] bir=user.getEuBirthday().split("-");
			request.setAttribute("birthyear", bir[0]);
			request.setAttribute("birthmonth", bir[1]);
			request.setAttribute("birthday", bir[2]);
		}
		
		request.getRequestDispatcher("/userManage/user_change.jsp").forward(request, response);
	}
	//�û��޸���Ϣ
	public void user_updateUser(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		 PrintWriter out=response.getWriter();
		 int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
			String sex=request.getParameter("sex");
			String birthyear=request.getParameter("birthyear");
			String birthmonth=request.getParameter("birthmonth");
			String birthday=request.getParameter("birthday");
			String email=request.getParameter("email");
			String moblie=request.getParameter("mobile");
			String address=request.getParameter("address");
		
		User user=new User();
		user.setEuUserId(id);
		user.setEuRealName(name);
		//user.setEuPassword("");
		user.setEuSex(sex);
		user.setEuBirthday(birthyear+"-"+birthmonth+"-"+birthday);
		user.setEuEmail(email);
		user.setEuMobile(moblie);
		user.setEuAddress(address);
		//user.setEuStatus(1);
	
		int result=Factory.getUserdao().updateUser(user);
		if(result>0){
			User luser=Factory.getUserdao().findUser(id);
			request.getSession().setAttribute("loginUser", luser);
			
			out.println("<script type='text/javascript'>alert('�û��޸ĳɹ�!');location.href='"+request.getContextPath()+"/user/user_modifyUser'</script>");
		}	
		else{
			out.println("<script type='text/javascript'>alert('�û��޸�ʧ��!');location.href='"+request.getContextPath()+"/user/user_modifyUser'</script>");
		}
	}
	//�����û�����
	public void user_password(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		int UserId=((User)request.getSession().getAttribute("loginUser")).getEuUserId();
		User user=Factory.getUserdao().findUser(UserId);
		request.setAttribute("user",user);
		request.getRequestDispatcher("/userManage/password_change.jsp").forward(request, response);
	}
	//�޸�����
	public void user_updatePwd(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		PrintWriter out=response.getWriter();
		String newpass=request.getParameter("newpass");
		int userId=((User)request.getSession().getAttribute("loginUser")).getEuUserId();
		User user=new User();
		user.setEuPassword(newpass);
		user.setEuUserId(userId);
		int result=Factory.getUserdao().updatePwd(user);
		if(result>0){
			out.println("<script type='text/javascript'>alert('�����޸ĳɹ�!');location.href='"+request.getContextPath()+"/userManage/index.jsp'</script>");
		}	
		else{
			out.println("<script type='text/javascript'>alert('�����޸�ʧ��!');location.href='"+request.getContextPath()+"/userManage/password_change.jsp'</script>");
		}
	}
	//��֤�û������Ƿ���ȷ
	public void user_checkpwd(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		PrintWriter out=response.getWriter();
		String pwd=request.getParameter("pwd");
		int id=((User) request.getSession().getAttribute("loginUser")).getEuUserId();
		String password=Factory.getUserdao().findUser(id).getEuPassword();
		if(pwd.equals(password)){
			out.write("true");
		}
		else{
			out.write("false");
		}
		out.flush();
		out.close();
	}
	
	//��ѯ�Ƿ����û�
	public void name_exist(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		User user=null;
		if(name!=null&&!"".equals(name))
			user=Factory.getUserdao().searchUserName(name);
		
		if(user!=null){
			out.write("true");
		}
		else{
			out.write("false");
		}
		out.flush();
		out.close();
	}
}
