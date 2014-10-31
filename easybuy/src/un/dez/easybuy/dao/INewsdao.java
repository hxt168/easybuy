package un.dez.easybuy.dao;

import java.util.List;

import un.dez.easybuy.entity.News;
import un.dez.easybuy.util.Pager;

public interface INewsdao {
	public int add(News news);
	public int update(News news);
	public News select(int enId);
	public int del(int enId);
	public List<News> getNewsByEnid(int enId);
	public List<News> getNewsListByCount(int count);
	public Pager<News> getPagerLists();
}