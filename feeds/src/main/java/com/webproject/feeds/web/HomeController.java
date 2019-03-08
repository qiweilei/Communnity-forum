package com.webproject.feeds.web;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.webproject.feeds.model.Post;
import com.webproject.feeds.model.User;
import com.webproject.feeds.service.CommentService;
import com.webproject.feeds.service.EmailService;
import com.webproject.feeds.service.PostService;
import com.webproject.feeds.service.UserService;
import com.webproject.feeds.validator.UserValidator;



@Controller
@RequestMapping("/**")
public class HomeController {
	
	@Autowired
    private UserService userService;
    @Autowired
    private PostService postService;
    
    @Autowired
    private CommentService commentService;

    @Autowired
    private UserValidator userValidator;
    
    @Autowired
    private EmailService emailService;
    
    
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model,HttpServletRequest request) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userForm.setEnabled(false);
        userForm.setConfirmationToken(UUID.randomUUID().toString());
        
        
        String appUrl = request.getScheme() + "://" + request.getServerName()+":"+request.getServerPort();
        System.out.println("the url is :"+appUrl);
        SimpleMailMessage registrationEmail = new SimpleMailMessage();
		registrationEmail.setTo(userForm.getEmail());
		registrationEmail.setSubject("Registration Confirmation");
		registrationEmail.setText("To confirm your e-mail address, please click the link below:\n"
				+ appUrl + "/confirm?token=" + userForm.getConfirmationToken());
		registrationEmail.setFrom("talentleolei@gmail.com");
		System.out.println(registrationEmail.getText());
		try{
		emailService.sendEmail(registrationEmail);
		userService.save(userForm);
		}catch( Exception e){
			e.printStackTrace();
		}
		
        model.addAttribute("emailConfirmation", true);

//        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

//        return "redirect:/welcome";
		return "registration";
    }
    
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginPost(Model model) {
       
        return "/default";
    }
    
    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public String Home(Model model, String error) {
    	String username=this.getContextUsername();
    	List<Post> postlist=postService.findAllByDateCreatedAsc();
    	model.addAttribute("postlist", postlist);
    	model.addAttribute("username", username);
        return "home";
    }
    
 // Process confirmation link
 	@RequestMapping(value="/confirm", method = RequestMethod.GET)
 	public String showConfirmationPage(Model model, @RequestParam("token") String token) {
 			
 		User user = userService.findByConfirmationToken(token);
 			
 		if (user == null) { // No token found in DB
 			System.out.println("user is not found ");
 			model.addAttribute("invalidToken", "Oops!  This is an invalid confirmation link.");
 		} else { // Token found
 			System.out.println("user is found "+user.getPassword());
 			model.addAttribute("confirmationToken", user.getConfirmationToken());
 			
 			userService.updateUserSetStatusForName(true, user.getEmail());
 		}
 			
 		
 		return "confirm";		
 	}
 	
 	// Process confirmation link
 	@RequestMapping(value="/confirm", method = RequestMethod.POST)
 	public String processConfirmationForm(Model model, BindingResult bindingResult, @RequestParam Map requestParams) {
 				
 		

 		return "login";		
 	}
 	
 	@RequestMapping(value = {"/post"}, method = RequestMethod.GET)
    public String getPost(Model model, String error,@RequestParam("id") long id) {
 		
 		Post post=postService.findById(id);
 		User user=userService.findByEmail(getContextUsername());
 		model.addAttribute("commentList", commentService.findByPostId(id));
 		model.addAttribute("post", post);
 		model.addAttribute("currentUser", user);
        return "post";
    }
 	@RequestMapping(value = {"/post"}, method = RequestMethod.POST)
    public String postToPost(Model model, String error) {
        


        return "post";
    }
 	
 	@RequestMapping(value = {"/getPostImage"}, method = RequestMethod.GET,produces = "image/jpeg")
 	@ResponseBody
    public byte[] getPostImage(Model model, @RequestParam("id") long id) {
 		System.out.println(postService.findPictureById(id).length);

        return postService.findPictureById(id);
    }
 	
 	@RequestMapping(value = {"/getUserImage"}, method = RequestMethod.GET,produces = "image/jpeg")
 	@ResponseBody
    public byte[] getUserImage(Model model, @RequestParam("id") long id) {
 		System.out.println(userService.findById(id).getPhoto());

        return userService.findById(id).getPhoto();
    }

 	private String getContextUsername(){
 		String username;
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
    	return username;
 	}
}
