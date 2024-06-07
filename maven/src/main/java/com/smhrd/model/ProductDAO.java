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

    public ArrayList<ProductDTO> getProductsByFarmhouse(String fh_name) {
        SqlSession session = sqlSessionFactory.openSession(true);
        ArrayList<ProductDTO> productList = (ArrayList) session.selectList("getProductsByFarmhouse", fh_name);
        session.close();
        return productList;
    
    }
}
