package com.domino.t1.address;

import com.domino.t1.member.MemberDTO;

public class AddressDTO extends MemberDTO{
	
	private String roadFullAddr;
	
	public String getRoadFullAddr() {
		return roadFullAddr;
	}
	public void setRoadFullAddr(String roadFullAddr) {
		this.roadFullAddr = roadFullAddr;
	}


}
