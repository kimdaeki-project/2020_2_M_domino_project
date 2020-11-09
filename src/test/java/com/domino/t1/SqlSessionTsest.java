package com.domino.t1;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class SqlSessionTsest extends MyTestCase{
	
	@Autowired
	private SqlSession sqlSession; 
	
	@Test
	public void test() {
		assertNotNull(sqlSession.getConnection());
	}
	

}
