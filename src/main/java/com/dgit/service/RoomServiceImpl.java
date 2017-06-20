package com.dgit.service;

import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Booking_Room;
import com.dgit.domain.Criteria;
import com.dgit.domain.RoomVO;
import com.dgit.persistence.RoomDao;

@Service
public class RoomServiceImpl implements RoomService {

	@Inject
	private RoomDao dao;

	@Transactional
	@Override
	public void insertroom(RoomVO vo) throws Exception {
		dao.insertroom(vo);

		// 파일추가
		String[] files = vo.getFiles();
		if (files == null)
			return;
		for (String fileName : files) {
			dao.addAttach(fileName, vo.getRno());
		}
	}

	@Override
	public List<RoomVO> selectAll() throws Exception {
		List<RoomVO> vo = dao.selectAll();

		for (int i = 0; i < dao.selectAll().size(); i++) {
			List<String> files = dao.getAttach(vo.get(i).getRno());
			vo.get(i).setFiles(files.toArray(new String[files.size()]));
			
		}
		return vo;
	}

	@Override
	public List<String> getAttach(int rno) throws Exception {
		return dao.getAttach(rno);
	}

	@Override
	public int nextrno() throws Exception {
		
		return dao.nextrno();
	}

	@Override
	public void deleteroom(int rno) throws Exception {
		dao.deleteroom(rno);
	}

	@Override
	public RoomVO selectfromrno(int rno) throws Exception {
		RoomVO vo = dao.selectfromrno(rno);
		List<String> files = dao.getAttach(rno);
		vo.setFiles(files.toArray(new String[files.size()]));
		return vo;
	}

	@Transactional
	@Override
	public void update(RoomVO vo) throws Exception {
		dao.update(vo);

		String[] files = vo.getFiles();
		if (files == null)
			return;
		
		dao.removeAttach(vo.getRno());
		for (String fileName : files) {
			dao.addAttach(fileName, vo.getRno());
		}
	}
	
	@Override
	public List<Booking_Room> selectEND(String id) throws Exception {
		List<Booking_Room> vo = dao.selectEND(id);

		for (int i = 0; i < dao.selectEND(id).size(); i++) {
			List<String> files = dao.getAttach(vo.get(i).getRno());
			vo.get(i).setFiles(files.toArray(new String[files.size()]));
		}
		return vo;
		
	}

	@Override
	public List<Booking_Room> selectADMIN() throws Exception {
		List<Booking_Room> vo = dao.selectADMIN();

		for (int i = 0; i < dao.selectADMIN().size(); i++) {
			List<String> files = dao.getAttach(vo.get(i).getRno());
			vo.get(i).setFiles(files.toArray(new String[files.size()]));
		}
		return vo;
		
	}

	@Override
	public void updatebookroom(Booking_Room vo) throws Exception {
		dao.updatebookroom(vo);
	}

	@Override
	public Booking_Room selectADMIN_update(int bno) throws Exception {
		return dao.selectADMIN_update(bno);
	}

	@Override
	public List<Booking_Room> listCriteria(Criteria cri) throws Exception {
		List<Booking_Room> vo = dao.listCriteria(cri);

		for (int i = 0; i < dao.listCriteria(cri).size(); i++) {
			List<String> files = dao.getAttach(vo.get(i).getRno());
			vo.get(i).setFiles(files.toArray(new String[files.size()]));
		}
		return vo;
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	/* 해당방에 들어갈수있는인원 */
	@Override
	public int selectpeople(int rno) throws Exception {
		return dao.selectpeople(rno);
	}

	/* ㅇㅖ약된 인원 */
	@Override
	public int selectsumperson(int rno,Date startdate) throws Exception {
		return dao.selectsumperson(rno,startdate);
	}


}
