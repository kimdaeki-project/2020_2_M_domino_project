package com.domino.t1.branchInfo;

public class BranchInfoDTO {
	
	private int branch_num;
	private String branch_name;
	private String branch_phone;
	private String region1;
	private String region2;
	private String street_address;
	private String hours;
	private String parking_info;
	private String salename1;
	private String salename2;
	private String spcl_sale;
	private double latitude;
	private double longitude;
	
	public int getBranch_num() {
		return branch_num;
	}
	public void setBranch_num(int branch_num) {
		this.branch_num = branch_num;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getBranch_phone() {
		return branch_phone;
	}
	public void setBranch_phone(String branch_phone) {
		this.branch_phone = branch_phone;
	}
	public String getRegion1() {
		return region1;
	}
	public void setRegion1(String region1) {
		this.region1 = region1;
	}
	public String getRegion2() {
		return region2;
	}
	public void setRegion2(String region2) {
		this.region2 = region2;
	}
	public String getStreet_address() {
		return street_address;
	}
	public void setStreet_address(String street_address) {
		this.street_address = street_address;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public String getParking_info() {
		return parking_info;
	}
	public void setParking_info(String parking_info) {
		this.parking_info = parking_info;
	}
	public String getSalename1() {
		return salename1;
	}
	public void setSalename1(String salename1) {
		this.salename1 = salename1;
	}
	public String getSalename2() {
		return salename2;
	}
	public void setSalename2(String salename2) {
		this.salename2 = salename2;
	}
	public String getSpcl_sale() {
		return spcl_sale;
	}
	public void setSpcl_sale(String spcl_sale) {
		this.spcl_sale = spcl_sale;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

}
