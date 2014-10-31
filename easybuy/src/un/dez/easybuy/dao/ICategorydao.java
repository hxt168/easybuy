package un.dez.easybuy.dao;

import java.util.List;

import un.dez.easybuy.entity.Category;

public interface ICategorydao {
	public int add(Category category);
	public int update(Category category);
	public int del(int pid);
	public Category loadById(int id);//根据id查询child目录
	public List<Category> getListByParentId(int pid);//根据父目录id查询child目录
	public List<Category> getListByCount(int count);//获取前n条child目录
	
}
