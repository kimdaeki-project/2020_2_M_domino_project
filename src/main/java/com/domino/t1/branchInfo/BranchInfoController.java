package com.domino.t1.branchInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/branch/**")
public class BranchInfoController {
	
	@Autowired
	private BranchInfoService branchInfoService;
	
	@GetMapping("branchSearch")
	public ModelAndView branchSearch(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
//		branchInfoDTO = branchInfoService.getRegion1(branchInfoDTO);
//		
//		System.out.println("branchSearch");
//		
//		if(branchInfoDTO != null) {
//			mv.setViewName("branch/branchSearch");
//			mv.addObject("dto", branchInfoDTO);
//			
//		} else {
//			mv.setViewName("common/result");
//			mv.addObject("msg", "No Data");
//		}
		mv.setViewName("branch/branchSearch");
		
		return mv;
	}

}
