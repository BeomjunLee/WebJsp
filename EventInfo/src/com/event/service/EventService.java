package com.event.service;

import java.sql.SQLException;
import java.util.List;

import com.event.domain.Event;
import com.event.repository.EventRepository;

public class EventService {
	private static EventService eventService = new EventService();
	
	public static EventService getInstance() {
		return eventService;
	}
	
	EventRepository eventRepository = EventRepository.getInstance();
	//이벤트 전체 검색
	public List<Event> findAll(String category, int startIndex, int pageSize){
		try {
			return eventRepository.findAll(category, startIndex, pageSize);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//전체 글 수
		public int totalListCount(String category) {
			try {
				return eventRepository.totalListCount(category);
			} catch (SQLException e) {
				e.printStackTrace();
				return 0;
			}
		}
}
