package com.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Event;
import com.event.domain.Pagination;
import com.event.service.EventService;

public class ReadEvent1Command implements Command{
	
	EventService eventService = EventService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		//이벤트 uid받기
		Long event_uid = Long.parseLong(String.valueOf(request.getParameter("uid")));
		
		//uid값 이벤트 찾기
		Event event = eventService.findByUid(event_uid);
		
		request.setAttribute("event", event);
	}
}
