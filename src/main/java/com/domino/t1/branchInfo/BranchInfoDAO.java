package com.domino.t1.branchInfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BranchInfoDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE="com.domino.t1.branchInfo.BranchInfoDAO.";
	
	public List<BranchInfoDTO> getRegion1(BranchInfoDTO branchInfoDTO) throws Exception {
		System.out.println(branchInfoDTO.getRegion1());
		return sqlSession.selectList(NAMESPACE+"getRegion1", branchInfoDTO);
	}
	

}
