package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class FarmhouseDAO {
	static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	public int join(FarmhouseDTO dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int row =session.insert("join",dto);
		session.close();
		return row;
}
}