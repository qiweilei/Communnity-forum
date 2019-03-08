package com.webproject.feeds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.webproject.feeds.model.Post;
import com.webproject.feeds.model.User;
import com.webproject.feeds.repository.PostRepository;
@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private PostRepository PostRepository;
    
	@Override
	public Post save(Post post) {
		// TODO Auto-generated method stub
		return PostRepository.save(post);
	}

	@Override
	public List<Post> findByUser(User user) {
		// TODO Auto-generated method stub
		return PostRepository.findByUser(user);
	}

	@Override
	public List<Post> findAllByDateCreatedAsc() {
		// TODO Auto-generated method stub
		return PostRepository.findAll(new Sort(Sort.Direction.ASC, "dateCreated") );
	}

	@Override
	public byte[] findPictureById(long id) {
		// TODO Auto-generated method stub
		
		return PostRepository.findById(id).getPicture();
	}

	@Override
	public Post findById(long id) {
		// TODO Auto-generated method stub
		return PostRepository.findById(id);
	}
	

}
