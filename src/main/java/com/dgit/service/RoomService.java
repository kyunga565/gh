package com.dgit.service;

import java.util.List;

import com.dgit.domain.RoomVO;

public interface RoomService {
	void insertroom(RoomVO vo) throws Exception;

	List<RoomVO> selectAll() throws Exception;
//	RoomVO selectlist(int rno) throws Exception;
	public List<String> getAttach(int rno) throws Exception;
//	List<String> selectroomname() throws Exception;
	int nextrno() throws Exception;

	void deleteroom(int rno) throws Exception;
	RoomVO selectfromrno(int rno) throws Exception;//아직안씀
	
	void update(RoomVO vo) throws Exception;
}
