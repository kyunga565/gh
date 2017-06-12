package com.dgit.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
		System.out.println("______1" + vo.getFiles() + " / " + vo.getRno());

		// 파일추가
		String[] files = vo.getFiles();
		if (files == null)
			return;
		for (String fileName : files) {
			System.out.println("______2" + fileName + " / " + vo.getRno());

			dao.addAttach(fileName, vo.getRno());
			System.out.println("______3" + vo.getFiles());
		}

	}

	@Override
	public List<RoomVO> selectAll() throws Exception {
		List<RoomVO> vo = dao.selectAll();

		for (int i = 0; i < dao.selectAll().size(); i++) {
			List<String> files = dao.getAttach(vo.get(i).getRno());
			vo.get(i).setFiles(files.toArray(new String[files.size()]));
			
			System.out.println(files+"파일1");
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
		System.out.println(files + "파일2"+vo.getRno());
		if (files == null)
			return;
		
		dao.removeAttach(vo.getRno());
		for (String fileName : files) {
			dao.addAttach(fileName, vo.getRno());
		}
	}

}
