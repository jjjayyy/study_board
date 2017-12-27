package lab10Board.dao;

import java.util.ArrayList;

import lab10Board.vo.BoardVO;
import lab10Board.vo.ReplyVO;

public interface BoardDAO {

	public ArrayList<BoardVO> getBoardList(int index);
	public ArrayList<BoardVO> getArticle(int seq);
	public int updateCnt(BoardVO vo);
	public int insertArticle(BoardVO vo);
	public ArrayList<BoardVO> getListByTitle(String searchText);
	public ArrayList<BoardVO> getListByContent(String searchText);
	public ArrayList<BoardVO> getListByWriter(String searchText);
	public int deleteArticle(int seq);
	public int modify(BoardVO vo);	
	public int totalPage();	
	public ArrayList<ReplyVO> getReply(int seq);
	public int insertReply(ReplyVO vo);
}
