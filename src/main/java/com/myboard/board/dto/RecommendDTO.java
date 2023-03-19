package com.myboard.board.dto;

/*
 이름        널?       유형           
--------- -------- ------------ 
IDX       NOT NULL NUMBER       
BOARD_IDX NOT NULL NUMBER       
MEMBER_ID NOT NULL VARCHAR2(20) 
*/

public class RecommendDTO {
	private int idx;
	private int boardIdx;
	private String memberId;
	
	public RecommendDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
}
