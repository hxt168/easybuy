package un.dez.easybuy.dao;



import un.dez.easybuy.entity.User;
import un.dez.easybuy.util.Pager;



public interface IUserdao {
	//�����û����������ѯ�û� 
	public  User searchUser(String name,String pwd);
	//�����û�����ѯ�û� 
	public User searchUserName(String name);
	//����û�
	public int addUser(User user);
	//����idɾ���û�
	public int delUser(int id);
	//�����û�
	public int updateUser(User user);
	//��ѯ�û���ҳ
	public Pager<User> userList();
	//����id���ҿͻ�
	public User findUser(int id);
	//�޸�����
	public int updatePwd(User user);
}