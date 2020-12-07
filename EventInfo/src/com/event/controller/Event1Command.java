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
		
		String category = "men"; // ī�װ� �̸�
		
		int totalListCnt = eventService.totalListCount(category); //��ü �ۼ�
		
		//����¡
		Pagination pagination = new Pagination(totalListCnt, page, 4);
		int startIndex = pagination.getStartIndex();
		int endIndex = pagination.getEndIndex();
		
		List<Event> events = eventService.findAll(category, startIndex, endIndex);
		
		System.out.println("��ü�ۼ�: " + pagination.getTotalListCnt() + " | ���� ������: " + pagination.getPage() + " | ����������:" +
                pagination.getStartPage() + " | ��������:" + pagination.getEndPage() + "");//Ȯ�ο�
		
		request.setAttribute("events", events);
		request.setAttribute("pagination", pagination);
	}
}
