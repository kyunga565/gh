package com.dgit.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.LoginVO;
import com.dgit.domain.UserVO;
import com.dgit.service.UserService;

@Controller
@RequestMapping("/*")
public class UserController {

	@Inject
	private UserService service;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() {
		logger.info("회원가입 GET 실행");
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String joinPOST(UserVO vo, RedirectAttributes rttr) throws Exception {
		service.join(vo);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/main";
	}

	@RequestMapping(value = "login-post", method = RequestMethod.POST)
	public String loginPOST(LoginVO dto, Model model, HttpSession session, RedirectAttributes rttr) throws Exception {

		UserVO vo = service.login(dto);
		System.out.println(dto.getUid() + " / ");
		if (vo == null) {
			rttr.addFlashAttribute("error", "x");
		} else {
			rttr.addFlashAttribute("error", "o");
			session.setAttribute("id", dto.getUid());
		}
		model.addAttribute("userDTO", dto);
		return "redirect:/main";
	}

	@ResponseBody
	@RequestMapping(value = "idCheck/{uid}", method = RequestMethod.GET)
	public ResponseEntity<String> checkId(@PathVariable("uid") String uid) throws Exception {
		ResponseEntity<String> result = null;
		try {
			List<UserVO> vo = service.idCheck();
			boolean idoverlap = false;
			for (int i = 0; i < vo.size(); i++) {
				if (uid.equals(vo.get(i).getUid())) {
					idoverlap = true;
					break;
				}
			}
			if (idoverlap == true) {
				result = new ResponseEntity<String>("fail", HttpStatus.OK);
			} else {
				result = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) throws Exception {
		String vo = (String) session.getAttribute("id");
		if (vo != null) {
			session.removeAttribute("id");
			session.invalidate();
		}
		rttr.addFlashAttribute("logout", "success");
		return "redirect:/main";
	}

	@ResponseBody
	@RequestMapping(value = "dropout", method = RequestMethod.GET)
	public void leavemember(HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		service.dropout(id);
		session.removeAttribute("id");
		session.invalidate();
		System.out.println("회원탈퇴" + id);
	}

	@RequestMapping(value = "changePW", method = RequestMethod.POST)
	public String changePW(LoginVO dto, HttpSession session, RedirectAttributes rttr) throws Exception {
		String id = (String) session.getAttribute("id");
		UserVO vo = service.selectuser(id);
		vo.setUpw(dto.getUpw());
		service.changePW(vo);

		rttr.addFlashAttribute("changePW", "success");
		return "redirect:/mypage";
	}

	@RequestMapping(value = "mem_update", method = RequestMethod.POST)
	public String memUPDATE(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		String id = (String) session.getAttribute("id");
		UserVO user = service.selectuser(id);

		user.setUtel(vo.getUtel());
		user.setUaddr(vo.getUaddr());
		service.updatemem(user);

		rttr.addFlashAttribute("changeMEM", "success");
		return "redirect:/mypage";
	}

}
