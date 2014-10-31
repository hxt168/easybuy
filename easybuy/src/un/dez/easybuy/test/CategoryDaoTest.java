package un.dez.easybuy.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import un.dez.easybuy.dao.Categorydao;
import un.dez.easybuy.entity.Category;
import un.dez.easybuy.entity.ParentCategory;

public class CategoryDaoTest {
	Categorydao cd=new Categorydao();
	@Test
	public void loadByIdtest() {
		
		Categorydao c=new Categorydao();
		Category cg=c.loadById(2);
		System.out.println(cg.getEpcName()+" "+cg.getParentCategory().getEpcParentName());
	}
	
	@Test
	public void add()
	{
		ParentCategory pc=new ParentCategory(2,"");
		Category cg=new Category("≤‚ ‘",pc);
		Categorydao c=new Categorydao();
		c.add(cg);
	}
	
	@Test
	public void del()
	{
		
		Categorydao c=new Categorydao();
		System.out.println(c.del(40));
	}
	
	@Test
	public void update()
	{
		ParentCategory pc=new ParentCategory(3,"");
		Category cg=new Category("≤‚ ‘",pc);
		cg.setEpcId(40);
		Categorydao c=new Categorydao();
		c.update(cg);
	}
	
	@Test
	public void listByparentId()
	{
		
		Categorydao cd=new Categorydao();
		List<Category> cg=cd.getListByParentId(1);
		for(Category c:cg)
		{
			System.out.println(c.getEpcName()+"\n");
		}
	}
	
	@Test
	public void listByCount()
	{
		
		List<Category> cg=cd.getListByCount(5);
		for(Category c:cg)
		{
			System.out.println(c.getEpcName()+"\n");
		}
	}
	
	

}
