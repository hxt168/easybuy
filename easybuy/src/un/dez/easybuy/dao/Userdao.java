package un.dez.easybuy.dao;

import java.util.HashMap;
import java.util.Map;

import un.dez.easybuy.entity.User;
import un.dez.easybuy.util.Pager;





public class Userdao extends Basedao<User> implements IUserdao {
	public Userdao(){
		super(User.class);
	}
	public int addUser(User user) {
		 return super.add(user);
		}


		public int delUser(int id) {
			return super.del(id);
		}

		
		public User searchUser(String name, String pwd) {
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("euUserName",name);
			map.put("euPassword",pwd);
			return super.load("search", map);
		}
		
		public User searchUserName(String name) {
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("euUserName",name);
			return super.load("searchName", map);
		}


		public int updateUser(User user) {
			return super.update(user);
		}
		public Pager<User> userList() {
			Map<String,Object> map=new HashMap<String,Object>();
			return super.getPages("user",map);
		}
		public User findUser(int id) {
			return super.loadById("searchById",id);
		}
		public int updatePwd(User user) {
			
			return super.update("updatePwd",user);
		}
	
}