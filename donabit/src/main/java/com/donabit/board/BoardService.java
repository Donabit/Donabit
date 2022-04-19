package com.donabit.board;

import java.util.List;

public interface BoardService {
	
    /* 게시판 등록 */
    public int enroll(BoardDTO dto);

    /* 게시판 목록 */
    public List<BoardDTO> getList();
    
    /* 게시물 조회 */
    public BoardDTO getPage(int bno);
    
}
