package com.event.domain;


public class Review {
	 private Long review_uid;
	 private Long member_uid;
	 private String writer;
	 private String category;
	 private String title;
	 private String content;
	 private String img;
	 private int view_count;
	 private int recommend;
	 private String regdate;
	 
	 protected Review() {} //그냥 생성불가

	public Review(Long review_uid, Long member_uid, String writer, String category, String title, String content, String img,
			int view_count, int recommend, String regdate) {
		this.review_uid = review_uid;
		this.member_uid = member_uid;
		this.writer = writer;
		this.category = category;
		this.title = title;
		this.content = content;
		this.img = img;
		this.view_count = view_count;
		this.recommend = recommend;
		this.regdate = regdate;
	}

	public Long getReview_uid() {
		return review_uid;
	}

	public String getCategory() {
		return category;
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

	public String getImg() {
		return img;
	}

	public int getView_count() {
		return view_count;
	}
	
	public int getRecommend() {
		return recommend;
	}

	public String getRegdate() {
		return regdate;
	}	
	
	public String getWriter() {
		return writer;
	}

	@Override
	public String toString() {
		return "[리뷰글 ]" + review_uid + "|" + "|" + member_uid + "|" + writer+ "|" + category + "|" + title + "|" + content + "|" + img + "|" + view_count + "|" + recommend + "|" + regdate;
	}
}
