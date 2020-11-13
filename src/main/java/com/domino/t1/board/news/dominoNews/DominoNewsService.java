package com.domino.t1.board.news.dominoNews;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.domino.t1.board.file.BoardFileDTO;
import com.domino.t1.board.news.NewsDTO;
import com.domino.t1.board.news.NewsService;
import com.domino.t1.util.FileSaver;
import com.domino.t1.util.Pager;

@Service
public class DominoNewsService implements NewsService {
	
	@Autowired
	private DominoNewsDAO dominoNewsDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	@Value("#{fileSave['dominoNews]}")
	private String filePath;

	@Override
	public int setInsert(NewsDTO newsDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		String path = session.getServletContext().getRealPath("filePath");
		File file = new File(path);
		System.out.println(path);
		
		int result = dominoNewsDAO.setInsert(newsDTO);
		
		for (MultipartFile multipartFile: files) { //files에서 multipartfile 타입의 객체들 꺼냄
			if(multipartFile.getSize() !=0) {
				String fileName = fileSaver.saveCopy(file, multipartFile);	
	
				BoardFileDTO boardFileDTO = new BoardFileDTO();
				boardFileDTO.setFile_Name(fileName);
				boardFileDTO.setOri_Name(multipartFile.getOriginalFilename());
				boardFileDTO.setFile_Num(newsDTO.getBoard_num());;
				
				dominoNewsDAO.setInsertFile(boardFileDTO);
				}
			}
		
		return result;
		
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
