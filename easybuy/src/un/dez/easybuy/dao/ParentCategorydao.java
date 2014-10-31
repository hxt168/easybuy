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
	 * ����id��ȡ��Ŀ¼��������list��Ŀ¼
	 */
	public ParentCategory loadById(int pid)
	{
		return super.loadById("loadById", pid);
	}
	/*
	 * ����id��ȡ��Ŀ¼������list��Ŀ¼
	 */
	public ParentCategory loadByIdContainCategory(int pid)
	{
		return super.loadById("loadByIdContainCategory", pid);
	}
	/*
	 * ��ȡ���и�Ŀ¼��������list��Ŀ¼
	 */
	public List<ParentCategory> getAllList()
	{
		return super.list("listAll", null);
	}
	/*
	 * ��ȡ���и�Ŀ¼������list��Ŀ¼
	 */
	public List<ParentCategory> getListAllContainCategory()
	{
		return super.list("listAllContainCategory", null);
	}
	
}
