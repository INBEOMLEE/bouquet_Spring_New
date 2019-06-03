package com.bouquet.domain.product;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// @Data 비추
// : 사용하지 않는 내용들까지 추가됨

@NoArgsConstructor  // 기본 생성자
@AllArgsConstructor // 전체 생성자
@Getter             // getter()
@Setter             // setter()
@ToString           // toString()
public class ProductDTO {
	private String p_code;
	private String p_type;
	private String p_name;
	private int p_price;
	private String p_img;
	private int p_cnt;
	private int p_good;
	private Date p_indate;
	
}
