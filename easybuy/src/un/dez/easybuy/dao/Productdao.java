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
	 * ������Ʒ��棨������ 
	 */
	public int subStock(int pid,int subStock)
	{
		Product p=new Product();
		p.setEpId(pid);
		p.setEpStock(subStock);
		return super.update("subStock", p);
	}
	
	
	/*
	 * ������Ʒ���۵�����
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
	 * ���ݶ���Ŀ¼��ѯ��Ʒ�б�
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
	 * ���ݶ���Ŀ¼��ѯǰn����Ʒ�б�
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
	 * ����һ��Ŀ¼��ѯ��Ʒ�б�
	 */
	public Pager<Product> getPagerListByParentId(int pid)
	{
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("pid", pid);
		return super.getPages("listByParentId", m);
	}
	
	
	/*
	 * 
	 * ��ѯ������Ʒ�б�
	 */
	public Pager<Product> getPagerListPromote()
	{
		Map<String,Object> m=new HashMap<String,Object>();
		return super.getPages("listByPromote", m);
	}
	
	/*
	 * 
	 * ��ѯǰn��������Ʒ
	 */
	public List<Product> getListPromoteAsCount(int count)
	{
		
		return super.list("listByPromoteAndCount", count);
	}
	
	/*
	 * 
	 * ��ѯǰn��������Ʒ������������������
	 */
	public List<Product> getListOrderBySellAmount(int count)
	{
		
		return super.list("listOrderBySellAmount", count);
	}
	
	
	
	
}
