package com.smhrd.model;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.mybatis.SqlSessionManager;

public class CertificationDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public ArrayList<CertificationDTO> getCertifications(String fh_name) {
        SqlSession session = null;
        ArrayList<CertificationDTO> certi_dto = null;
        try {
            session = sqlSessionFactory.openSession(true);
            certi_dto = (ArrayList) session.selectList("com.smhrd.model.CertificationMapper.getCertifications", fh_name);
            System.out.println("Certification List from DAO: " + certi_dto);  // 디버깅용 출력
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return certi_dto;
    }
}
