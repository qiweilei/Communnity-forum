package com.webproject.feeds.web;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webproject.feeds.model.AjaxComment;
import com.webproject.feeds.model.Comment;
import com.webproject.feeds.model.User;
import com.webproject.feeds.service.CommentService;
import com.webproject.feeds.service.EmailService;
import com.webproject.feeds.service.PostService;
import com.webproject.feeds.service.UserService;
import com.webproject.feeds.validator.UserValidator;

@Controller
@RequestMapping("/**")
public class AjaxController {
	@Autowired
    private UserService userService;
    @Autowired
    private PostService postService;

    @Autowired
    private CommentService commentService;
    
    @Autowired
    private EmailService emailService;
    
    @RequestMapping(value = "/post/addcomment", method = RequestMethod.POST,consumes=MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public AjaxComment  addComment(@RequestBody AjaxComment ajaxComment ) {
    	System.out.println(ajaxComment.getUserId()+"-"+ajaxComment.getPostId()+"-"+ajaxComment.getBody());
    	Comment comment=new Comment();
    	comment.setBody(ajaxComment.getBody().replaceAll("\n", "</br>"));
    	comment.setDateCreated(new Timestamp(new Date().getTime()));
    	comment.setPost(postService.findById(ajaxComment.getPostId()));
    	comment.setUser(userService.findById(ajaxComment.getUserId()));
    	commentService.save(comment);
    	ajaxComment.setDateCreated(comment.getDateCreated());
    	ajaxComment.setUsername(comment.getUser().getUsername());
        return ajaxComment;
    }

}
