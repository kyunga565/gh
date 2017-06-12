package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.LoginVO;
import com.dgit.domain.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.UserMapper";

	@Override
	public void join(UserVO vo) throws Exception {
		session.insert(namespace + ".join", vo);
	}

	@Override
	public List<UserVO> idCheck() throws Exception {
		return session.selectList(namespace + ".idCheck");
	}

	@Override
	public UserVO login(LoginVO dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public List<UserVO> selectuser(String id) throws Exception {
		return session.selectList(namespace + ".selectuser",id);
	}

	@Override
	public List<UserVO> selectmypage(String id) throws Exception {
		return session.selectList(namespace+".selectmypage",id);
	}

}
