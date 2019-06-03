package com.bouquet.service.product;

import java.util.HashMap;
import java.util.List;

import com.bouquet.domain.product.ProductDTO;

public interface ProductService {
	// 베스트상품과 신상품 목록
	public HashMap<String, List<ProductDTO>> productList();
	
	
}
