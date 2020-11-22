package com.domino.t1.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.board.file.BoardFileDTO;

import com.domino.t1.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("qnaList")
	public ModelAndView getList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<QnaDTO> ar = qnaService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("qna/qnaList");
		return mv;	
	}
	
	@GetMapping("qnaWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qna/qnaWrite");
		return mv;
	}
	
	@PostMapping("qnaWrite")
	public ModelAndView setInsert(QnaDTO qnaDTO, MultipartFile [] files, HttpSession session) throws Exception{
		
		int result = qnaService.setInsert(qnaDTO, files, session);
		System.out.println("RESULT: " + result);
		
		String message="접수가 완료되지 않았습니다";
		if(result>0) {
			message = "성공적으로 접수되었습니다";
		}
		ModelAndView mv = new ModelAndView();
	
		mv.addObject("msg", message);
		mv.addObject("path", "./qnaList");
		
		mv.setViewName("common/result");
		return mv;	
	}
	
	@GetMapping("fileDown")
	public ModelAndView fileDown(BoardFileDTO boardFileDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("fileDTO", boardFileDTO);
		mv.setViewName("fileDown");
		return mv;
	}
	@GetMapping("qnaReply")
	public ModelAndView setReply() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qna/qnaReply");
		return mv;
	}
	
	
	@PostMapping("qnaReply")
	public ModelAndView setReply(QnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setReply(qnaDTO);
		
		String message="작성 실패했습니다.";
		if(result>0) {
			message = "작성 성공했습니다";
		}
	
		mv.addObject("msg", message);
		mv.addObject("path", "./qnaList");
		mv.setViewName("common/result");

		return mv; 
	}
	
	@GetMapping("qnaSelect")
	public ModelAndView getOne(QnaDTO qnaDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		qnaDTO = qnaService.getOne(qnaDTO);
		
		if(qnaDTO!=null) {
			mv.setViewName("qna/qnaSelect");
			mv.addObject("dto", qnaDTO);
		}
		else {
			mv.setViewName("common/result");
			mv.addObject("msg", "No Data");
			mv.addObject("path", "./qnaList");
		}
		return mv;
	}
	
	@GetMapping("qnaDelete")
	public ModelAndView setDelete(QnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setDelete(qnaDTO);
		
		String message="삭제 실패했습니다.";
		if(result>0) {
			message = "삭제 성공했습니다.";
		}
	
		mv.addObject("msg", message);
		mv.addObject("path", "./qnaList");
		
		mv.setViewName("common/result");

		return mv;	
	}
	
	@GetMapping("qnaUpdate")
	public ModelAndView setUpdate(QnaDTO qnaDTO, ModelAndView mv) throws Exception{
		qnaDTO = qnaService.getOne(qnaDTO);
		mv = new ModelAndView();
		mv.setViewName("qna/qnaUpdate");
		mv.addObject("dto", qnaDTO);
		return mv;
	}
	
	@PostMapping("qnaUpdate")
	public ModelAndView setUpdate(QnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setUpdate(qnaDTO);
		String message="수정 실패했습니다.";
		if(result>0) {
			message = "수정 성공했습니다.";
		}
		mv.addObject("msg", message);
		mv.addObject("path", "./qnaList");
		mv.setViewName("common/result");

		return mv;	
	}
	
}
