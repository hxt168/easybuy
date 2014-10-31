package un.dez.easybuy.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import un.dez.easybuy.dao.ParentCategorydao;
import un.dez.easybuy.entity.Category;
import un.dez.easybuy.entity.ParentCategory;

public class ParentCategoryTest {
	ParentCategorydao pcdao=new ParentCategorydao();
	@Test
	public void addtest() {
		ParentCategory pc=new ParentCategory();
		pc.setEpcParentName("≤‚ ‘Õ∑");
		ParentCategorydao pcdao=new ParentCategorydao();
		pcdao.add(pc);
	}
	
	@Test
	public void updatetest() {
		ParentCategory pc=new ParentCategory();
		pc.setEpcParentName("≤‚ ‘Õ∑2");
		pc.setEpcParentId(7);
		ParentCategorydao pcdao=new ParentCategorydao();
		pcdao.update(pc);
	}
	
	@Test
	public void del() {
		
		pcdao.del(7);
	}
	
	@Test
	public void loadByIdTest() {
		
		ParentCategory pc=pcdao.loadById(4);
		System.out.println(pc.getEpcParentName());
	}
	
	@Test
	public void loadByIdTest2() {
		
		ParentCategory p=pcdao.loadByIdContainCategory(1);

		
			System.out.println(p.getEpcParentName());
			System.out.println();
			for(Category c:p.getList())
			System.out.print(c.getEpcName()+" ");
			System.out.println();
		
	}
	
	@Test
	public void getAllListTest() {
		
		List<ParentCategory> pl=pcdao.getAllList();
		for(ParentCategory p:pl)
		{
			System.out.println(p.getEpcParentName());
		}
	}
	
	
	@Test
	public void getAllListTest2() {
		
		List<ParentCategory> pl=pcdao.getListAllContainCategory();
		System.out.println(pl.size());
		for(ParentCategory p:pl)
		{
			System.out.println(p.getEpcParentName());
			System.out.println();
			for(Category c:p.getList())
			System.out.print(c.getEpcName()+" ");
			System.out.println();
		}
	}

}
