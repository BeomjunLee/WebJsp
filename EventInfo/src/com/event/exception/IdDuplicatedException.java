package com.event.exception;

@SuppressWarnings("serial")
public class IdDuplicatedException extends RuntimeException{
	public IdDuplicatedException(String msg) {
		super(msg);
	}
}
