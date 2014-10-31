package un.dez.easybuy.dao;

import java.util.List;
import java.util.Map;

import un.dez.easybuy.entity.*;



public class Categorydao extends Basedao<Category> implements ICategorydao {
	
	public Categorydao()
	{
		super(Category.class);
	}
	
	public int add(Category category)
	{
		return super.add(category);
	}
	
	public int update(Category category)
	{
		return super.update(category);
	}
	
	public int del(int pid)
	{
		return super.del(pid);
	}
	
	/*
	 * ����id��ѯchildĿ¼
	 */
	public Category loadById(int id)
	{
		return super.loadById("loadById", id);
	}
	/*
	 * ���ݸ�Ŀ¼id��ѯchildĿ¼
	 */
	public List<Category> getListByParentId(int pid)
	{
		return super.list("listByParentId",pid );
	}
	
	/*
	 * ��ȡǰn��childĿ¼
	 */
	public List<Category> getListByCount(int count)
	{
		return super.list("listByCount",count );
	}
	
}
