package lab10Board.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lab10Board.dao.BoardDAO;
import lab10Board.vo.BoardVO;
import lab10Board.vo.ReplyVO;

@Service
public class BoardService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<BoardVO> getBoardList(int index){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getBoardList(index);
	}
	//글 목록
	public ArrayList<BoardVO> getArticle(int seq){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getArticle(seq);
	}
	//글 내용
	public int updateCnt(BoardVO vo){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.updateCnt(vo);
	}
	//조회수
	public int insertArticle(BoardVO vo){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.insertArticle(vo);
	}
	//글 작성
	public ArrayList<BoardVO> getListByTitle(String searchText){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getListByTitle(searchText);
	}
	//제목으로 검색
	public ArrayList<BoardVO> getListByContent(String searchText){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getListByContent(searchText);
	}
	//내용으로 검색
	public ArrayList<BoardVO> getListByWriter(String searchText){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getListByWriter(searchText);
	}
	//작성자로 검색
	
	public int deleteArticle(int seq){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.deleteArticle(seq);
	}
	//글 삭제
	
	public int modify(BoardVO vo){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.modify(vo);
	}
	//글 수정
	
	public int totalPage(){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.totalPage();
	}
	//총 페이지
	
	public ArrayList<ReplyVO> getReply(int seq){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getReply(seq);
	}
	//댓글
	
	public int insertReply(ReplyVO vo){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.insertReply(vo);
	}
	//댓글 입력
}
