package un.dez.easybuy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import un.dez.easybuy.entity.News;
import un.dez.easybuy.util.Pager;

public class Newsdao extends Basedao<News> implements INewsdao {
	public Newsdao()
	{
		super(News.class);
	}
	
	public int add(News news) 
	{
		return super.add(news);
	}

	public int del(int enid)
	{
		return super.del(enid);
	}
	
	
	public List<News> getNewsByEnid(int enId) 
	{
		return super.list("load1",null);
	}

	
	public News select(int enId) 
	{
		return super.loadById("load", enId);
	}
	
	
	public int update(News news) 
	{
		return super.update("update", news);
	}
	/*
	 * 
	 * 获取前count条新闻
	 */
	public List<News> getNewsListByCount(int count)
	{
		return super.list("load7", count);
	}
	
	public Pager<News> getPagerLists()
	{
		Map<String,Object> m=new HashMap<String,Object>();
		return super.getPages("pagelist", m);
	}
}