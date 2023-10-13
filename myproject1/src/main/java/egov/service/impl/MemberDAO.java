package egov.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO {
	

	public int selectMemberUseridCnt(String userid) {
		return (int) select("memeberDAO.selectMemberUseridCnt",userid);
	}


}
