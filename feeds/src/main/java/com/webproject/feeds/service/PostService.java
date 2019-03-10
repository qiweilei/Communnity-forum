package com.webproject.feeds.service;

import java.util.List;

import com.webproject.feeds.model.Post;
import com.webproject.feeds.model.User;

public interface PostService {
	Post save(Post post);
	List<Post> findByUser(User user);
	List<Post> findAllByDateCreatedDesc();
	Post findById(long id);
	byte[] findPictureById(long id);

	
}
