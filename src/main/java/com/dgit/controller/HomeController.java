package com.dgit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.BookingVO;
import com.dgit.domain.LoginVO;
import com.dgit.domain.RoomVO;
import com.dgit.domain.UserVO;
import com.dgit.interceptor.LoginInterceptor;
import com.dgit.service.BookingService;
import com.dgit.service.RoomService;
import com.dgit.service.UserService;


@Controller
@RequestMapping("/*")
public class HomeController {

	@Resource(name = "uploadPath")
	private String uploadPath;

	@Inject
	private UserService uservice;
	@Inject
	private RoomService rservice;
	@Inject
	private BookingService bservice;

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public void roomviewGET(@ModelAttribute("dto") LoginVO dto, Model model) throws Exception {
		model.addAttribute("roomVO", rservice.selectAll());
		int Nextrno = rservice.nextrno();
		model.addAttribute("nextRno", Nextrno);
		int Nextbno = bservice.nextbno();
		model.addAttribute("nextBno", Nextbno);
		int Maxperson = bservice.maxperson();
		model.addAttribute("maxperson", Maxperson);
	}

/*	@RequestMapping(value = "test2", method = RequestMethod.GET)
	public void roomviewGET2(RoomVO vo, Model model) throws Exception {
		model.addAttribute("roomVO", rservice.selectAll());
		int Nextrno = rservice.nextrno();
		model.addAttribute("nextRno", Nextrno);
		int Nextbno = bservice.nextbno();
		model.addAttribute("nextBno", Nextbno);
		int Maxperson = bservice.maxperson();
		model.addAttribute("maxperson", Maxperson);
		
	}*/

	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public void mypageGET(LoginVO dto,Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute(LoginInterceptor.LOGIN);
		String id = (String) session.getAttribute("id");
		model.addAttribute("userVO", uservice.selectuser(id));
		model.addAttribute("myinfo", uservice.selectmypage(id));
		
		int rno = bservice.selectrno(id);
		System.out.println(rno);
		model.addAttribute("roominfo", rservice.selectfromrno(rno));
		
	}
	
}
