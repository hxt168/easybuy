package un.dez.easybuy.dao;

import java.util.List;

import un.dez.easybuy.entity.Category;

public interface ICategorydao {
	public int add(Category category);
	public int update(Category category);
	public int del(int pid);
	public Category loadById(int id);//����id��ѯchildĿ¼
	public List<Category> getListByParentId(int pid);//���ݸ�Ŀ¼id��ѯchildĿ¼
	public List<Category> getListByCount(int count);//��ȡǰn��childĿ¼
	
}
