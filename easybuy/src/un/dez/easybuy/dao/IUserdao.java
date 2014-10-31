package un.dez.easybuy.dao;



import un.dez.easybuy.entity.User;
import un.dez.easybuy.util.Pager;



public interface IUserdao {
	//根据用户名和密码查询用户 
	public  User searchUser(String name,String pwd);
	//根据用户名查询用户 
	public User searchUserName(String name);
	//添加用户
	public int addUser(User user);
	//根据id删除用户
	public int delUser(int id);
	//更新用户
	public int updateUser(User user);
	//查询用户分页
	public Pager<User> userList();
	//根据id查找客户
	public User findUser(int id);
	//修改密码
	public int updatePwd(User user);
}