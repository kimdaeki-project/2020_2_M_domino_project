package com.domino.t1.address;

import com.domino.t1.member.memberInquirly.MemberInquirlyDTO;

public class AddressDTO extends MemberInquirlyDTO{
	
	private String roadFullAddr;
	private long address_num;
	
	
	
	public long getAddress_num() {
		return address_num;
	}
	public void setAddress_num(long address_num) {
		this.address_num = address_num;
	}
	public String getRoadFullAddr() {
		return roadFullAddr;
	}
	public void setRoadFullAddr(String roadFullAddr) {
		this.roadFullAddr = roadFullAddr;
	}


}
