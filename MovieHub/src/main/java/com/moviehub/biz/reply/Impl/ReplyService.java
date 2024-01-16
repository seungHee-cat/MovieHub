package com.moviehub.biz.reply.Impl;

import java.util.List;

import com.moviehub.biz.reply.CurReplyVO;
import com.moviehub.biz.reply.ReplyVO;

public interface ReplyService {
	void insertReply(ReplyVO reply);
	void insertReReply(ReplyVO reply);
	CurReplyVO getCurReply(CurReplyVO curReply);
	List<CurReplyVO> getReplyList(CurReplyVO replyList);
	List<CurReplyVO> getReReplyListByReplyId(int reply_id);
	void deleteReply(CurReplyVO curReply);
	void modifyReply(ReplyVO reply);
}