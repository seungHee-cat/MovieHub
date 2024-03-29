package com.moviehub.biz.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moviehub.biz.comment.CommentVO;
import com.moviehub.biz.comment.CurCommentVO;
import com.moviehub.biz.comment.MyCommentVO;


@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public void deleteCommentByAdmin(CommentVO comment) {
		commentDAO.deleteCommentByAdmin(comment);
	}

	@Override
	public List<CommentVO> getAllCommentList(CommentVO comment) {
		return commentDAO.getAllCommentList(comment);
	}

	@Override
	public List<MyCommentVO> getMyCommentList(MyCommentVO comment) {
		return commentDAO.getMyCommentList(comment);
	}

	@Override
	public void modifyComment(CommentVO comment) {
		commentDAO.modifyComment(comment);
	}
	
	@Override
	public void deleteComment(CommentVO comment) {
		commentDAO.deleteComment(comment);
	}

	@Override
	public CommentVO getComment(CommentVO comment) {
		return commentDAO.getComment(comment);
	}

	@Override
	public void insertComment(CommentVO comment) {
		commentDAO.insertComment(comment);
	}

	@Override
	public List<CurCommentVO> getCommentList(CurCommentVO curComment) {
		return commentDAO.getCommentList(curComment);
	}

	@Override
	public CurCommentVO getCurComment(CurCommentVO curComment) {
		return commentDAO.getCurComment(curComment);
	}

	@Override
	public List<CurCommentVO> sortComments(CurCommentVO comment) {
		return commentDAO.getSortComments(comment);
	}
	
}
