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

import com.java.portal.entity.User;
import com.java.portal.service.UserAccountService;
import com.java.portal.utilities.MD5Hashing;

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
		
		log.info("Home!...");
		/*UserAccountService service = (UserAccountService) context.getBean("userAccountServiceImpl");
		List<User> userList = service.getUsers();
		for(User user : userList){
			log.info("User:"+user.getFirstName());
		}*/
		return "home";
	}
	
	@RequestMapping(value = "/careers", method = RequestMethod.GET)
	public String careers() {
		
		return "careers";
	}

	@RequestMapping(value = "/authenticate", method = { RequestMethod.GET }, produces = { "text/plain" })
	public @ResponseBody String authenticate(@RequestParam("email") String email,
			@RequestParam("password") String password) {
		UserAccountService userAccntService = (UserAccountService) context.getBean("userAccountServiceImpl");
		User user = new User();
		user.setEmail(email);
		user.setPassword(MD5Hashing.generateMD5Hash(password));
		if(userAccntService.isUserAuthentic(user)){
			user = (User)session.getAttribute("USER_BEAN");
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
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		session.invalidate();
		
		return "home";
	}
	
	@RequestMapping(value = "/register", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String register() {
		String output = null;
		try{
			String firstName = request.getParameter("rfirstName");
			String lastName = request.getParameter("rlastName");
			String email = request.getParameter("remail");
			String password = request.getParameter("rpassword");
			User user = new User();
			user.setEmail(email);
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setPassword(MD5Hashing.generateMD5Hash(password));
			
			UserAccountService userAccntService = (UserAccountService) context.getBean("userAccountServiceImpl");
			output=userAccntService.registerUser(user);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;

		
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		
		return "aboutus";
	}
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact() {
		
		return "contact";
	}
	
}
