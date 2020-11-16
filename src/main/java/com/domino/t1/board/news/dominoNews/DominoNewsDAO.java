package com.domino.t1.board.news.dominoNews;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.board.file.BoardFileDTO;
import com.domino.t1.board.news.NewsDAO;
import com.domino.t1.board.news.NewsDTO;
import com.domino.t1.util.Pager;

@Repository
public class DominoNewsDAO implements NewsDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.domino.t1.board.news.dominoNews.DominoNewsDAO.";
	
	public Long getNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	public int setInsertFile(BoardFileDTO boardFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsertFile", boardFileDTO);
	}
	
	public int setNewsHits(long board_num) throws Exception{
		return sqlSession.update("setNewsHits", board_num);
	}
	
	@Override
	public int setInsert(NewsDTO newsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setInsert", newsDTO);
	}

	@Override
	public int setUpdate(NewsDTO newsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setUpdate", newsDTO);
	}

	@Override
	public int setDelete(NewsDTO newsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setDelete", newsDTO);
	}

	@Override
	public List<NewsDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getList",pager);
	}

	@Override
	public NewsDTO getOne(NewsDTO newsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getOne", newsDTO);
	}

	@Override
	public long getCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}

}
