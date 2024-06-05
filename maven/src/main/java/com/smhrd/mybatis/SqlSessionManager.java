package com.smhrd.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
		
	static SqlSessionFactory sqlSessionFactory; // 전역변수로 선언
	static {
		try {
			String resource = "com/smhrd/mybatis/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			 sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DAO에 sqlSession을 사용할 수 있도록 return해주는 메소드 생성
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}

}
