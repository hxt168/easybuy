package un.dez.easybuy.dao;

import java.util.*;

import un.dez.easybuy.entity.*;
import un.dez.easybuy.util.Pager;

public class Productdao extends Basedao<Product> implements IProductdao {

	public Productdao()
	{
		super(Product.class);
	}
	
	public int add(Product product)
	{
		return super.add(product);
	}
	
	public int update(Product product)
	{
		return super.update(product);
	
	}
	/*
	 * 减少商品库存（被购买） 
	 */
	public int subStock(int pid,int subStock)
	{
		Product p=new Product();
		p.setEpId(pid);
		p.setEpStock(subStock);
		return super.update("subStock", p);
	}
	
	
	/*
	 * 增加商品销售的数量
	 */
	public int addSellAmount(int pid,int addAmount)
	{
		Product p=new Product();
		p.setEpId(pid);
		p.setEpSellAmount(addAmount);
		return super.update("updateSellAmount", p);
		
	}
	
	public int del(int pid)
	{
		return super.del(pid);
	}
	
	public Product getProductById(int pid)
	{
		return super.loadById("load", pid);
	}
	/*
	 * 
	 * 根据二级目录查询商品列表
	 */
	public Pager<Product> getPagerListByCategoryId(int cid)
	{
		Map<String,Object> m=new HashMap<String,Object>();
		if(cid!=0)
			m.put("cid", cid);
		
		return super.getPages("listByCategoryId", m);
	}
	
	/*
	 * 
	 * 根据二级目录查询前n条商品列表
	 */
	public List<Product> getListByCategoryIdAndCount(int cid,int count)
	{
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("cid", cid);
		m.put("pageOffset", 0);
		m.put("pageSize", count);
		return super.list("listByCategoryId_page", m);
	}
	
	
	/*
	 * 
	 * 根据一级目录查询商品列表
	 */
	public Pager<Product> getPagerListByParentId(int pid)
	{
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("pid", pid);
		return super.getPages("listByParentId", m);
	}
	
	
	/*
	 * 
	 * 查询促销商品列表
	 */
	public Pager<Product> getPagerListPromote()
	{
		Map<String,Object> m=new HashMap<String,Object>();
		return super.getPages("listByPromote", m);
	}
	
	/*
	 * 
	 * 查询前n条促销商品
	 */
	public List<Product> getListPromoteAsCount(int count)
	{
		
		return super.list("listByPromoteAndCount", count);
	}
	
	/*
	 * 
	 * 查询前n条热卖商品，根据卖出数量排序
	 */
	public List<Product> getListOrderBySellAmount(int count)
	{
		
		return super.list("listOrderBySellAmount", count);
	}
	
	
	
	
}
