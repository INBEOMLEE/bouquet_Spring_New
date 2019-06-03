package com.bouquet.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bouquet.domain.product.ProductDTO;
import com.bouquet.service.product.ProductService;
import com.bouquet.service.product.ProductServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	
//  lombok 사용 전
//	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
//  logger.info("");
	
//  lombok 사용 후 (@Slf4j 선언 후)
//  log.info("");
	
	@Inject
	private ProductService service;
	
	@RequestMapping("/")
	public String index(Model model) {
		HashMap<String, List<ProductDTO>> map = service.productList();

		model.addAttribute("pLists", map);
		
		return "index";
	}
	
}
