package com.domino.t1.board.news.dominoNews;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.board.news.NewsDTO;
import com.domino.t1.board.news.NewsService;
import com.domino.t1.util.Pager;

@Service
public class DominoNewsService implements NewsService {
	
	@Autowired
	private DominoNewsDAO dominoNewsDAO;
	

	@Override
	public int setInsert(NewsDTO newsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setUpdate(NewsDTO newsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setDelete(NewsDTO newsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NewsDTO> getList(Pager pager) throws Exception {
	
		return dominoNewsDAO.getList(pager);
	}

	@Override
	public NewsDTO getOne(NewsDTO newsDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
