package com.domino.t1.board.news.press;

import java.io.File;
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
import com.domino.t1.board.news.NewsDTO;
import com.domino.t1.util.Pager;

@Controller
@RequestMapping(value="/press/**")
public class PressController {
	
	@Autowired
	private PressService pressService;
	
	@GetMapping("pressList")
	public ModelAndView getList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<NewsDTO> ar = pressService.getList(pager);
		mv.addObject("news", "press");		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("news/newsList");
		
		return mv;	
	}
	
	@GetMapping("pressWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news/newsWrite");
		mv.addObject("news", "press");
		return mv;
	}
	
	@PostMapping("pressWrite")
	public ModelAndView setIsnert(NewsDTO newsDTO, MultipartFile [] files, HttpSession session) throws Exception{
	
		int result = pressService.setInsert(newsDTO, files, session);
		System.out.println("RESULT: " + result);
		
		String message="Write Fail";
		if(result>0) {
			message = "Write Success";
		}
		ModelAndView mv = new ModelAndView();
	
		mv.addObject("msg", message);
		mv.addObject("path", "./pressList");
		
		mv.setViewName("common/result");
		return mv;	
	}
	
	@PostMapping("summernoteDelete")
	public ModelAndView summernoteDelete(String file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = pressService.summernoteDelete(file, session);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("summernote")
	public ModelAndView summernote(MultipartFile file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();

		String fileName = pressService.summernote(file, session);
		
		String name = session.getServletContext().getContextPath()+File.separator;
		name = name+"resources"+File.separator+"upload"+File.separator;
		name = name+"press"+File.separator+fileName;
		System.out.println(name);
		mv.addObject("msg", name);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("fileDown")
	public ModelAndView fileDown(BoardFileDTO boardFileDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("news", "press");
		mv.addObject("fileDTO", boardFileDTO);
		mv.setViewName("fileDown");
		return mv;
	}
	
	@GetMapping("pressSelect")
	public ModelAndView getOne(NewsDTO newsDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		pressService.setPressHits(newsDTO.getBoard_num());
	
		newsDTO = pressService.getOne(newsDTO);
		
		if(newsDTO!=null) {
			mv.setViewName("news/newsSelect");
			mv.addObject("dto", newsDTO);
			mv.addObject("news", "press");
		}
		else {
			mv.setViewName("common/result");
			mv.addObject("msg", "No Data");
			mv.addObject("path", "./pressList");
		}
		return mv;
	}

	@GetMapping("pressDelete")
	public ModelAndView setDelete(NewsDTO newsDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = pressService.setDelete(newsDTO);
		
		String message="Delete Fail";
		if(result>0) {
			message = "Delete Success";
		}
	
		mv.addObject("msg", message);
		mv.addObject("path", "./pressList");
		
		mv.setViewName("common/result");

		return mv;	
	}
	
	@GetMapping("pressUpdate")
	public ModelAndView setUpdate(NewsDTO newsDTO, ModelAndView mv) throws Exception{
		newsDTO = pressService.getOne(newsDTO);
		mv = new ModelAndView();
		mv.setViewName("news/newsUpdate");
		mv.addObject("dto", newsDTO);
		mv.addObject("news", "press");
		return mv;
	}
	
	@PostMapping("pressUpdate")
	public ModelAndView setUpdate(NewsDTO newsDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = pressService.setUpdate(newsDTO);
		String message="Update Fail";
		if(result>0) {
			message = "Update Success";
		}
		mv.addObject("msg", message);
		mv.addObject("path", "./pressList");
		mv.setViewName("common/result");

		return mv;	
	}
	

}
