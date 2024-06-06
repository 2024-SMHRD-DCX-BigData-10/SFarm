package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class FarmhouseDAO {
	static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	public int fh_join(FarmhouseDTO dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		int row =session.insert("fh_join",dto);
		session.close();
		return row;
}
	
	public ArrayList<FarmhouseDTO> getFarmhouseDTO(String mb_id) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<FarmhouseDTO> fh_dto =(ArrayList)session.selectList("getFarmhouse",mb_id);
		session.close();
	
		return fh_dto;
}
}