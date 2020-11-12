package com.domino.t1.item;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.item.ItemDTO.";
	
	public List<ItemDTO> getItemListByCategory(ItemDTO itemDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getItemListByCategory");
	}
	
	public ItemDTO getOne(ItemDTO itemDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getOne");
	}
}
