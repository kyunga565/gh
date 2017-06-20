package com.dgit.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.dgit.domain.Criteria;
import com.dgit.domain.LoginVO;
import com.dgit.domain.PageMaker;
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
	public void adminpageGET(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {
		/* 페이징 */
		model.addAttribute("ADMIN", rservice.listCriteria(cri));
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(rservice.countPaging(cri));
		model.addAttribute("pageMaker", pm);
	}

	@RequestMapping(value = "adminpage_cal", method = RequestMethod.GET)
	public void adminpage_cal(Model model) throws Exception {
		model.addAttribute("ADMIN", rservice.selectADMIN());
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
	public void mypage_redGET(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		model.addAttribute("END", rservice.selectEND(id));
	}
}
