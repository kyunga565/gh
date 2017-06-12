package com.dgit.guesthouse;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.RoomVO;
import com.dgit.persistence.RoomDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class RoomDaoTest {
	
	@Autowired
	private RoomDao dao;
	
//	@Test
	public void testInsert() throws Exception{
		RoomVO vo = new RoomVO();
		vo.setRno(2);
		vo.setPrice(1000);
		vo.setPeople(1);
		vo.setRoomname("방이름test");
		vo.setFiles(null);
		dao.insertroom(vo);
	}

//	vo.setRegdate(new Date(2017, 04, 10));
	@Test
	public void testSelectAll() throws Exception{
		dao.selectfromrno(1);
		System.out.println(dao.selectfromrno(1));
	}
	
//	@Test
	public void testDelete() throws Exception{
		dao.deleteroom(1);
		
	}
}
