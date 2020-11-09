package com.domino.t1.branchInfo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BranchInfoDAO {
	
	private SqlSession sqlSession;
	private final String NAMESPACE="com.domino.t1.branchInfo.BranchInfoDAO.";

}
