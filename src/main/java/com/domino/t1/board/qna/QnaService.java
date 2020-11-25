package com.domino.t1.board.qna;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.domino.t1.board.file.BoardFileDTO;
import com.domino.t1.board.news.NewsDTO;
import com.domino.t1.util.FileSaver;

@Service
public class QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	
	public int setInsert(QnaDTO qnaDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		
		int result = qnaDAO.setInsert(qnaDTO);
		
		String path = session.getServletContext().getRealPath("/resources/upload/qna/");
		System.out.println(path);
		File file = new File(path);
	
		for(int i=0;i<files.length;i++) {
			if(i==0) {
				continue;
			}
			MultipartFile multipartFile = files[i];
			if( multipartFile.getSize() !=0) {
				String fileName = fileSaver.saveCopy(file, multipartFile);
				BoardFileDTO boardFileDTO = new BoardFileDTO();
				boardFileDTO.setFile_Name(fileName);
				boardFileDTO.setOri_Name(multipartFile.getOriginalFilename());
				boardFileDTO.setBoard_num(qnaDTO.getBoard_num());
				qnaDAO.setInsertFile(boardFileDTO);
			}
		}
		
		return result;
		
	}
}
