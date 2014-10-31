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
	 * 根据id查询child目录
	 */
	public Category loadById(int id)
	{
		return super.loadById("loadById", id);
	}
	/*
	 * 根据父目录id查询child目录
	 */
	public List<Category> getListByParentId(int pid)
	{
		return super.list("listByParentId",pid );
	}
	
	/*
	 * 获取前n条child目录
	 */
	public List<Category> getListByCount(int count)
	{
		return super.list("listByCount",count );
	}
	
}
