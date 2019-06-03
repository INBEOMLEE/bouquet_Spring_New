package com.bouquet.domain.member;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberDTO {
	private String bid;
	private String bpw;
	private String bname;
	private String bphone;
	private String bemail;
	private String bzipcode;
	private String baddr1;
	private String baddr2;
	private Date regdate;
}
