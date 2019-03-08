package com.webproject.feeds.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.webproject.feeds.model.Post;
import com.webproject.feeds.model.User;

public interface PostRepository extends JpaRepository<Post, Long>{
	List<Post> findByUser(User user);
//	List<Post> findAllByDateCreatedAsc();

	Post findById(long id);
	
}
