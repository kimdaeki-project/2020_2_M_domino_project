package com.domino.t1.board.qna;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.domino.t1.board.file.BoardFileDTO;
import com.domino.t1.util.FileSaver;
import com.domino.t1.util.Pager;

@Service
public class QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	
	public int setInsert(QnaDTO qnaDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		
		String path = session.getServletContext().getRealPath("/resources/upload/qna/");
		File file = new File(path);
		System.out.println(path);
		
		int result = qnaDAO.setInsert(qnaDTO);
		System.out.println("Num : "+qnaDTO.getBoard_num());
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.getSize() !=0) {
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
	
	public List<QnaDTO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.setTotalCount(qnaDAO.getCount(pager));
		pager.makePage();
		return qnaDAO.getList(pager);
	}

	public QnaDTO getOne(QnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getOne(qnaDTO);
	}
	
}
