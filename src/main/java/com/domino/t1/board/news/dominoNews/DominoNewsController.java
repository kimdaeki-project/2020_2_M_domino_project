package com.domino.t1.board.news.dominoNews;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.board.file.BoardFileDTO;
import com.domino.t1.board.news.NewsDTO;
import com.domino.t1.util.Pager;

@Controller
@RequestMapping(value="/dominoNews/**")
public class DominoNewsController {
	
	@Autowired
	private DominoNewsService dominoNewsService;
	
	@GetMapping("dominoNewsList")
	public ModelAndView getList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<NewsDTO> ar = dominoNewsService.getList(pager);
		mv.addObject("news", "dominoNews");		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("news/newsList");
		
		return mv;	
	}
	
	@GetMapping("dominoNewsWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news/newsWrite");
		mv.addObject("news", "dominoNews");
		return mv;
	}
	
	@PostMapping("dominoNewsWrite")
	public ModelAndView setIsnert(NewsDTO newsDTO, MultipartFile [] files, HttpSession session) throws Exception{
	
		int result = dominoNewsService.setInsert(newsDTO, files, session);
		System.out.println("RESULT: " + result);
		
		String message="Write Fail";
		if(result>0) {
			message = "Write Success";
		}
		ModelAndView mv = new ModelAndView();
	
		mv.addObject("msg", message);
		mv.addObject("path", "./dominoNewsList");
		
		mv.setViewName("common/result");
		return mv;	
	}
	
	@PostMapping("summernoteDelete")
	public ModelAndView summernoteDelete(String file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = dominoNewsService.summernoteDelete(file, session);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("summernote")
	public ModelAndView summernote(MultipartFile file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();

		String fileName = dominoNewsService.summernote(file, session);
		
		String name = session.getServletContext().getContextPath()+File.separator;
		name = name+"resources"+File.separator+"upload"+File.separator;
		name = name+"dominoNews"+File.separator+fileName;
		System.out.println(name);
		mv.addObject("msg", name);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("fileDown")
	public ModelAndView fileDown(BoardFileDTO boardFileDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("news", "dominoNews");
		mv.addObject("fileDTO", boardFileDTO);
		mv.setViewName("fileDown");
		return mv;
	}
	
	@GetMapping("dominoNewsSelect")
	public ModelAndView getOne(NewsDTO newsDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		dominoNewsService.setNewsHits(newsDTO.getBoard_num());
	
		newsDTO = dominoNewsService.getOne(newsDTO);
		
		if(newsDTO!=null) {
			mv.setViewName("news/newsSelect");
			mv.addObject("dto", newsDTO);
			mv.addObject("news", "dominoNews");
		}
		else {
			mv.setViewName("common/result");
			mv.addObject("msg", "No Data");
			mv.addObject("path", "./dominoNewsList");
		}
		return mv;
	}

	@GetMapping("dominoNewsDelete")
	public ModelAndView setDelete(NewsDTO newsDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = dominoNewsService.setDelete(newsDTO);
		
		String message="Delete Fail";
		if(result>0) {
			message = "Delete Success";
		}
	
		mv.addObject("msg", message);
		mv.addObject("path", "./dominoNewsList");
		
		mv.setViewName("common/result");

		return mv;	
	}
	
	@GetMapping("dominoNewsUpdate")
	public ModelAndView setUpdate(NewsDTO newsDTO, ModelAndView mv) throws Exception{
		newsDTO = dominoNewsService.getOne(newsDTO);
		mv = new ModelAndView();
		mv.setViewName("news/newsUpdate");
		mv.addObject("dto", newsDTO);
		mv.addObject("news", "dominoNews");
		return mv;
	}
	
	@PostMapping("dominoNewsUpdate")
	public ModelAndView setUpdate(NewsDTO newsDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result =  dominoNewsService.setUpdate(newsDTO);
		String message="Update Fail";
		if(result>0) {
			message = "Update Success";
		}
		mv.addObject("msg", message);
		mv.addObject("path", "./dominoNewsList");
		mv.setViewName("common/result");

		return mv;	
	}

}
