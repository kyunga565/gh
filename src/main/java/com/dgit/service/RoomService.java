package com.dgit.service;

import java.util.List;

import com.dgit.domain.BookingVO;
import com.dgit.domain.Booking_Room;
import com.dgit.domain.RoomVO;

public interface RoomService {
	void insertroom(RoomVO vo) throws Exception;

	List<RoomVO> selectAll() throws Exception;
//	RoomVO selectlist(int rno) throws Exception;
	public List<String> getAttach(int rno) throws Exception;
//	List<String> selectroomname() throws Exception;
	int nextrno() throws Exception;

	void deleteroom(int rno) throws Exception;

	RoomVO selectfromrno(int rno) throws Exception;

	void update(RoomVO vo) throws Exception;
	List<RoomVO> selectbook(String id) throws Exception;
	
	

	List<Booking_Room> selectEND(String id) throws Exception;
	List<Booking_Room> selectADMIN() throws Exception;

}
