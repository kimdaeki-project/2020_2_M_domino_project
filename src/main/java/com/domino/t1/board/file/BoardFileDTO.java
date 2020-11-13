package com.domino.t1.board.file;

public class BoardFileDTO {
	
	private long file_Num;
	private long board_Num;
	private String file_Name;
	private String ori_Name;
	
	public long getFile_Num() {
		return file_Num;
	}
	public void setFile_Num(long file_Num) {
		this.file_Num = file_Num;
	}
	public long getBoard_Num() {
		return board_Num;
	}
	public void setBoard_Num(long board_Num) {
		this.board_Num = board_Num;
	}
	public String getFile_Name() {
		return file_Name;
	}
	public void setFile_Name(String file_Name) {
		this.file_Name = file_Name;
	}
	public String getOri_Name() {
		return ori_Name;
	}
	public void setOri_Name(String ori_Name) {
		this.ori_Name = ori_Name;
	}

}
