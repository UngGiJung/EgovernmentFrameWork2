package egov.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.service.BoardService;
import egov.service.BoardVO;

// 어노테이션(주석)
@Controller
public class BoardController {

	@Resource(name = "boardService")
	public BoardService boardService;
	
	
	@RequestMapping(value="/sample.do")
	public String sample() {
		
		return "main/sample";
	}
	
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value="/reboardWrite.do")
	public String reboardWrite() {
		
		return "board/reboardWrite";
	}
	
	@RequestMapping(value="/boardWriteSave.do")
	@ResponseBody
	public String insertBoard(BoardVO vo) throws Exception {

		String msg = "";
		String result = boardService.insertBoard(vo);
		if(result == null) {
			System.out.println("============ 저장완료 ===========");
			msg = "ok";
		} else {
			System.out.println("============ 저장실패 ===========");
			msg = "fail";
		}

		return msg;
	}
	
	@RequestMapping(value="/reboardWriteSave.do")
	@ResponseBody
	public String insertReBoard(BoardVO vo) throws Exception {

		String msg = "";
		String result = boardService.insertReBoard(vo);
		if(result == null) {
			System.out.println("============ 저장완료 ===========");
			msg = "ok";
		} else {
			System.out.println("============ 저장실패 ===========");
			msg = "fail";
		}
		return msg;
	}
	
	@RequestMapping(value="/replyWriteSave.do")
	@ResponseBody
	public String insertReBoardReply(BoardVO vo) throws Exception {
		
		int unq = vo.getUnq();
		BoardVO vo1 = boardService.selectReboardFid(unq);
		
		String thread = null;
		String mythread = "";
		
		if( vo1 == null ) {
			mythread = vo.getThread()+"a";
		} else  {
			thread = vo1.getThread();  //ac  -> c -> d ==> "a"+"d"
			char lastword = thread.charAt(thread.length()-1);
			lastword++;
			mythread = 
				thread.substring(0,thread.length()-1) + lastword;
		}
		String msg = "";
		vo.setThread(mythread);
		
		String result = boardService.insertReboardReply(vo);
		if( result == null ) {
			msg = "ok";
		}
		return msg;
	}
	
	
	
	@RequestMapping(value="/boardList.do")
	public String selectBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		System.out.println("=== page : " + vo.getPage());
		
		int unit = 5;
		int page = vo.getPage();
		//  1 => 1 ,, 2 :: 11 ,, 3 => 21 
		int startno = (page-1)*unit + 1;
		int endno = startno + (unit-1);

		vo.setStartno(startno);
		vo.setEndno(endno);
		
		int total = boardService.selectBoardTotal(vo);
		List<?> list = boardService.selectBoardList(vo);
		
		//  12.0/10 => 1.2 ceil(1.2) => (int)2.0 -> 2 :: 1
		int lastpage = (int)Math.ceil((double)total/unit);
		
		int pageno = total-((page-1)*unit);
		
		model.addAttribute("resultList", list);
		model.addAttribute("total",total);
		model.addAttribute("lastpage",lastpage);
		model.addAttribute("pageno",pageno);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/reboardList.do")
	public String selectReBoardList(BoardVO vo, ModelMap model) throws Exception {
	
		List<?> list = boardService.selectReBoardList(vo);
		model.addAttribute("resultList", list);
		
		return "board/reboardList";
	}

	@RequestMapping(value="/boardDetail.do")
	public String selectBoardDetail(int unq, ModelMap model) throws Exception {
		
		BoardVO vo = boardService.selectBoardDetail(unq);
		
		String content = vo.getContent();
		content = content.replace("\n", "<br>");
		content = content.replace(" ", "&nbsp;");
		vo.setContent(content);
		
		model.addAttribute("vo", vo);
		
		// 조회수 증가
		int cnt = boardService.updateBoardHits(unq);
		
		return "board/boardDetail";
	}
	
	@RequestMapping(value="/reboardDetail.do")
	public String selectReBoardDetail(int unq, ModelMap model) 
												throws Exception {
		BoardVO vo = boardService.selectReBoardDetail(unq);
		
		String content = vo.getContent();
		content = content.replace("\n", "<br>");
		content = content.replace(" ", "&nbsp;");
		vo.setContent(content);
		
		model.addAttribute("vo", vo);
		
		// 조회수 증가
		// int cnt = boardService.updateBoardHits(unq);
		return "board/reboardDetail";
	}
	
	@RequestMapping(value="/replyWrite.do")
	public String replyWrite(BoardVO vo, ModelMap model) {
	
		model.addAttribute("unq", vo.getUnq());
		model.addAttribute("thread", vo.getThread());
		return "board/replyWrite";
	}
	
	
	@RequestMapping(value="/boardPassWrite.do")
	public String boardPasssWrite(int unq, ModelMap model) {
		
		model.addAttribute("unq", unq);
		return "board/boardPassWrite";
	}
	
	@RequestMapping(value="/boardDelete.do")
	public String deleteBoard(BoardVO vo) throws Exception {

		// 암호 확인 서비스 
		int cnt = boardService.selectBoardPass(vo);
		if(cnt == 1) {
			// 삭제 서비스 
			System.out.println("===== 암호 일치 ======");
			int result = boardService.deleteBoard(vo);
			if( result == 1 ) {
				System.out.println("===== 삭제 성공 ======");
			} else {
				System.out.println("===== 삭제 실패 ======");
			}
		
		} else {
			System.out.println("===== 암호 불일치 ======");
		}
		return "redirect:/boardList.do";
	}
	
	

}





