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
	//�� ���
	public ArrayList<BoardVO> getArticle(int seq){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getArticle(seq);
	}
	//�� ����
	public int updateCnt(BoardVO vo){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.updateCnt(vo);
	}
	//��ȸ��
	public int insertArticle(BoardVO vo){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.insertArticle(vo);
	}
	//�� �ۼ�
	public ArrayList<BoardVO> getListByTitle(String searchText){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getListByTitle(searchText);
	}
	//�������� �˻�
	public ArrayList<BoardVO> getListByContent(String searchText){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getListByContent(searchText);
	}
	//�������� �˻�
	public ArrayList<BoardVO> getListByWriter(String searchText){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getListByWriter(searchText);
	}
	//�ۼ��ڷ� �˻�
	
	public int deleteArticle(int seq){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.deleteArticle(seq);
	}
	//�� ����
	
	public int modify(BoardVO vo){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.modify(vo);
	}
	//�� ����
	
	public int totalPage(){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.totalPage();
	}
	//�� ������
	
	public ArrayList<ReplyVO> getReply(int seq){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getReply(seq);
	}
	//���
	
	public int insertReply(ReplyVO vo){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.insertReply(vo);
	}
	//��� �Է�
}
