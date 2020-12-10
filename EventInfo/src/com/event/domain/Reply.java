package com.event.domain;

public class Reply {
	private Long reply_uid; 
	private Long review_uid; 
	private Long member_uid; 
	private Long group_id;
	private String writer;
	private String content;
	private String regdate;
	
	protected Reply() {};
	
	
	public Reply(Long reply_uid, Long review_uid, Long member_uid, Long group_id, String writer, String content, String regdate) {
		this.reply_uid = reply_uid;
		this.review_uid = review_uid;
		this.member_uid = member_uid;
		this.group_id = group_id;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
	}
	
	public String getWriter() {
		return writer;
	}

	public Long getReply_uid() {
		return reply_uid;
	}
	public Long getReview_uid() {
		return review_uid;
	}
	public Long getMember_uid() {
		return member_uid;
	}
	public Long getGroup_id() {
		return group_id;
	}
	public String getContent() {
		return content;
	}
	public String getRegdate() {
		return regdate;
	}
	
	
}
