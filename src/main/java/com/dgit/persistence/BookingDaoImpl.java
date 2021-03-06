package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.BookingVO;

@Repository
public class BookingDaoImpl implements BookingDao {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.BookingMapper";

	@Override
	public void reservation(BookingVO vo) throws Exception {
		session.insert(namespace + ".reservation", vo);
	}

	@Override
	public int nextbno() throws Exception {
		return session.selectOne(namespace + ".nextbno");
	}

	@Override
	public int maxperson() throws Exception {
		return session.selectOne(namespace + ".maxperson");
	}

	@Override
	public int selectrno(String id) throws Exception {
		return session.selectOne(namespace+".selectrno",id);
	}

}
