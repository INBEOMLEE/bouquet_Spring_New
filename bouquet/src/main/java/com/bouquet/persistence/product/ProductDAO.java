package com.bouquet.persistence.product;

import java.util.List;

import com.bouquet.domain.product.ProductDTO;

public interface ProductDAO {

	public List<ProductDTO> bestList(); // 베스트상품 목록
	public List<ProductDTO> newList();  // 새로운상품 목록
	
	
}
