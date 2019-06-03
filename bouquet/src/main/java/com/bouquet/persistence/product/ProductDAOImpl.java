package com.bouquet.persistence.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bouquet.domain.product.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> bestList() {
		return sqlSession.selectList("bestList");
	}

	@Override
	public List<ProductDTO> newList() {
		return sqlSession.selectList("newList");
	}
	
}
