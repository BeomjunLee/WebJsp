package com.event.service;

import java.sql.SQLException;
import java.util.List;

import com.event.domain.Reply;
import com.event.repository.ReplyRepository;

public class ReplyService {
	
	ReplyRepository replyRepository = ReplyRepository.getInstance();
	
private static ReplyService replyService = new ReplyService();
	//�̱���
	public static ReplyService getInstance() {
		return replyService;
	}
	
	//��� �ҷ�����
	public List<Reply> findAll(Long review_uid){
		try {
			return replyRepository.findAll(review_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//��� �ۼ�
	public int saveReply(Reply reply) {
		try {
			return replyRepository.save(reply);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//����� �������� ã��
	public Long sequence() {
		try {
			return replyRepository.sequence();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0L;
		}
	}
	
	//�������� ������ group id ������Ʈ
	public int updateGroupId(Long groupId, Long reply_uid) {
		try {
			return replyRepository.updateGroupId(groupId, reply_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//��� ����
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
