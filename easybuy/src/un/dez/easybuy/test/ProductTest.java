package un.dez.easybuy.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import un.dez.easybuy.dao.*;
import un.dez.easybuy.entity.*;
import un.dez.easybuy.util.*;


public class ProductTest {
	Productdao pd=new Productdao();
	@Test
	public void addtest() {
		Product p=new Product();
		Category cg=new Category();
		cg.setEpcId(2);
		p.setCategory(cg);
		p.setEpDescription("好不好又你");
		p.setEpFileName("333.gif");
		p.setEpIsPromote(0);
		p.setEpName("超级超级超级超级的，非常好，非常妙的商品");
		p.setEpPrice(40);
		p.setEpProductNum("xx23332");
		p.setEpPromotePrice(40);
		p.setEpStock(50);
		pd.add(p);
		
		
	}
	
	
	@Test
	public void updatetest() {
		Product p=new Product();
		Category cg=new Category();
		cg.setEpcId(2);
		p.setCategory(cg);
		p.setEpId(4);
		p.setEpDescription("1111好不好又你");
		p.setEpFileName("444333.gif");
		p.setEpIsPromote(0);
		p.setEpName("111超级超级超级超级的，非常好，非常妙的商品");
		p.setEpPrice(40);
		p.setEpProductNum("xx23332");
		p.setEpPromotePrice(40);
		p.setEpStock(50);
		pd.update(p);
		
		
	}
	
	@Test
	public void addSellTest()
	{
		pd.addSellAmount(4, 6);
	}
	
	
	@Test
	public void substockTest()
	{
		pd.subStock(2, 3);
	}
	@Test
	public void delTest()
	{
		pd.del(5);
	}
	
	@Test
	public void loadTest()
	{
		Product p=pd.getProductById(3);
		System.out.println(p.toString());
	}
	
	@Test
	public void getPagerListByCategoryIdTest()
	{
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(2);
		Pager<Product> pa=pd.getPagerListByCategoryId(2);
		System.out.println(pa.getTotalRecord());
		for(Product p:pa.getData())
		System.out.println(p.getEpName());
	}
	
	@Test
	public void getListByCategoryIdTest()
	{
		
		List<Product> pa=pd.getListByCategoryIdAndCount(1, 1);
	
		for(Product p:pa)
		System.out.println(p.getEpName());
	}
	
	@Test
	public void getPagerListByParentIdTest()
	{
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(2);
		Pager<Product> pa=pd.getPagerListByParentId(1);
		System.out.println(pa.getTotalRecord());
		for(Product p:pa.getData())
		System.out.println(p.getEpName());
	}
	
	@Test
	public void getPagerListBypromoteTest()
	{
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(1);
		Pager<Product> pa=pd.getPagerListPromote();
		System.out.println(pa.getTotalRecord());
		for(Product p:pa.getData())
		System.out.println(p.getEpName());
	}
	
	@Test
	public void getListBypromoteCountTest()
	{
	
		List<Product> pa=pd.getListPromoteAsCount(2);
	
		for(Product p:pa)
		System.out.println(p.getEpName());
	}
	
	@Test
	public void getlistOrderBySellAmountTest()
	{
	
		List<Product> pa=pd.getListOrderBySellAmount(3);
	
		for(Product p:pa)
		System.out.println(p.getEpName());
	}

}
