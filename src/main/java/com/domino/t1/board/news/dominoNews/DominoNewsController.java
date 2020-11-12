package com.domino.t1.board.news.dominoNews;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	

}
