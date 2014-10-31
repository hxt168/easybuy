package un.dez.easybuy.dao;

import java.util.List;

import un.dez.easybuy.entity.ParentCategory;

public interface IParentCategorydao {
	public int add(ParentCategory parentCategory);
	public int update(ParentCategory pc);
	public int del(int pid);
	public ParentCategory loadById(int pid);//根据id获取父目录，不包含list子目录
	public ParentCategory loadByIdContainCategory(int pid);// 根据id获取父目录，包含list子目录
	public List<ParentCategory> getAllList();//获取所有父目录，不包含list子目录
	public List<ParentCategory> getListAllContainCategory();//获取所有父目录，包含list子目录
	
}
