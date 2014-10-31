package un.dez.easybuy.util;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Mybatis {
	static SqlSessionFactory factory = null;
	
	static{
		try {
			factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static SqlSession createSession(){
		SqlSession session  = factory.openSession();
		return session;
	}
	public static void close(SqlSession session){
		if(session!=null)
			session.close();
	}
}
