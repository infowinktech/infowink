package com.java.portal.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.portal.entity.Jobs;
import com.java.portal.entity.Role;
import com.java.portal.entity.User;
import com.java.portal.service.AdminService;
import com.java.portal.service.UserAccountService;
import com.java.portal.service.impl.AdminServiceImpl;
import com.java.portal.utilities.MD5Encryption;

@Controller
public class HomeController {
	private static final Logger log = Logger.getLogger(HomeController.class);
	@Autowired
	private HttpServletRequest request;
	
	@Autowired(required=true)
	private ApplicationContext context;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = {"/", "home"}, method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	@RequestMapping(value = "/careers", method = RequestMethod.GET)
	public String careers() {
		return "careers";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		session.invalidate();
		return "home";
	}
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "aboutus";
	}
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact() {
		return "contact";
	}
	@RequestMapping(value = "/addjob", method = RequestMethod.GET)
	public String addjob() {
		return "addjob";
	}

	@RequestMapping(value = "/authenticate", method = { RequestMethod.GET }, produces = { "text/plain" })
	public @ResponseBody String authenticate(@RequestParam("email") String email,
			@RequestParam("password") String password) {
		UserAccountService userAccntService = (UserAccountService) context.getBean("userAccountServiceImpl");
		User user = new User();
		user.setEmail(email);
		user.setPassword(MD5Encryption.generateMD5Hash(password));
		if(userAccntService.isUserAuthentic(user)){
			user = (User)session.getAttribute("USER_BEAN");
			log.info("Role:"+user.getRole().getRole());
			return user.getFirstName();
		}else{
			return "";
		}
		
	}
	
	@RequestMapping(value = "/profileLink", method = { RequestMethod.GET }, produces = { "text/plain" })
	public @ResponseBody String profileLink() {
		User user = new User();
		user = (User)session.getAttribute("USER_BEAN");
		if(user!=null){
			return user.getFirstName();
		}else{
			return "";
		}
	}
	
	
	@RequestMapping(value = "/register", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String register() {
		String output = null;
		try{
			String firstName = request.getParameter("rfirstName");
			String lastName = request.getParameter("rlastName");
			String email = request.getParameter("remail");
			String password = request.getParameter("rpassword");
			Role role = new Role();
			role.setId(2);
			role.setRole("User");
			
			
			User user = new User();
			user.setEmail(email);
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setPassword(MD5Encryption.generateMD5Hash(password));
			user.setRole(role);
			
			UserAccountService userAccntService = (UserAccountService) context.getBean("userAccountServiceImpl");
			output=userAccntService.registerUser(user);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;

		
	}
	
	
	@RequestMapping(value = "/addJobtoDB", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String addJobtoDB() {
		String output = null;
		try{
			String jobCategory = request.getParameter("jobCategory");
			String jobCode = request.getParameter("jobCode");
			String jobTitle = request.getParameter("jobTitle");
			String jobRequirements = request.getParameter("jobRequirements");
			String jobType = request.getParameter("jobType");
			String jobDescription = request.getParameter("jobDescription");
			String jobLocation = request.getParameter("jobLocation");
			
			log.info("jobCategory:"+jobCategory);
			log.info("jobCode:"+jobCode);
			log.info("jobTitle:"+jobTitle);
			log.info("jobRequirements:"+jobRequirements);
			log.info("jobType:"+jobType);
			log.info("jobDescription:"+jobDescription);
			Jobs jobs = new Jobs();
			jobs.setActive("true");
			jobs.setJobCategory(jobCategory);
			jobs.setJobCode(jobCode);
			jobs.setJobDescription(jobDescription);
			jobs.setJobLocation(jobLocation);
			jobs.setJobRequirements(jobRequirements);
			jobs.setJobTitle(jobTitle);
			jobs.setJobType(jobType);
			
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output=adminService.addJob(jobs);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;

		
	}

	
}
