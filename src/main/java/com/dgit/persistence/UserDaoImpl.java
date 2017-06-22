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
	public void dropout(String id) throws Exception {
		session.delete(namespace + ".dropout", id);
	}

	@Override
	public void changePW(UserVO vo) throws Exception {
		session.update(namespace + ".changePW", vo);
	}

	@Override
	public UserVO selectuser(String id) throws Exception {
		return session.selectOne(namespace + ".selectuser", id);
	}

	@Override
	public void updatemem(UserVO vo) throws Exception {
		session.update(namespace + ".updatemem", vo);
	}

	@Override
	public List<UserVO> selectAllmember() throws Exception {
		return session.selectList(namespace+".selectAllmember");
	}

}
