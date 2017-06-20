package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Booking_Room;
import com.dgit.domain.Criteria;
import com.dgit.domain.RoomVO;

public interface RoomDao {
	public void insertroom(RoomVO vo) throws Exception;
	public void addAttach(String fullName, int rno) throws Exception;;

	public List<RoomVO> selectAll() throws Exception;
	public List<String> getAttach(int rno) throws Exception;
	int nextrno() throws Exception;
	void deleteroom(int rno) throws Exception;
	RoomVO selectfromrno(int rno) throws Exception;
	void update(RoomVO vo) throws Exception;
	
	void removeAttach(int rno) throws Exception;
	List<RoomVO> selectbook(String id) throws Exception;
	
	List<Booking_Room> selectEND(String id) throws Exception;

	List<Booking_Room> selectADMIN() throws Exception;
	
	void updatebookroom(Booking_Room vo) throws Exception;
	Booking_Room selectADMIN_update(int bno) throws Exception;
	List<Booking_Room> selectMYPAGE() throws Exception;
	
	/* 페이징 */
	List<Booking_Room> listPage(int page) throws Exception;
	List<Booking_Room> listCriteria(Criteria cri) throws Exception;
	public int countPaging(Criteria cri) throws Exception;
}
