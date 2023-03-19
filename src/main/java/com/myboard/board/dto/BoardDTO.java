package com.myboard.board.dto;

/*
이름        널?       유형             
--------- -------- -------------- 
IDX       NOT NULL NUMBER         
MEMBER_ID NOT NULL VARCHAR2(20)   
TITLE              VARCHAR2(120)  
CONTENT            VARCHAR2(1500) 
RECOMMEND          NUMBER         
HIT                NUMBER         
REG_DATE           DATE           
STATUS             NUMBER
*/

public class BoardDTO {
	private int idx;
	private String memberId;
	private String title;
	private String content;
	private int recommend;
	private int hit;
	private String regDate;
	private int status;
	private int reply;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
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

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}
}
