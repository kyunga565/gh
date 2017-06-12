package com.dgit.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.BookingVO;
import com.dgit.service.BookingService;

@Controller
@RequestMapping("/*")
public class BookingController {

	@Inject
	private BookingService service;


	@RequestMapping(value = "booking", method = RequestMethod.POST)
	public String registerPost(BookingVO vo, RedirectAttributes rttr) throws Exception {

		service.reservation(vo);

		rttr.addFlashAttribute("book", "success");// 성공햇다고 alert창 띄울려고
		System.out.println("예약완료");
		return "redirect:test";
	}

}
