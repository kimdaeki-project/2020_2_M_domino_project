package com.domino.t1.address;

import com.domino.t1.member.memberInquirly.MemberInquirlyDTO;

public class AddressDTO extends MemberInquirlyDTO{
	
	private String roadFullAddr;
	
	public String getRoadFullAddr() {
		return roadFullAddr;
	}
	public void setRoadFullAddr(String roadFullAddr) {
		this.roadFullAddr = roadFullAddr;
	}


}
