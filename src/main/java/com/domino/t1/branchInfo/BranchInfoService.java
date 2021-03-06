package com.domino.t1.branchInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.util.Pager;

@Service
public class BranchInfoService {
	
	@Autowired
	private BranchInfoDAO branchInfoDAO;
	
	public List<BranchInfoDTO> getRegion1(BranchInfoDTO branchInfoDTO) throws Exception {
		return branchInfoDAO.getRegion1(branchInfoDTO);
	}
	
	public List<BranchInfoDTO> getBranchList(BranchInfoDTO branchInfoDTO) throws Exception {
		return branchInfoDAO.getBranchList(branchInfoDTO);
	}
	
}
