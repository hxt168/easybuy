package un.dez.easybuy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import un.dez.easybuy.entity.*;
import un.dez.easybuy.util.*;


public class Orderdao extends Basedao<Order> implements IOrderdao {
	String classPath;
	public Orderdao()
	{
		super(Order.class);
		classPath=Order.class.getName();
	}
	
	/*
	 * ���붩���Ͷ����µ���Ʒ����
	 */
	public int addOrderAndDetail(Order order)
	{
		SqlSession ss=null;
		int num=0;
		try {
			ss=Mybatis.createSession();
			num = ss.insert(classPath+".addOrder", order);
			ss.commit();
			
			if(num!=0)
			{
				for(Detail d:order.getList())
				{
					d.setEoId(order.getEoId());
					num+= ss.insert(classPath+".addDetail", d);
					ss.commit();
					
				}
			}
			
			
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		
		return num;
	}
	
	/*
	 * �޸Ķ�������
	 */
	public int updateOrder(Order order)
	{
		return super.update(order);
	}
	/*
	 * ɾ�������Ͷ����µ�����
	 */
	public int delOrder(int eoId)
	{
		SqlSession ss=null;
		int num=0;
		try {
			ss=Mybatis.createSession();
			num = ss.delete(classPath+".delDetail", eoId);
			ss.commit();
		
			num= ss.delete(classPath+".delOrder", eoId);
			ss.commit();
			
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return num;
	}
	
	/*
	 * ����Id��ȡ��������
	 */
	public Order getOrderById(int oid)
	{
		return super.loadById("loadById", oid);
	}
	
	
	/*
	 * ���ݹؼ��ֲ�ѯ������
	 * MapΪnull ��Ϊ��ѯ���ж����б�
	 */
	public Pager<Order> getSearchListOrder(Map<String,Object> keys)
	{
		if(keys==null)
			keys=new HashMap<String,Object>();
		return super.getPages("allOrder", keys);
	}
	
	/*
	 * �����û�id��ѯ����
	 */
	public Pager<Order> getOrderByUserId(int uid)
	{
		
		Map<String,Object>	m=new HashMap<String,Object>();
		m.put("eoUserId", uid);
		return super.getPages("listByUserId", m);
	}

	/*
	 * ��ѯǰn������
	 */
	public List<Order> getOrderByCount(int count)
	{
		
		return super.list("listByCount", count);
	}
	
	/*
	 * ���ݶ���id��ѯ����
	 */
	public List<Detail> getListByOrderId(int eoId)
	{
		SqlSession ss=null;
		List<Detail> list=null;
		try {
			ss=Mybatis.createSession();
			list=ss.selectList(Order.class.getName()+".detalLoadByOrderId",eoId);		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return list;
	}
	
	
	/*
	 * ������Ʒid��ѯ�����б�
	 */
	public Pager<Detail> getOrderListByProductId(int pid)
	{
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("pid", pid);
		SqlSession ss=null;
		Pager<Detail> page=new Pager<Detail>();
		List<Detail> list=null;
		int pageOffset=SystemContext.getPageOffset();
		int pageSize=SystemContext.getPageSize();
		int totalRecord=0;

		m.put("pageOffset", pageOffset);
		m.put("pageSize", pageSize);
		try {
			ss=Mybatis.createSession();
			list=ss.selectList(Order.class.getName()+".detailListByProductId_page", m);
			totalRecord=ss.selectOne(Order.class.getName()+".detailListByProductId_count",m);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		page.setPageSize(pageSize);
		page.setData(list);
		page.setTotalRecord(totalRecord);	
		
		return page;
	}

	
	
}
