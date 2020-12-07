package com.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Event;
import com.event.domain.Pagination;
import com.event.service.EventService;

public class Event1Command implements Command{
	EventService eventService = EventService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		int page = 0;
		if(request.getParameter("page") == null) page = 1;
		else page = Integer.parseInt(String.valueOf(request.getParameter("page")));
		
		String category = "men"; //카테고리 이름
		
		int totalListCnt = eventService.totalListCount(category); //전체 글수
		
		//페이징
		Pagination pagination = new Pagination(totalListCnt, page, 4);
		int startIndex = pagination.getStartIndex();
		int endIndex = pagination.getEndIndex();
		
		List<Event> events = eventService.findAll(category, startIndex, endIndex);
		
		System.out.println("전체글수: " + pagination.getTotalListCnt() + " | 현재 페이지: " + pagination.getPage() + " | 시작페이지:" +
                pagination.getStartPage() + " | 끝페이지:" + pagination.getEndPage() + "");//확인용
		
		request.setAttribute("events", events);
		request.setAttribute("pagination", pagination);
	}
}
