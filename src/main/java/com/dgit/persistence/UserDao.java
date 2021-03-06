package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.LoginVO;
import com.dgit.domain.UserVO;

public interface UserDao {
	public void join(UserVO vo) throws Exception;
	public UserVO login(LoginVO dto) throws Exception;
	List<UserVO> idCheck() throws Exception;
	List<UserVO> selectuser(String id) throws Exception;
	List<UserVO> selectmypage(String id) throws Exception;
}
