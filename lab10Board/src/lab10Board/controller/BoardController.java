package lab10Board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lab10Board.Service.BoardService;
import lab10Board.vo.BoardVO;
import lab10Board.vo.ReplyVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	//�Խ��� �� ���
	@RequestMapping("/board.do")
	public String getBoardList(HttpServletRequest req){
		int index = 10;
		try{		
		index = Integer.parseInt(req.getParameter("index"))*10;
		} catch(Exception e){};

		ArrayList<BoardVO> list = boardService.getBoardList(index);
		int totalPage = boardService.totalPage();
		if(list != null)
			req.setAttribute("list", list);
		req.setAttribute("totalPage",totalPage);
		req.setAttribute("currentPage", index);
		return "boardList";
	}
	
	//�Խñ� Ȯ�� 
	@RequestMapping("/article.do")
	public String getArticle(HttpServletRequest req, BoardVO vo, @RequestParam(value="seq") String seq){
		seq = req.getParameter("seq");
		boardService.updateCnt(vo);     //��ȸ �� ������Ʈ
		ArrayList<BoardVO> article = boardService.getArticle(Integer.parseInt(seq));
		ArrayList<ReplyVO> reply = boardService.getReply(Integer.parseInt(seq));
		
		if(article != null)
			req.setAttribute("article", article );
		if(reply!=null){
			req.setAttribute("reply", reply);
			}
		return "article";	
	}
	
	//�۾�����
	@RequestMapping("/writeForm.do")
	public String writeForm(){
		return "writeForm";
	}
	
	//�����Ϳ� �� ����
	@RequestMapping("/write.do")
	public String write(BoardVO vo){
		boardService.insertArticle(vo);
		return "redirect:/board.do";
	}
	
	//�˻�
	@RequestMapping("/search.do")
	public String search(HttpServletRequest req, @RequestParam(value = "searchText") String searchText, @RequestParam(value="selectOne") String selectOne) {
		ArrayList<BoardVO> list = null;
		switch(selectOne){
		case "byTitle":
			list = boardService.getListByTitle(searchText);
			break;
		case "byContent":
			list = boardService.getListByContent(searchText);
			break;
		case "byWriter":
			list = boardService.getListByWriter(searchText);
			break;
		}
		if(list != null)
			req.setAttribute("list", list);	
		return "boardList";
	}
	
	//�� ����
	@RequestMapping("/delete.do")
	public String deleteArticle(@RequestParam(value="seq") String seq, HttpServletRequest req){
        boardService.deleteArticle(Integer.parseInt(seq));
		return "redirect:/board.do";
	}
	
	//�� ������
	@RequestMapping("/modifyForm.do")
	public String modifyForm(@RequestParam(value="seq2") String seq, HttpServletRequest req){
		ArrayList<BoardVO> article = boardService.getArticle(Integer.parseInt(seq));
		if(article != null)
			req.setAttribute("article", article );
		return "modifyForm";
	}
	
	//�� ����
	@RequestMapping("/modify.do")
	public String modify(BoardVO vo){
		boardService.modify(vo);
		return "redirect:/board.do";
	}
	
	//��� ���
	@RequestMapping("/insertReply.do")
	public String insertReply(ReplyVO vo, HttpServletRequest req){
		boardService.insertReply(vo);
		ArrayList<ReplyVO> rvo = boardService.getReply(vo.getBoardSeq());
		System.out.println(vo.getBoardSeq());
		req.setAttribute("replyList", rvo);		
		return "newReply";
	}
}
