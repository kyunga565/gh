package com.dgit.service;

import java.util.List;

import com.dgit.domain.BookingVO;

public interface BookingService {
	void reservation(BookingVO vo) throws Exception;

	int nextbno() throws Exception;
	
	int maxperson() throws Exception;
	int selectrno(String id) throws Exception;
}
