package com.smhrd.model;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.mybatis.SqlSessionManager;

public class ProductDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public ProductDTO getProductDetails(Double agri_idx) {
        SqlSession session = sqlSessionFactory.openSession(true);
        ProductDTO product = session.selectOne("getProductDetails", agri_idx);
        session.close();
        return product;
    }
}
