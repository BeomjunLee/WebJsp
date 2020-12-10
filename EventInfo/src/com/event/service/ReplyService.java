package com.event.service;

import java.sql.SQLException;
import java.util.List;

import com.event.domain.Reply;
import com.event.repository.ReplyRepository;

public class ReplyService {
	
	ReplyRepository replyRepository = ReplyRepository.getInstance();
	
private static ReplyService replyService = new ReplyService();
	//싱글톤
	public static ReplyService getInstance() {
		return replyService;
	}
	
	//댓글 불러오기
	public List<Reply> findAll(Long review_uid){
		try {
			return replyRepository.findAll(review_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//댓글 작성
	public int saveReply(Reply reply) {
		try {
			return replyRepository.save(reply);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//저장될 시퀀스값 찾기
	public Long sequence() {
		try {
			return replyRepository.sequence();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0L;
		}
	}
	
	//시퀀스값 때문에 group id 업데이트
	public int updateGroupId(Long groupId, Long reply_uid) {
		try {
			return replyRepository.updateGroupId(groupId, reply_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//댓글 삭제
		public int deleteReview(Long reply_uid, Long member_uid) {
			int result = 0;
			try {
				return replyRepository.delete(reply_uid, member_uid);
			} catch (SQLException e) {
				e.printStackTrace();
				return result;
			}
		}
	
}
