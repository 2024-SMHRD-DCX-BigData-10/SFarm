package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.mybatis.SqlSessionManager;

public class ProductDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public ProductDTO getProductDetails(String agri_name) {
        SqlSession session = sqlSessionFactory.openSession(true);
        ProductDTO product = session.selectOne("getProductDetails", agri_name);
        session.close();
        return product;
    }

    public List<ProductDTO> getProductsByFarmhouse(String agri_name) {
        SqlSession session = sqlSessionFactory.openSession(true);
        List<ProductDTO> productList = session.selectList("com.smhrd.mapper.ProductMapper.getProductsByFarmhouse",agri_name);
        session.close();
        return productList;
    
    }
}
