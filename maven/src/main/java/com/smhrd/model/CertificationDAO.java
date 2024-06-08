package com.smhrd.model;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.mybatis.SqlSessionManager;

public class CertificationDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public ArrayList<CertificationDTO> getCertifications(String fh_name) {
        SqlSession session = sqlSessionFactory.openSession(true);
        ArrayList<CertificationDTO> certi_dto = (ArrayList) session.selectList("com.smhrd.model.CertificationMapper.getCertifications", fh_name);
        session.close();
        return certi_dto;
    }
}
