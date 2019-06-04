package com.bouquet.persistence.member;

import com.bouquet.domain.member.MemberDTO;

public interface MemberDAO {
	public int idCheck(String id);
	
	public int create(MemberDTO mDto);
	
	public String login(MemberDTO mDto);
	
	public MemberDTO viewMember(String bid);

}
