package com.domino.t1.branchInfo;

import java.util.List;

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
	public ModelAndView getRegion1(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(branchInfoDTO);
		System.out.println(branchInfoDTO.getRegion1());
		
		List<BranchInfoDTO> ar = branchInfoService.getRegion1(branchInfoDTO);
		
		mv.addObject("dto", branchInfoDTO);
		mv.addObject("region1", ar);
		mv.setViewName("branch/branchSearch");
		
		System.out.println("controller getRegion 2");
		
		return mv;
	}

}
