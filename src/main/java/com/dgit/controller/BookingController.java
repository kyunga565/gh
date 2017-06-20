package com.dgit.controller;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.BookingVO;
import com.dgit.service.BookingService;

@Controller
@RequestMapping("/*")
public class BookingController {

	@Inject
	private BookingService service;

	@RequestMapping(value = "booking", method = RequestMethod.POST)
	public String book_Post(BookingVO vo, RedirectAttributes rttr) throws Exception {
		service.reservation(vo);
		rttr.addFlashAttribute("book", "success");
		System.out.println("예약완료");
		return "redirect:main";
	}

	@RequestMapping(value = "booking_cal", method = RequestMethod.POST)
	public String book_cal_Post(BookingVO vo, RedirectAttributes rttr) throws Exception {
		service.reservation(vo);
		rttr.addFlashAttribute("book", "success");
		System.out.println("예약완료");
		return "redirect:mypage_res";
	}

	@ResponseBody
	@RequestMapping(value = "changeState", method = RequestMethod.GET)
	public void stateChange(int bno) throws Exception {
		System.out.println(bno + "예약취소로 변경");
		service.changeState(bno);
	}

}
