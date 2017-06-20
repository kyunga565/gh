package com.dgit.service;

import java.util.Date;
import java.util.List;
import com.dgit.domain.Booking_Room;
import com.dgit.domain.Criteria;
import com.dgit.domain.RoomVO;

public interface RoomService {
	void insertroom(RoomVO vo) throws Exception;

	List<RoomVO> selectAll() throws Exception;
	
	public List<String> getAttach(int rno) throws Exception;
	
	int nextrno() throws Exception;

	void deleteroom(int rno) throws Exception;

	RoomVO selectfromrno(int rno) throws Exception;

	void update(RoomVO vo) throws Exception;
	
	List<Booking_Room> selectEND(String id) throws Exception;
	
	List<Booking_Room> selectADMIN() throws Exception;
	
	Booking_Room selectADMIN_update(int bno) throws Exception;
	
	void updatebookroom(Booking_Room vo) throws Exception;
	
	/*페이징*/
	List<Booking_Room> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	/* 해당방에 들어갈수있는인원 */
	int selectpeople(int rno) throws Exception;
	/* ㅇㅖ약된 인원 */
	int selectsumperson(int rno,Date startdate) throws Exception;
}
