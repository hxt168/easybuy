package un.dez.easybuy.dao;

import java.util.List;

import un.dez.easybuy.entity.ParentCategory;

public interface IParentCategorydao {
	public int add(ParentCategory parentCategory);
	public int update(ParentCategory pc);
	public int del(int pid);
	public ParentCategory loadById(int pid);//����id��ȡ��Ŀ¼��������list��Ŀ¼
	public ParentCategory loadByIdContainCategory(int pid);// ����id��ȡ��Ŀ¼������list��Ŀ¼
	public List<ParentCategory> getAllList();//��ȡ���и�Ŀ¼��������list��Ŀ¼
	public List<ParentCategory> getListAllContainCategory();//��ȡ���и�Ŀ¼������list��Ŀ¼
	
}
