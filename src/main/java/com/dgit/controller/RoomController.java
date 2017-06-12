package com.dgit.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.RoomVO;
import com.dgit.domain.UserVO;
import com.dgit.interceptor.LoginInterceptor;
import com.dgit.service.RoomService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/*")
public class RoomController {

	@Inject
	private RoomService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);

	// 외부저장한 이미지가 보여지기위해
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String filename) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		logger.info("[displayFile] filename : " + filename);
		try {
			String thumName1 = filename.substring(0, 12);
			String thumName2 = filename.substring(14);
			filename = thumName1 + thumName2;

			String format = filename.substring(filename.lastIndexOf(".") + 1);// 파일확장자만
																				// 뽑기
			System.out.println(format + "/" + filename);
			MediaType mType = MediaUtils.getMediaType(format);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);
			in = new FileInputStream(uploadPath + "/" + filename);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping(value = "insertroom", method = RequestMethod.POST)
	public String roomPOST(RoomVO vo, List<MultipartFile> imagefiles, RedirectAttributes rttr,
			HttpServletRequest request) throws Exception {
		logger.info("방등록 POST 실행");

		// 파일업로드--------------------------------------------------------
		ArrayList<String> filenames = new ArrayList<String>();
		for (MultipartFile file : imagefiles) {
			logger.info("originalName : " + file.getOriginalFilename());
			logger.info("size : " + file.getSize());
			logger.info("contentType : " + file.getContentType());
			String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			filenames.add(savedName);
		}
		String[] sFiles = filenames.toArray(new String[filenames.size()]);
		System.out.println(sFiles);
		vo.setFiles(sFiles);
		// ----------------------------------------------------------------
		service.insertroom(vo);
		rttr.addFlashAttribute("insertroom", "success");
		return "redirect:/test";
	}

	@RequestMapping(value = "deleteroom", method = RequestMethod.POST)
	public String roomDelete(int rno, RedirectAttributes rttr) throws Exception {
		service.deleteroom(rno);
		rttr.addFlashAttribute("delroom", "success");
		return "redirect:/test";
	}

	@RequestMapping(value = "updateroom", method = RequestMethod.POST)
	public String roomUpdate(RoomVO vo, RedirectAttributes rttr, List<MultipartFile> imagefiles) throws Exception {
		RoomVO r_no = service.selectfromrno(vo.getRno());

		r_no.setPeople(vo.getPeople());
		r_no.setPrice(vo.getPrice());
		r_no.setRoomname(vo.getRoomname());
		r_no.setContent(vo.getContent());
	//	r_no.setFiles(vo.getFiles());
		
		// 파일업로드--------------------------------------------------------
		ArrayList<String> filenames = new ArrayList<String>();
		for (MultipartFile file : imagefiles) {
			logger.info("originalName : " + file.getOriginalFilename());
			logger.info("size : " + file.getSize());
			logger.info("contentType : " + file.getContentType());
			String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			filenames.add(savedName);
		}
		String[] sFiles = filenames.toArray(new String[filenames.size()]);
		r_no.setFiles(sFiles);		
		//vo.setFiles(sFiles);
		// ----------------------------------------------------------------
		
		service.update(r_no);
		System.out.println(r_no.getRno() + "수정완료"+r_no.getFiles());
		return "redirect:/test";
	}
	
}
