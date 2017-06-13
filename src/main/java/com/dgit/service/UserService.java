package com.dgit.service;

import java.util.List;

import com.dgit.domain.LoginVO;
import com.dgit.domain.UserVO;

public interface UserService {
	void join(UserVO vo) throws Exception;
	List<UserVO> idCheck() throws Exception;
	public UserVO login(LoginVO dto) throws Exception;
	List<UserVO> selectuser(String id) throws Exception;
//	List<UserVO> selectmypage(String id) throws Exception;
	
	void dropout(String id) throws Exception;
	
	void changePW(UserVO vo) throws Exception;
	UserVO selectuser2(String id) throws Exception;
}
