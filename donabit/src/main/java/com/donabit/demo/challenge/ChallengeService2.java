package com.donabit.demo.challenge;

import java.util.List;

import joinlogin.MemberDTO;

public interface ChallengeService2 {
	int insertChallenge(ChallengeDTO2 dto);
	List<ChallengeDTO2> selectChallengePage(int index, int count);
	int selectChallengeCount();
	List<MemberDTO> selectMember();
	int selectChallengingMemberCount(int chnum);
	int selectSuccessMemberCount(int chnum);
	int selectCheckCount(int chnum);
	int deleteChallenge(int chnum);
	int selectMemberCount();
	List<ChallengeDTO2> selectChallengeName();
	int selectChallengingCountByNickname(String nickname);
	int selectSuccessCountByNickname(String nickname);
	int selectCheckCountByNickname(String nickname);
}
