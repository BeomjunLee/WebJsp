package com.event.domain;

public class Event {
	private Long event_uid;
	private String category;
	private String title;
	private String content;
	private String img;
	private int view_count;
	private int recommend;
	private String regdate;
	
    protected Event() {}

	public Event(Long event_uid, String category, String title, String content, String img, int view_count,
			int recommend, String regdate) {
		super();
		this.event_uid = event_uid;
		this.category = category;
		this.title = title;
		this.content = content;
		this.img = img;
		this.view_count = view_count;
		this.recommend = recommend;
		this.regdate = regdate;
	}

	public Long getEvent_uid() {
		return event_uid;
	}

	public String getCategory() {
		return category;
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
    
    
}
