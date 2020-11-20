package com.domino.t1.branchInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BranchInfoService {
	
	@Autowired
	private BranchInfoDAO branchInfoDAO;
	
	public List<BranchInfoDTO> getRegion1(BranchInfoDTO branchInfoDTO) throws Exception {
		System.out.println(branchInfoDTO.getRegion1());
		return branchInfoDAO.getRegion1(branchInfoDTO);
	}

}
