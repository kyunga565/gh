package com.dgit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dgit.domain.LoginVO;
import com.dgit.domain.RoomVO;
import com.dgit.domain.UserVO;
import com.dgit.persistence.BookingDao;
import com.dgit.persistence.UserDao;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDao dao;
	@Inject
	private BookingDao bdao;

	@Override
	public void join(UserVO vo) throws Exception {
		dao.join(vo);
	}

	@Override
	public List<UserVO> idCheck() throws Exception {
		return dao.idCheck();
	}

	@Override
	public UserVO login(LoginVO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void dropout(String id) throws Exception {
		bdao.delreservation(id);
		dao.dropout(id);
	}

	@Override
	public void changePW(UserVO vo) throws Exception {
		dao.changePW(vo);
	}

	@Override
	public UserVO selectuser(String id) throws Exception {
		return dao.selectuser(id);
	}

	@Override
	public void updatemem(UserVO vo) throws Exception {
		dao.updatemem(vo);
	}

	@Override
	public List<UserVO> selectAllmember() throws Exception {
		
		return dao.selectAllmember();
	}

	


}
