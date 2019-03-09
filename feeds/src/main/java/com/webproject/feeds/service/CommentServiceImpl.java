package com.webproject.feeds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.webproject.feeds.model.Comment;
import com.webproject.feeds.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
    private CommentRepository commentRepository;
 
	@Override
	public void save(Comment comment) {
		// TODO Auto-generated method stub
		commentRepository.save(comment);
	}

	@Override
	public List<Comment> findByPostId(long postId) {
		// TODO Auto-generated method stub
		return commentRepository.findByPostId(postId);
	}
	
	@Override
	public List<Comment> findByPostIdOrderByDateCreatedDesc(long postId){
		// TODO Auto-generated method stub
		return commentRepository.findByPostIdOrderByDateCreatedDesc(postId);
	}

}
