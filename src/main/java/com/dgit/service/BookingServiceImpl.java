package com.dgit.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.dgit.domain.BookingVO;
import com.dgit.persistence.BookingDao;

@Service
public class BookingServiceImpl implements BookingService{

	@Inject
	private BookingDao dao;

	@Override
	public void reservation(BookingVO vo) throws Exception {
		dao.reservation(vo);
	}

	@Override
	public int nextbno() throws Exception {
		return dao.nextbno();
	}

	@Override
	public int maxperson() throws Exception {
		return dao.maxperson();
	}

	@Override
	public int selectrno(String id) throws Exception {
		return dao.selectrno(id);
	}
	@Override
	public void delreservation(String id) throws Exception {
		dao.delreservation(id);
	}

	@Override
	public void changeState(int bno) throws Exception {
		dao.changeState(bno);
	}

	@Override
	public List<BookingVO> selectbookfromid(String id) throws Exception {
		return dao.selectbookfromid(id);
	}






}
