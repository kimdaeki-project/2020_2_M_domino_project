package com.domino.t1.kakao;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KakaoController {
  
  @RequestMapping(value="kindex")
  public ModelAndView kindex() throws Exception{
  	ModelAndView mv = new ModelAndView();
  	mv.setViewName("kindex");
  	return mv;
  }
  
  
}
    
  



