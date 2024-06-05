package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class BoardDAO {
	static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	 // 게시글 작성
	public int writeBoard(BoardVO vo) {
		int cnt = 0 ;
		SqlSession session = sqlSessionFactory.openSession(true);
		
		cnt = session.insert("writeBoard",vo);
		session.close();
		return cnt;
	}
	
	//게시글 목록 조회
	
	public List<BoardVO> allBoard(){
		List<BoardVO> boards=null;
		SqlSession session = sqlSessionFactory.openSession(true);
		boards = session.selectList("allBoard");
		session.close();
		
		return boards; 
	}
	public BoardVO detailBoard(int num) {
		BoardVO board=null;
		SqlSession session = sqlSessionFactory.openSession(true);
		board = session.selectOne("detailBoard",num);
		session.close();
		
		return board; 
	}
}
