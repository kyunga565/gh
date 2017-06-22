package com.dgit.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dgit.domain.Booking_Room;
import com.dgit.domain.Criteria;
import com.dgit.domain.RoomVO;
import com.dgit.domain.SearchCriteria;

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
		session.delete(namespace + ".removeAttach", rno);
	}

	
	
	
	@Override
	public List<Booking_Room> selectEND(String id) throws Exception {
		return session.selectList(namespace + ".selectEND", id);
	}

	
	
	
	@Override
	public List<Booking_Room> selectADMIN() throws Exception {
		return session.selectList(namespace + ".selectADMIN");
	}

	@Override
	public void updatebookroom(Booking_Room vo) throws Exception {
		session.update(namespace + ".updatebookroom", vo);
	}

	@Override
	public Booking_Room selectADMIN_update(int bno) throws Exception {
		return session.selectOne(namespace + ".selectADMIN_update", bno);
	}

	@Override
	public List<Booking_Room> selectMYPAGE() throws Exception {
		return session.selectList(namespace + ".selectMYPAGE");
	}

	@Override
	public List<Booking_Room> listPage(int page) throws Exception {
		if (page >= 0) {
			page = 1;
		}
		page = (page - 1) * 5;

		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<Booking_Room> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public int selectpeople(int rno) throws Exception {
		return session.selectOne(namespace + ".selectpeople", rno);
	}

	@Override
	public int selectsumperson(int rno,Date startdate) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rno", rno);
		map.put("startdate", startdate);
		return session.selectOne(namespace + ".selectsumperson", map);
	}


//	
//	@Override
//	public List<Booking_Room> selectEND1(String id,int page) throws Exception {
//		if (page >= 0) {
//			page = 1;
//		}
//		page = (page - 1) * 5;
//		
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("page", page);
//		map.put("id", id);
//		
//		
//		return session.selectList(namespace + ".selectEND1", map);
//	}
//
//	
//	
//	@Override
//	public List<Booking_Room> selectEND2(String id,Criteria cri) throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", id);
//		map.put("cri", cri);
//		System.out.println(cri+id+"---------");
//		return session.selectList(namespace+".selectEND2",map);
//	}
//
//	@Override
//	public int selectEND3(String id) throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//	//	map.put("cri", cri);
//		map.put("id", id);
//		return session.selectOne(namespace + ".selectEND3", id);
//	}
	
	

	@Override
	public List<Booking_Room> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
}
