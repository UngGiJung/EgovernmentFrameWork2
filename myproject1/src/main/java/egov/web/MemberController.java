package egov.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.service.MemberService;

//어노테이션(시스템주석)
@Controller
public class MemberController {
	
	@Resource(name="memberService")
	MemberService memberService;
	
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		
		return "member/memberWrite";
	}
	
	@RequestMapping("/useridChk.do")
	@ResponseBody //리스폰스 어노테이션 = 비공개 전송방법(ajax)에서 메세지 전송 수단
	public String selectMemberUseridCnt(String userid) throws Exception {
	
		// cnt 변수는 1 or 0을 받게 됨
		// 아이디 생성시 숫자 + 영문자 + 특수문자(- , _ : 바, 언더바) 만 허용 되도록 = 숫자 2(1,0이 아닌)가 되서 넘어가도록 하겠음
		int cnt = memberService.selectMemberUseridCnt(userid);
		
		String pattern = "[a-zA-Z]{1}[0-9a-zA-Z-_]{5,11}";
		boolean result = userid.matches(pattern); // true, false
		if( result == false ) {
			cnt = 2;
		}
		
		return cnt+"";
	}
	
	@RequestMapping("/loginWrite.do")
	public String loginWrite( HttpSession session ) {
		
		
		// 아래에 Session은 쉽게말해 SessionID ="text123"; 형태와 같다 그러나 아래처럼 세션타입의 변수를 선언해주는게 정공법
		session.setAttribute("SessionID","test123");
		
		
		return "redirect:/sample.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout( HttpSession session ) {
		
		
		// 아래에 Session은 쉽게말해 SessionID ="text123"; 형태와 같다 그러나 아래처럼 세션타입의 변수를 선언해주는게 정공법
		session.removeAttribute("SessionID");
		
		
		return "redirect:/sample.do";
	}
}
