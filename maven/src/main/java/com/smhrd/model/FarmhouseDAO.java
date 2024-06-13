package com.smhrd.model;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.mybatis.SqlSessionManager;

public class FarmhouseDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public int fh_join(FarmhouseDTO dto) {
        SqlSession session = sqlSessionFactory.openSession(true);
        int row = session.insert("fh_join", dto);
        session.close();
        return row;
    }

    public ArrayList<FarmhouseDTO> getFarmhouse(String mb_id) {
        SqlSession session = sqlSessionFactory.openSession(true);
        ArrayList<FarmhouseDTO> fh_dto = null;
        try {
            System.out.println("DAO에서 받은 mb_id: " + mb_id);
            fh_dto = (ArrayList) session.selectList("getFarmhouse", mb_id);
            System.out.println("쿼리 실행 결과: " + fh_dto);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return fh_dto;
    }

    public ArrayList<FarmhouseDTO> FarmhouseDTO(String fh_name) {
        SqlSession session = sqlSessionFactory.openSession(true);
        ArrayList<FarmhouseDTO> fh_dto = null;
        try {
            fh_dto = (ArrayList) session.selectList("FarmhouseDTO", fh_name);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return fh_dto;
    }

    public ArrayList<FarmhouseDTO> getAllFarmhouses() {
        SqlSession session = sqlSessionFactory.openSession(true);
        ArrayList<FarmhouseDTO> allFarmhouses = null;
        try {
            allFarmhouses = (ArrayList) session.selectList("getAllFarmhouses");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return allFarmhouses;
    }
}
