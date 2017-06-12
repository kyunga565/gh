package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.RoomVO;

@Repository
public class RoomDaoImpl implements RoomDao {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.RoomMapper";

	@Override
	public void insertroom(RoomVO vo) throws Exception {
		session.insert(namespace + ".insertroom", vo);
	}

	@Override
	public void addAttach(String fullName, int rno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullName", fullName);
		map.put("rno", rno);

		session.insert(namespace + ".addAttach", map);
	}

	@Override
	public List<RoomVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public List<String> getAttach(int rno) throws Exception {
		return session.selectList(namespace + ".getAttach", rno);
	}

	// @Override
	// public RoomVO selectlist(int rno) throws Exception {
	// return session.selectOne(namespace + ".selectlist", rno);
	// }
	//
	// @Override
	// public List<String> selectroomname() throws Exception {
	// return session.selectList(namespace + ".selectroomname");
	// }

	@Override
	public int nextrno() throws Exception {
		return session.selectOne(namespace + ".nextrno");
	}

	@Override
	public void deleteroom(int rno) throws Exception {
		session.delete(namespace + ".deleteroom", rno);
	}

	@Override
	public RoomVO selectfromrno(int rno) throws Exception {
		return session.selectOne(namespace + ".selectfromrno", rno);
	}

	@Override
	public void update(RoomVO vo) throws Exception {
		session.update(namespace + ".updateroom", vo);
	}

	@Override
	public void removeAttach(int rno) throws Exception {
		session.delete(namespace+".removeAttach",rno);
	}

}
