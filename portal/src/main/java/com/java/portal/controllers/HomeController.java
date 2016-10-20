package com.java.portal.controllers;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.portal.entity.ContactMessage;
import com.java.portal.entity.JobApplication;
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
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard() {
		return "dashboard";
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
	@RequestMapping(value = "/managejobs", method = RequestMethod.GET)
	public String managejobs() {
		return "managejobs";
	}
	@RequestMapping(value = "/jobdetails", method = RequestMethod.GET)
	public String jobdetails() {
		return "jobdetails";
	}
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public String apply() {
		return "apply";
	}
	@RequestMapping(value = "/manageapplications", method = RequestMethod.GET)
	public String manageapplications() {
		return "manageapplications";
	}
	@RequestMapping(value = "/manageusers", method = RequestMethod.GET)
	public String manageusers() {
		return "manageusers";
	}
	@RequestMapping(value = "/viewapplication", method = RequestMethod.GET)
	public String viewApplication() {
		return "viewapplication";
	}
	@RequestMapping(value = "/editjob", method = RequestMethod.GET)
	public String editjob() {
		return "editjob";
	}
	@RequestMapping(value = "/deletejob", method = RequestMethod.GET)
	public String deleteJob() {
		return "deletejob";
	}
	@RequestMapping(value = "/managemsgs", method = RequestMethod.GET)
	public String managemsgs() {
		return "managemsgs";
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
			String hours = request.getParameter("hours");
			String rate = request.getParameter("rate");
			
			/*log.info("jobCode:"+jobCode);
			log.info("jobCategory:"+jobCategory);
			log.info("jobTitle:"+jobTitle);
			log.info("jobRequirements:"+jobRequirements);
			log.info("jobType:"+jobType);
			log.info("jobDescription:"+jobDescription);
			log.info("jobLocation:"+jobLocation);
			log.info("hours:"+hours);
			log.info("rate:"+rate);
			*/
			Jobs jobs = new Jobs();
			jobs.setJobStatus("OPEN");
			jobs.setJobCategory(jobCategory);
			jobs.setJobCode(jobCode);
			jobs.setJobDescription(jobDescription);
			jobs.setJobLocation(jobLocation);
			jobs.setJobRequirements(jobRequirements);
			jobs.setJobTitle(jobTitle);
			jobs.setJobType(jobType);
			jobs.setHours(hours);
			jobs.setRate(rate);
			jobs.setActive("true");
			
			
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output=adminService.addJob(jobs);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;

		
	}
	
	@RequestMapping(value = "/loadJobs", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String loadJobs(@RequestParam("OPEN") String OPEN, @RequestParam("ON-HOLD") String ONHOLD, @RequestParam("CLOSED") String CLOSED) {
		String output = null;
		List<String> status = new ArrayList<String>();
		if(OPEN.equalsIgnoreCase("true")){status.add("OPEN");}
		if(CLOSED.equalsIgnoreCase("true")){status.add("CLOSED");}
		if(ONHOLD.equalsIgnoreCase("true")){status.add("ON-HOLD");}
		log.info(status);
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output=adminService.getJobsOnStatus(status);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;

		
	}
	
	@RequestMapping(value = "/loadJobDetails", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String loadJobDetails() {
		String jobId = (String)session.getAttribute("JOB_DETAILS_ID");
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output=adminService.getJobDetails(jobId);
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/loadActiveJobs", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String loadActiveJobs() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.getActiveJobs();
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/saveJobId", method = { RequestMethod.POST }, produces = { "text/plain" })
	public @ResponseBody String saveJobId(@RequestParam("jobId") String jobId) {
		log.info("JobId:"+jobId);
		session.setAttribute("JOB_DETAILS_ID", jobId);
		return "";
	}
	
	@RequestMapping(value = "/checkUser", method = { RequestMethod.POST }, produces = { "text/plain" })
	public @ResponseBody String checkUser() {
		User user = (User)session.getAttribute("USER_BEAN");
		if(user==null){
			return "false";
		}else{
			return "true";
		}
		
	}
	
	@RequestMapping(value = "/applyJob", method = { RequestMethod.POST })
	public @ResponseBody String upload(@RequestParam("resume") MultipartFile resume, @RequestParam("coverLetter") String coverLetter) {
		boolean output = false;
		try{
			String pattern = "yyyy-MM-dd";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String currentDate = simpleDateFormat.format(new Date());
			Date applicationDate = new Date();
			applicationDate = simpleDateFormat.parse(currentDate);
			
			String jobId = (String)session.getAttribute("JOB_DETAILS_ID");
			Jobs jobs = new Jobs();
			jobs.setJobCode(jobId);

			User user = (User)session.getAttribute("USER_BEAN");
			JobApplication jba = new JobApplication();
			
			byte[] bytes = resume.getBytes();
			SerialBlob resumeBlob = new SerialBlob(bytes);
			
			jba.setApplicationDate(applicationDate);
			jba.setApplicationStatus("OPEN");
			jba.setCoverLetter(coverLetter);
			jba.setJobs(jobs);
			jba.setUser(user);
			jba.setResume(resumeBlob);
			jba.setResumeName(resume.getOriginalFilename());
			
			log.info(resume.getOriginalFilename());
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.saveApplication(jba);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return Boolean.toString(output);
	}

	@RequestMapping(value = "/loadApplications", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String loadApplications(@RequestParam("OPEN") String OPEN, @RequestParam("ON-HOLD") String ONHOLD, @RequestParam("CLOSED") String CLOSED) {
		String output = null;
		
		List<String> status = new ArrayList<String>();
		if(OPEN.equalsIgnoreCase("true")){status.add("OPEN");}
		if(CLOSED.equalsIgnoreCase("true")){status.add("CLOSED");}
		if(ONHOLD.equalsIgnoreCase("true")){status.add("ON-HOLD");}
		log.info(status);
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output=adminService.getApplicationsOnStatus(status);
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;

		
	}
	
	@RequestMapping(value = "/loadUsers", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String loadUsers() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output=adminService.getUsers();
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;

		
	}
	
	@RequestMapping(value = "/saveApplicationId", method = { RequestMethod.GET }, produces = { "text/plain" })
	public @ResponseBody String authenticate(@RequestParam("id") int id) {
		session.setAttribute("application_id", id);
		log.info("application id saved...");
		return "";
	}
	

	@RequestMapping(value = "/loadApplicationBasedOnId", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String loadApplicationBasedOnId() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			int id = (Integer) session.getAttribute("application_id");
			output=adminService.loadApplicationBasedOnId(id); 
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/updateApplicationStatus", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String updateApplicationStatus(@RequestParam("status") String status) {
		String output = null;
		try{
			int pkid = (Integer) session.getAttribute("application_id");
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			log.info("Status : "+status);
			output = adminService.updateApplicationStatus(pkid, status);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/loadDashBoard", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String loadDashBoard() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.getDashboard();
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/loadPieChart", method = { RequestMethod.POST }, produces = { "text/plain" })
	public @ResponseBody String loadPieChart() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.getPieChart();
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/saveJobCode", method = { RequestMethod.POST }, produces = { "text/plain" })
	public @ResponseBody String saveJobCode(@RequestParam("jobcode") String jobcode) {
		log.info("jobcode:"+jobcode);
		session.setAttribute("JOB_CODE_EDIT", jobcode);
		return "";
	}
	
	@RequestMapping(value = "/getJobBasedOnCode", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String getJobBasedOnCode() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.getJobBasedOnCode((String)session.getAttribute("JOB_CODE_EDIT"));
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/updateJob", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String updateJob() {
		String output = null;
		try{
			String jobCategory = request.getParameter("jobCategory");
			String jobCode = request.getParameter("jobCode");
			String jobTitle = request.getParameter("jobTitle");
			String jobRequirements = request.getParameter("jobRequirements");
			String jobType = request.getParameter("jobType");
			String jobDescription = request.getParameter("jobDescription");
			String jobLocation = request.getParameter("jobLocation");
			String hours = request.getParameter("hours");
			String rate = request.getParameter("rate");
			String jobStatus = request.getParameter("status");
			
			log.info("jobCode:"+jobCode);
			log.info("jobCategory:"+jobCategory);
			log.info("jobTitle:"+jobTitle);
			log.info("jobRequirements:"+jobRequirements);
			log.info("jobType:"+jobType);
			log.info("jobDescription:"+jobDescription);
			log.info("jobLocation:"+jobLocation);
			log.info("hours:"+hours);
			log.info("rate:"+rate);
			log.info("status:"+jobStatus);
			
			Jobs jobs = new Jobs();
			jobs.setJobStatus(jobStatus);
			jobs.setJobCategory(jobCategory);
			jobs.setJobCode(jobCode);
			jobs.setJobDescription(jobDescription);
			jobs.setJobLocation(jobLocation);
			jobs.setJobRequirements(jobRequirements);
			jobs.setJobTitle(jobTitle);
			jobs.setJobType(jobType);
			jobs.setHours(hours);
			jobs.setRate(rate);
			jobs.setActive("true");
			
			
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output=adminService.updateJob(jobs);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/saveJobCodeforDelete", method = { RequestMethod.POST }, produces = { "text/plain" })
	public @ResponseBody String saveJobCodeforDelete(@RequestParam("jobcode") String jobcode) {
		log.info("jobcode:"+jobcode);
		session.setAttribute("JOB_CODE_DELETE", jobcode);
		return "";
	}
	
	@RequestMapping(value = "/getJobBasedForDelete", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String getJobBasedForDelete() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.getJobBasedOnCode((String)session.getAttribute("JOB_CODE_DELETE"));
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/deletJobFromDB", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String deletJobFromDB() {
		String output = null;
		try{
			String jobCode = (String)session.getAttribute("JOB_CODE_DELETE");
			log.info("jobCode:"+jobCode);
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.deleteJob(jobCode);
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/submitMessage", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String submitMessage() {
		String output = null;
		try{
			String pattern = "yyyy-MM-dd HH:mm:ss";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String currentDate = simpleDateFormat.format(new Date());
			Date submittedDate = new Date();
			submittedDate = simpleDateFormat.parse(currentDate);
			
			 String firstName = request.getParameter("firstName");
			 String lastName = request.getParameter("lastName");
			 String email = request.getParameter("email");
			 String company = request.getParameter("company");
			 String address = request.getParameter("address");
			 String city = request.getParameter("city");
			 String state = request.getParameter("state");
			 String comments = request.getParameter("comments");
			 String mobile = request.getParameter("mobile");
			
			ContactMessage msg = new ContactMessage();
			msg.setFirstName(firstName);
			msg.setLastName(lastName);
			msg.setAddress(address);
			msg.setCity(city);
			msg.setComments(comments);
			msg.setCompany(company);
			msg.setEmail(email);
			msg.setState(state);
			msg.setSubmittedDate(submittedDate);
			msg.setMobile(mobile);
			
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.saveMessage(msg);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;

		
	}
	
	@RequestMapping(value = "/loadMsgs", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String loadMsgs() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output=adminService.getContactMsgs();
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;

		
	}
	
	@RequestMapping(value = "/loadContactMsgBasedOnId", method = { RequestMethod.POST }, produces = { "text/xml;charset=UTF-8" })
	public @ResponseBody String loadApplicationBasedOnId(@RequestParam("msgId") int msgId) {
		String output = null;
		log.info("msgID:"+msgId);
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.getContactMsgBasedOnId(msgId); 
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/loadBarH", method = { RequestMethod.POST }, produces = { "text/plain" })
	public @ResponseBody String loadBarH() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.getBarH();
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
	@RequestMapping(value = "/loadBarV", method = { RequestMethod.POST }, produces = { "text/plain" })
	public @ResponseBody String loadBarV() {
		String output = null;
		try{
			AdminService adminService = (AdminServiceImpl) context.getBean("adminServiceImpl");
			output = adminService.getBarV();
		}catch(Exception e){
			e.printStackTrace();
		}
		return output;
	}
	
}
