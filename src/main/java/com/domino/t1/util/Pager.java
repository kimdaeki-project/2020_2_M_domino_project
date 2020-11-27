package com.domino.t1.util;

import com.domino.t1.address.AddressDTO;

public class Pager extends AddressDTO{
	
	
	private String kind;
	private String search;
	
	private Integer curPage; 
	
	private int startRow;
	private int lastRow;
	
	private int perPage; 
	

	private long startNum;
	private long lastNum;
	private boolean beforeCheck;
	private boolean nextCheck;
	
	
	private long totalCount;
	
	public Pager() {
		this.perPage=10;
	}
	

	public void makeRow() {
		
		startRow = (this.getCurPage()-1)*this.getPerPage()+1;
		lastRow = this.getCurPage()*this.getPerPage();

	}
	
	public void makePage() {

		long totalPage = this.getTotalCount()/10; 
		if(this.getTotalCount()%10 !=0) {
			totalPage++;
		}
		
		long totalBlock = totalPage/5;
		if(totalPage%5 !=0) {
			totalBlock++;
				}
		
		long curBlock = this.getCurPage()/5;
		if(this.getCurPage()%5 !=0) {
			curBlock++;
		}
		
		this.startNum = (curBlock-1)*5+1; 
		this.lastNum = curBlock*5;
		
		this.nextCheck=true;
		if(curBlock == totalBlock) {
			nextCheck = !nextCheck;
			lastNum = totalPage;
		}
		
		this.beforeCheck = true;
		if(curBlock == 1) {
			beforeCheck =! beforeCheck;
		}	
	}
	
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(search==null) {
			search="";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public long getStartNum() {
		return startNum;
	}
	
	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}

	public long getLastNum() {
		return lastNum;
	}

	public void setLastNum(long lastNum) {
		this.lastNum = lastNum;
	}

	public boolean isBeforeCheck() {
		return beforeCheck;
	}

	public void setBeforeCheck(boolean beforeCheck) {
		this.beforeCheck = beforeCheck;
	}

	public boolean isNextCheck() {
		return nextCheck;
	}

	public void setNextCheck(boolean nextCheck) {
		this.nextCheck = nextCheck;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getCurPage() {
		if(curPage==null){
			curPage=1;
		}
		return curPage;
	}

	public void setCurPage(Integer curPage) {
		if(curPage == null) {
			curPage=1;
		}
		this.curPage = curPage;
	}

	public long getTotalCount() {
		if(this.totalCount==0) {
			this.totalCount=1;
		}
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}

}
