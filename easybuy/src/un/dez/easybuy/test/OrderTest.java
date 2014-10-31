package un.dez.easybuy.test;

import static org.junit.Assert.*;

import java.util.*;

import org.junit.Test;

import un.dez.easybuy.dao.Orderdao;
import un.dez.easybuy.entity.*;
import un.dez.easybuy.util.*;

public class OrderTest {
	Orderdao od=new Orderdao();
	@Test
	public void addtest() {
		User user=new User();
		List<Detail> d=new ArrayList<Detail>();
		
		
		
		Detail dt=new Detail();
		dt.setEodCost(33);
		dt.setEodQuantity(44);
		Product pro=new Product();
		pro.setEpId(2);
		dt.setProduct(pro);
		
		Detail dt2=new Detail();
		dt2.setEodCost(100);
		dt2.setEodQuantity(55);
		Product pro2=new Product();
		pro2.setEpId(3);
		dt2.setProduct(pro2);
		
		
		
		d.add(dt);
		d.add(dt2);
		
		user.setEuUserId(3);
		Order o=new Order();
		o.setEoCost(22);
		o.setEoStatus(1);
		o.setEoType(1);
		o.setEoUserAddress("杭州市2222xiasha");
		o.setEoRealName("hxt");
		o.setEoUserPhone("3322211");
		o.setEoUser(user);
		o.setList(d);
		od.addOrderAndDetail(o);
	}

	@Test
	public void getAllPagetest() {
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(3);
		Map<String,Object> m=new HashMap<String,Object>();
		//m.put("eoRealName", "h");
		m.put("eoUserAddress", "xia");
		Pager<Order> p=od.getSearchListOrder(m);
		System.out.println(p.getTotalRecord());
		System.out.println(p.getData().size());
		for(Order o:p.getData())
			System.out.println(o.toString());
		
	}
	
	@Test
	public void getPageByUseridtest() {
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(2);
		Pager<Order> p=od.getOrderByUserId(3);
		System.out.println(p.getTotalRecord());
		System.out.println(p.getData().size());
		for(Order o:p.getData())
			System.out.println(o.toString());
		
	}
	
	@Test
	public void getPageByProductidtest() {
		SystemContext.setPageOffset(0);
		SystemContext.setPageSize(3);
		Pager<Detail> p=od.getOrderListByProductId(2);
		System.out.println(p.getTotalRecord());
		System.out.println(p.getData().size());
		for(Detail o:p.getData())
			System.out.println(o.toString());
		
	}
	
	@Test
	public void getDetailbyoidtest() {
	
		List<Detail> p=od.getListByOrderId(4);
	
		for(Detail o:p)
			System.out.println(o.toString());
		
	}
	
	@Test
	public void getlistcounttest() {
		List<Order> p=od.getOrderByCount(4);
		for(Order o:p)
			System.out.println(o.toString());
		
	}
	
	@Test
	public void loadbuIdtest() {
		
		Order o=od.getOrderById(4);
		System.out.println(o.toString());
		
	}
	
	@Test
	public void updatetest() {
		Order o=new Order();
		o.setEoCost(10000);
		o.setEoRealName("我是谁");
		o.setEoStatus(2);
		o.setEoType(3);
		o.setEoUserAddress("上海");
		o.setEoUserPhone("323444333");
		o.setEoId(1);
		od.updateOrder(o);
		
		
	}
	
	@Test
	public void deltest() {
		
		od.delOrder(5);
	
		
	}
	
	
}
