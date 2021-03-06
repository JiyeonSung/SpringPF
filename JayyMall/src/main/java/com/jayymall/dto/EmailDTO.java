package com.jayymall.dto;

public class EmailDTO {

	private String senderName;	// 발신자 이름
	private String senderMail;	// 발신자 이메일 주소
	private String receiveMail; // 수신자 이메일 주소
	private String subject;		// 제목
	private String message;		// 본문
	
	public EmailDTO() {
		this.senderName = "JayyMall";
		this.senderMail = "JayyMall";
		this.subject = "JayyMall 인증코드입니다.";
		this.message = "이메일 인증을 위해,\n아래 인증코드를 이메일 인증코드 란에 입력하세요.\n\n인증코드: ";
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderMail() {
		return senderMail;
	}

	public void setSenderMail(String senderMail) {
		this.senderMail = senderMail;
	}

	public String getReceiveMail() {
		return receiveMail;
	}

	public void setReceiveMail(String receiveMail) {
		this.receiveMail = receiveMail;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "EmailDTO [senderName=" + senderName + ", senderMail=" + senderMail + ", receiveMail=" + receiveMail
				+ ", subject=" + subject + ", message=" + message + "]";
	}
	
	
}
