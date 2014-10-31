package un.dez.easybuy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import un.dez.easybuy.util.Mybatis;
import un.dez.easybuy.util.Pager;
import un.dez.easybuy.util.SystemContext;
public class Basedao<T> {
	private String classPath=null;
	public Basedao(){
		
	}
	public Basedao(Class<T> cla){
		classPath=cla.getName();//保存子类的路径，使下面不用每次写xx.class.getName
	}
	/*
	 * 添加，xxMapper.xml中id为add
	 */
	protected int add(T t)
	{
		SqlSession ss=null;
		int num=0;
		try {
			ss=Mybatis.createSession();
			num = ss.insert(classPath+".add", t);
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
	 * 添加，xxMapper.xml中id为sqlId的值
	 */
	protected int add(String sqlId,T t)
	{
		SqlSession ss=null;
		int num=0;
		try {
			ss=Mybatis.createSession();
			num = ss.insert(classPath+"."+sqlId, t);
			ss.commit();
			
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return num;
	}
	
	
	protected int update(T t)
	{
		SqlSession ss=null;
		int num=0;
		try {
			ss=Mybatis.createSession();
			num = ss.update(classPath+".update", t);
			ss.commit();
			
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return num;
	}
	
	protected int update(String sqlId,T t)
	{
		SqlSession ss=null;
		int num=0;
		try {
			ss=Mybatis.createSession();
			num = ss.update(classPath+"."+sqlId, t);
			ss.commit();
			
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return num;
	}
	
	protected int del(int id)
	{
		SqlSession ss=null;
		int num=0;
		try {
			ss=Mybatis.createSession();
			num = ss.delete(classPath+".del", id);
			ss.commit();
			
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return num;
	}
	
	protected int del(String sqlId,int id)
	{
		SqlSession ss=null;
		int num=0;
		try {
			ss=Mybatis.createSession();
			num = ss.delete(classPath+"."+sqlId, id);
			ss.commit();
			
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return num;
	}
	
	protected T loadById(String sqlId,int id)
	{
		SqlSession ss=null;
		T t=null;
		try {
			ss=Mybatis.createSession();
			t=ss.selectOne(classPath+"."+sqlId, id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return t;
	}
	
	protected T load(String sqlId,Map<String,Object> m)
	{
		SqlSession ss=null;
		T t=null;
		try {
			ss=Mybatis.createSession();
			t=ss.selectOne(classPath+"."+sqlId, m);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return t;
	}
	
	protected List<T> list(String sqlId,Map<String,Object> m)
	{	
		SqlSession ss=null;
		List<T> list=null;
		try {
			ss=Mybatis.createSession();
			list=ss.selectList(classPath+"."+sqlId,m);		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return list;
	}
	
	protected List<T> list(String sqlId,int id)
	{	
		SqlSession ss=null;
		List<T> list=null;
		try {
			ss=Mybatis.createSession();
			list=ss.selectList(classPath+"."+sqlId,id);		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
		return list;
	}
	
	protected Pager<T> getPages(String sqlId,Map<String,Object> m)
	{
		SqlSession ss=null;
		Pager<T> page=new Pager<T>();
		List<T> list=null;
		//int pageIndex=SystemContext.getPageIndex();
		int pageOffset=SystemContext.getPageOffset();
		int pageSize=SystemContext.getPageSize();
		int totalRecord=0;

		m.put("pageOffset", pageOffset);
		m.put("pageSize", pageSize);
		try {
			ss=Mybatis.createSession();
			list=ss.selectList(classPath+"."+sqlId+"_page", m);
			totalRecord=ss.selectOne(classPath+"."+sqlId+"_count",m);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			Mybatis.close(ss);
		}
	//	page.setPageIndex(pageIndex);
		page.setPageSize(pageSize);
		page.setData(list);
		page.setTotalRecord(totalRecord);	
		return page;
	}
}
