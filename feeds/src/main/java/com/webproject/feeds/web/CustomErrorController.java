package com.webproject.feeds.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

	 @RequestMapping(value = "/error")
	 public String handleError(HttpServletRequest request) {
		    Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		     System.out.println(status);
		    if (status != null) {
		        Integer statusCode = Integer.valueOf(status.toString());
		     
		        if(statusCode == HttpStatus.NOT_FOUND.value()) {
		            return "error-404";
		        }
		        else if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
		            return "error-500";
		        }
		    }
		    return "error";
		}
	
	@Override
	public String getErrorPath() {
		// TODO Auto-generated method stub
		return "/error";
	}
	
}
