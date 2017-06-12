package com.dgit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dgit.domain.LoginVO;
import com.dgit.domain.UserVO;
import com.dgit.persistence.UserDao;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDao dao;

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
	public List<UserVO> selectuser(String id) throws Exception {
		return dao.selectuser(id);
	}

	@Override
	public List<UserVO> selectmypage(String id) throws Exception {
		return dao.selectmypage(id);
	}


}
