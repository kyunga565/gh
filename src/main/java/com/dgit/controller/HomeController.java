package com.dgit.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.Booking_Room;
import com.dgit.domain.Criteria;
import com.dgit.domain.LoginVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
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

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void roomviewGET(@ModelAttribute("dto") LoginVO dto, Model model) throws Exception {
		model.addAttribute("roomVO", rservice.selectAll());
		model.addAttribute("nextRno", rservice.nextrno());
		model.addAttribute("nextBno", bservice.nextbno());
		model.addAttribute("maxperson", bservice.maxperson());
	}

	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public void mypageGET(LoginVO dto, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		model.addAttribute("userVO", uservice.selectuser(id));
	}

	@RequestMapping(value = "adminpage", method = RequestMethod.GET)
	public void adminpageGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		/* 페이징 */
//		model.addAttribute("ADMIN", rservice.listCriteria(cri));
		model.addAttribute("ADMIN", rservice.listSearch(cri));
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
//		pm.setTotalCount(rservice.countPaging(cri));
		pm.setTotalCount(rservice.listSearchCount(cri));
		model.addAttribute("pageMaker", pm);
	}

	@RequestMapping(value = "adminpage_cal", method = RequestMethod.GET)
	public void adminpage_cal(Model model) throws Exception {
		model.addAttribute("ADMIN", rservice.selectADMIN());
	}
	
	
	@RequestMapping(value = "adminpage_mem", method = RequestMethod.GET)
	public void adminpage_mem(String uid,Model model) throws Exception {
		model.addAttribute("MEM", uservice.selectAllmember());
//		model.addAttribute("info",rservice.selectEND(uid)); 
		
	}
	

	@ResponseBody
	@RequestMapping(value = "mem", method = RequestMethod.GET)
	public ResponseEntity<List<Booking_Room>> mem(String uid) throws Exception {
		
		ResponseEntity<List<Booking_Room>> entity = null;
		List<Booking_Room> list = rservice.selectEND(uid);
		System.out.println(list);
		try {
			entity = new ResponseEntity<List<Booking_Room>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Booking_Room>>(HttpStatus.BAD_REQUEST);// 404
		}
		return entity;
	}
	
	
	@RequestMapping(value = "mypage_cal", method = RequestMethod.GET)
	public void mypage_calGET(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		model.addAttribute("roomVO", rservice.selectAll());
		model.addAttribute("nextRno", rservice.nextrno());
		model.addAttribute("nextBno", bservice.nextbno());
		model.addAttribute("maxperson", bservice.maxperson());

		String id = (String) session.getAttribute("id");
		model.addAttribute("END", rservice.selectEND(id));
	}

	@RequestMapping(value = "mypage_res", method = RequestMethod.GET)
	public void mypage_redGET(@ModelAttribute("cri") Criteria cri,Model model, HttpServletRequest request, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		model.addAttribute("END", rservice.selectEND(id));

	}
}
