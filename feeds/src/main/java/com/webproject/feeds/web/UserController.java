package com.webproject.feeds.web;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.webproject.feeds.model.Post;
import com.webproject.feeds.model.User;
import com.webproject.feeds.service.PostService;
import com.webproject.feeds.service.SecurityService;
import com.webproject.feeds.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;

    @Autowired
    private SecurityService securityService;
    
    @RequestMapping(value = {"/user", "/user/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model,HttpServletRequest request) {
    	String email=this.getContextEmail();
    	List<Post> postlist=postService.findByUser(userService.findByEmail(email));
    	model.addAttribute("postlist", postlist);
    	model.addAttribute("email", email);
        return "user/welcome";
    }
    
    @RequestMapping(value = {"/user", "/user/welcome"}, method = RequestMethod.POST)
    public String welcomeSave( @RequestParam("file") MultipartFile file,Model model,HttpServletRequest request) throws IOException{
    	String email=this.getContextEmail();
    	
    	
    	
                // Get the file and save it somewhere
    			
//                itemForm.setUsername(username);
//            	itemForm.setApproved(false);
//            	itemForm.setPaymentStatus(false);
//            	Item returnedItem=itemService.save(itemForm);
            	if(!file.isEmpty()){
            	String pathName= request.getContextPath()+"/data/"+email+"/";
    			File dir=new File(pathName);
    			if(!dir.exists()){
    				dir.mkdirs();
    			}
                byte[] bytes = file.getBytes();
                Path path = Paths.get(pathName + file.getOriginalFilename());
                Files.write(path, bytes);
            	}
            	//showcartnumber
//            	request.getSession().setAttribute("cartItemNum", itemService.returnItemNumber());
            
	
    	return "user/welcome";
    }
    
    @RequestMapping(value = { "/user/addpost"}, method = RequestMethod.GET)
    public String getAddPost(Model model) {
    	model.addAttribute("addPostForm", new Post());
        return "user/addpost";
    }
    
    @RequestMapping(value = { "/user/addpost"}, method = RequestMethod.POST)
    public String postAddPost(@ModelAttribute("addPostForm")Post post,@RequestParam("file") MultipartFile file,Model model,HttpServletRequest request) throws IOException {
    	String email=this.getContextEmail();
    	if(!file.isEmpty()){
    		byte[] bytes = file.getBytes();
    		post.setPicture(bytes);
    	}
    	String body=post.getBody();
    	post.setBody(body.replaceAll("\n", "</br>"));
    	post.setHitCount((long) 0);
    	post.setCommentCount((long) 0);
    	post.setUser(userService.findByEmail(email));
    	post.setDateCreated(new Timestamp(new Date().getTime()));
    	post.setLikeCount(0);
    	post.setUnlikeCount(0);
    	Post returnPost=postService.save(post);
    	if(!file.isEmpty()){
        	String pathName= request.getContextPath()+"/data/post/"+returnPost.getId()+"/";
			File dir=new File(pathName);
			if(!dir.exists()){
				dir.mkdirs();
			}
            byte[] bytes = file.getBytes();
            Path path = Paths.get(pathName + "image");
            Files.write(path, bytes);
        }
    	return "redirect:/user/addpost";
    }
    
    @RequestMapping(value = { "/user/profile"}, method = RequestMethod.GET)
    public String getProfile(Model model) {
    	String email=this.getContextEmail();
    	model.addAttribute("userForm", userService.findByEmail(email));
    	model.addAttribute("userId", userService.findByEmail(email).getId());
        return "user/profile";
    }
    
    @RequestMapping(value = { "/user/profile"}, method = RequestMethod.POST)
    public String postProfile(@RequestParam("file") MultipartFile file, @ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) throws IOException {
    	userService.updateUserInformation(userForm.getUsername(),userForm.getFirstname(), userForm.getLastname(), userForm.getPhoneNumber(), this.getContextEmail(),file.getBytes());
    	return "redirect:/user/profile";
    }
    
    

    

 	
 	private String getContextEmail(){
 		String email;
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	if (principal instanceof UserDetails) {
    	   email = ((UserDetails)principal).getUsername();
    	} else {
    	   email = principal.toString();
    	}
    	return email;
 	}
 	
 	private String getContextUsername(){
 		String username;
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	if (principal instanceof UserDetails) {
    	   username = userService.findByEmail(((UserDetails)principal).getUsername()).getUsername();
    	} else {
    	   username = userService.findByEmail(principal.toString()).getUsername();
    	}
    	return username;
 	}
}
