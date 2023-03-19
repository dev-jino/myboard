package com.myboard.board.dto;

/*
이름     널?       유형            
------ -------- ------------- 
id     NOT NULL VARCHAR2(20)  
pwd             VARCHAR2(200) 
name            VARCHAR2(30)  
email           VARCHAR2(70)  
status          NUMBER
*/

public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private int status;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
