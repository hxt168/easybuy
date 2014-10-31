package un.dez.easybuy.dao;

import java.util.List;

import un.dez.easybuy.entity.Product;
import un.dez.easybuy.util.Pager;

public interface IProductdao {
	public int add(Product product);
	public int update(Product product);
	public int subStock(int pid,int subStock);
	public int addSellAmount(int pid,int addAmount);
	public int del(int pid);
	public Product getProductById(int pid);
	public Pager<Product> getPagerListByCategoryId(int cid);
	public List<Product> getListByCategoryIdAndCount(int cid,int count);
	public Pager<Product> getPagerListByParentId(int pid);
	public Pager<Product> getPagerListPromote();
	public List<Product> getListPromoteAsCount(int count);
	public List<Product> getListOrderBySellAmount(int count);
}
