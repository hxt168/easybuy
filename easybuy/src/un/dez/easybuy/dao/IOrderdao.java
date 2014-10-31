package un.dez.easybuy.dao;

import java.util.List;
import java.util.Map;

import un.dez.easybuy.entity.Detail;
import un.dez.easybuy.entity.Order;
import un.dez.easybuy.util.Pager;

public interface IOrderdao {
	public int addOrderAndDetail(Order order);
	public int updateOrder(Order order);
	public int delOrder(int eoId);
	public Order getOrderById(int oid);
	public Pager<Order> getSearchListOrder(Map<String,Object> keys);
	public Pager<Order> getOrderByUserId(int uid);
	public List<Order> getOrderByCount(int count);
	public List<Detail> getListByOrderId(int eoId);
	public Pager<Detail> getOrderListByProductId(int pid);
}
