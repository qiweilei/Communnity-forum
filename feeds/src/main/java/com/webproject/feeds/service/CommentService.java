package com.webproject.feeds.service;

import java.util.List;

import com.webproject.feeds.model.Comment;

public interface CommentService {
		void save(Comment comment);
		List<Comment> findByPostId(long postId);
		List<Comment> findByPostIdOrderByDateCreatedDesc(long postId);
}
