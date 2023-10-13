package egov.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

	public String insertBoard(BoardVO vo) {
		return (String) insert("boardDAO.insertBoard",vo);
	}

	public List<?> selectBoardList(BoardVO vo) {
		return list("boardDAO.selectBoardList",vo);
	}

	public int selectBoardTotal(BoardVO vo) {
		return (int) select("boardDAO.selectBoardTotal",vo);
	}

	public BoardVO selectBoardDetail(int unq) {
		return (BoardVO) select("boardDAO.selectBoardDetail",unq);
	}

	public int updateBoardHits(int unq) {
		return update("boardDAO.updateBoardHits",unq);
	}

	public int selectBoardPass(BoardVO vo) {
		return (int) select("boardDAO.selectBoardPass",vo);
	}

	public int deleteBoard(BoardVO vo) {
		return delete("boardDAO.deleteBoard",vo);
	}

	public String insertReBoard(BoardVO vo) {
		return (String) insert("boardDAO.insertReBoard",vo);
	}

	public List<?> selectReBoardList(BoardVO vo) {
		return list("boardDAO.selectReBoardList",vo);
	}

	public BoardVO selectReBoardDetail(int unq) {
		return (BoardVO) select("boardDAO.selectReBoardDetail",unq);
	}

	public String insertReboardReply(BoardVO vo) {
		return (String) insert("boardDAO.insertReBoardReply",vo);
	}

	public BoardVO selectReboardFid(int unq) {
		return (BoardVO) select("boardDAO.selectReboardFid",unq);
	}	
}








