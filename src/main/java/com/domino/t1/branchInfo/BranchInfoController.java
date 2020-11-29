package com.domino.t1.branchInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.util.Pager;

@Controller
@RequestMapping("/branch/**")
public class BranchInfoController {
	
	@Autowired
	private BranchInfoService branchInfoService;
	
	@GetMapping("branchSearch")
	public ModelAndView getRegion1(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<BranchInfoDTO> region1 = branchInfoService.getRegion1(branchInfoDTO);
		
		mv.addObject("dto", branchInfoDTO);
		mv.addObject("region1", region1);
		mv.setViewName("branch/branchSearch");
		
		return mv;
	}
	
	@GetMapping("branchList")
	public ModelAndView getBranchList(BranchInfoDTO branchInfoDTO, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		String reg1 = request.getParameter("reg1");
		System.out.println(reg1);
		String reg2 = request.getParameter("reg2");
		System.out.println(reg2);
		
		branchInfoDTO.setRegion1(reg1);
		branchInfoDTO.setRegion2(reg2);
		
		List<BranchInfoDTO> ar = branchInfoService.getBranchList(branchInfoDTO);
		
		mv.addObject("branch", ar);
		mv.setViewName("branch/branchList");
		
		return mv;
	}
	
	@GetMapping("branchMap")
	public ModelAndView getLatLon(BranchInfoDTO branchInfoDTO, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("branch/branchMap");
		
		return mv;
	}
	
	@PostMapping("mapSearchResult")
	public ModelAndView getSearchResult(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("branch/mapSearchResult");
		return mv;
	}
	
	@GetMapping("brSelectMap")
	public ModelAndView brSelectMap(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("branch/brSelectMap");
		return mv;
	}


}
