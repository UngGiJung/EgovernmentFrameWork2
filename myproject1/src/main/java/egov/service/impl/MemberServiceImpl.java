package egov.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public int selectMemberUseridCnt(String userid) throws Exception {
		
		return memberDAO.selectMemberUseridCnt(userid);
	}

}
