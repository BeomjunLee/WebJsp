package com.event.domain;

public class Review {
	 private Long review_uid;
	 private Long event_uid;
	 private Long member_uid;
	 private String title;
	 private String content;
	 private String file;
	 private int view_count;
	 
	 protected Review() {} //그냥 생성불가

	public Review(Long review_uid, Long event_uid, Long member_uid, String title, String content, String file,
			int view_count) {
		this.review_uid = review_uid;
		this.event_uid = event_uid;
		this.member_uid = member_uid;
		this.title = title;
		this.content = content;
		this.file = file;
		this.view_count = view_count;
	}

	public Long getReview_uid() {
		return review_uid;
	}

	public Long getEvent_uid() {
		return event_uid;
	}

	public Long getMember_uid() {
		return member_uid;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getFile() {
		return file;
	}

	public int getView_count() {
		return view_count;
	}
	
	@Override
	public String toString() {
		return "[리뷰글 ]" + review_uid + "|" + event_uid + "|" + member_uid + "|" + title + "|" + content + "|" + file + "|" + view_count + "|";
	}
}
