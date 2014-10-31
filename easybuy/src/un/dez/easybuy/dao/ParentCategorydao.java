package un.dez.easybuy.dao;

import java.util.List;

import un.dez.easybuy.entity.*;

public class ParentCategorydao extends Basedao<ParentCategory> implements IParentCategorydao {

	public ParentCategorydao()
	{
		super(ParentCategory.class);
	}
	
	public int add(ParentCategory parentCategory)
	{
		return super.add(parentCategory);
	}
	
	public int update(ParentCategory pc)
	{
		return super.update(pc);
	}
	
	public int del(int pid)
	{
		return super.del(pid);
	}
	/*
	 * 根据id获取父目录，不包含list子目录
	 */
	public ParentCategory loadById(int pid)
	{
		return super.loadById("loadById", pid);
	}
	/*
	 * 根据id获取父目录，包含list子目录
	 */
	public ParentCategory loadByIdContainCategory(int pid)
	{
		return super.loadById("loadByIdContainCategory", pid);
	}
	/*
	 * 获取所有父目录，不包含list子目录
	 */
	public List<ParentCategory> getAllList()
	{
		return super.list("listAll", null);
	}
	/*
	 * 获取所有父目录，包含list子目录
	 */
	public List<ParentCategory> getListAllContainCategory()
	{
		return super.list("listAllContainCategory", null);
	}
	
}
