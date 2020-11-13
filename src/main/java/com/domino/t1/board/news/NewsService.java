package com.domino.t1.board.news;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.domino.t1.util.Pager;

public interface NewsService {
	
	public int setInsert(NewsDTO newsDTO,  MultipartFile [] files, HttpSession session) throws Exception;
	
	public int setUpdate(NewsDTO newsDTO) throws Exception;
	
	public int setDelete(NewsDTO newsDTO) throws Exception;
	
	public List<NewsDTO> getList(Pager pager) throws Exception;
	
	public NewsDTO getOne(NewsDTO newsDTO) throws Exception;

}
