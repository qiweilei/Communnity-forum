package com.webproject.feeds.web;

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
import com.webproject.feeds.service.SecurityService;



@Controller
@RequestMapping("/admin/*")
public class AdminController {


    
//    @Autowired
//    private ItemService itemService;
    @Autowired
    private SecurityService securityService;


    @RequestMapping(value = "/admin/admin_login", method = RequestMethod.GET)
    public String loginAdmin(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "admin/admin_login";
    }

    @RequestMapping(value = {"/admin", "/admin/admin_welcome"}, method = RequestMethod.GET)
    public String adminWelcome(Model model) {
//    	model.addAttribute("ItemForm", new Item());
        return "admin/admin_welcome";
    }
    
    @RequestMapping(value = {"/admin", "/admin/admin_welcome"}, method = RequestMethod.POST)
    public String adminWelcomeSave( BindingResult bindingResult, Model model) {
//    	String username=this.getContextUsername();
//    	
//    	itemForm.setUsername(username);
//    	itemForm.setApproved(false);
//    	itemService.save(itemForm);
    	return "admin/admin_welcome";
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
