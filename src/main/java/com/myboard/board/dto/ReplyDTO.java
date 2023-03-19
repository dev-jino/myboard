package com.myboard.board.dto;

/*
이름        널?       유형            
--------- -------- ------------- 
IDX       NOT NULL NUMBER        
BOARD_IDX NOT NULL NUMBER        
MEMBER_ID NOT NULL VARCHAR2(20)  
CONTENT            VARCHAR2(900) 
REG_DATE           DATE          
STATUS             NUMBER  
*/

public class ReplyDTO {
	private int idx;
	private int boardIdx;
	private String memberId;
	private String content;
	private String regDate;
	private int status;
	
	public ReplyDTO() {
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
