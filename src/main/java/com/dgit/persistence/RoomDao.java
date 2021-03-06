package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.RoomVO;

public interface RoomDao {
	public void insertroom(RoomVO vo) throws Exception;

	public void addAttach(String fullName, int rno) throws Exception;;

	public List<RoomVO> selectAll() throws Exception;
//	RoomVO selectlist(int rno) throws Exception;
	
	public List<String> getAttach(int rno) throws Exception;
	
//	List<String> selectroomname() throws Exception;
	
	int nextrno() throws Exception;
	void deleteroom(int rno) throws Exception;
	RoomVO selectfromrno(int rno) throws Exception;
	void update(RoomVO vo) throws Exception;
	
	void removeAttach(int rno) throws Exception;
}
