package un.dez.easybuy.entity;

import java.util.*;

public class ShoppingCart {
	private List<Detail> items=new ArrayList<Detail>();
	
	//��ù��ﳵ��Ʒ����
	public List<Detail> getItems() {
		return items;
	}
	
	/*
	 * ���ﳵ�����Ʒ
	 * eodCost: 
	 */
	public void addDetail(Product p,int count)
	{
		
		boolean isExist=false; 
		for(int i=0;i<items.size();i++)
		{
			
			if(items.get(i).getProduct().getEpId()==p.getEpId())
			{
				isExist=true;
				items.get(i).setEodQuantity(items.get(i).getEodQuantity()+count);
				break;
			}
			
		}
		if(!isExist)
		{
			Detail d=new Detail();
			if(p.getEpIsPromote()==1)
			{
				d.setEodCost(p.getEpPromotePrice());
			}else
			{
				d.setEodCost(p.getEpPrice());
			}
			d.setEodQuantity(count);
			d.setProduct(p);
			items.add(d);
		}
		
		
	}
	
	/*
	 * �ӹ��ﳵ�Ƴ���Ʒ
	 */
	public void removeDetail(int did)
	{
		items.remove(did);
	}
	
	/*
	 * �޸�ָ����Ʒ������
	 */
	public void modifyDetailQuantity(int did,int quantity)
	{
		items.get(did).setEodQuantity(quantity);
	}
	
	/*
	 * ��ȡ���ﳵ��Ʒ���ܽ��
	 */
	public float getTotalCost()
	{
		float totalcost=0;
		for(Detail d :items)
		{
			totalcost+=d.getEodCost()*d.getEodQuantity();
		}
		return totalcost;
	}
}
