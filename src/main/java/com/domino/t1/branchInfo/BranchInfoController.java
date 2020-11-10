package com.domino.t1.branchInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/branch/**")
public class BranchInfoController {
	
	@GetMapping("branchSearch")
	public ModelAndView branchSearch() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("branchSearch");
		mv.setViewName("branch/branchSearch");
		
		return mv;
	}

}
