package com.java.portal.service.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.java.portal.dao.AdminDao;
import com.java.portal.dao.UserAccountDao;
import com.java.portal.entity.ContactMessage;
import com.java.portal.entity.JobApplication;
import com.java.portal.entity.Jobs;
import com.java.portal.entity.User;
import com.java.portal.service.AdminService;
import com.java.portal.utilities.FileUtility;
import com.java.portal.utilities.MD5Encryption;
import com.java.portal.utilities.MailUtility;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger log = Logger.getLogger(AdminServiceImpl.class);
	@Autowired(required = true)
	private ApplicationContext context;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private HttpSession session;
	

	public String addJob(Jobs jobs) {
		StringBuffer sb = new StringBuffer();

		String status = null;
		try {
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			boolean statusCode = dao.insertJob(jobs);
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			if (statusCode) {
				status = "Successfully added the Job";
			} else {
				status = "Error occured while adding Job";
			}

			sb.append("<statusCode>" + statusCode + "</statusCode>");
			sb.append("<status>" + status + "</status>");
			sb.append("</data>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	public String getAllJobs() {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		List<Jobs> jobsList = dao.selectAllJobs();
		StringBuffer tableContent = new StringBuffer();
		String iconClass = null;
		int slNo = 0;
		for (int i = 0; i < jobsList.size(); i++) {
			Jobs jobs = jobsList.get(i);
			slNo = i + 1;
			tableContent.append("<tr id='" + jobs.getJobCode() + "'>");
			tableContent.append("<td>" + slNo + "</td>");
			tableContent.append("<td>" + jobs.getJobCode() + "</td>");
			tableContent.append("<td>" + jobs.getJobTitle() + "</td>");
			tableContent.append("<td>" + jobs.getJobLocation() + "</td>");
			tableContent.append("<td>" + jobs.getJobType() + "</td>");
			tableContent.append("<td>" + jobs.getJobStatus() + "</td>");
			tableContent.append("<td><a href=\"javascript:editRecord('" + jobs.getJobCode()
					+ "')\"><span class=\"glyphicon glyphicon-pencil\"></span></a></td>");
			tableContent.append("<td><a href=\"javascript:deleteRecord('" + jobs.getJobCode()
					+ "')\"><span class=\"glyphicon glyphicon-trash\"></span></a></td>");
			tableContent.append("</tr>");
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<tableContent>");
		sb.append("<![CDATA[");
		sb.append(tableContent.toString());
		sb.append("]]>");
		sb.append("</tableContent>");
		sb.append("</data>");

		return sb.toString();
	}

	public String getJobDetails(String jobId) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		Jobs job = dao.getJobDetails(jobId);
		StringBuffer tableContent = new StringBuffer();
		StringBuffer overviewContent = new StringBuffer();

		tableContent.append("<tr><td>Job Code</td><td>" + job.getJobCode() + "</td></tr>");
		tableContent.append("<tr><td>Title</td><td>" + job.getJobTitle() + "</td></tr>");
		tableContent.append("<tr><td>Location</td><td>" + job.getJobLocation() + "</td></tr>");
		tableContent.append("<tr><td>Job Type</td><td>" + job.getJobType() + "</td></tr>");
		tableContent.append("<tr><td>Requirements</td><td>" + job.getJobRequirements() + "</td></tr>");
		tableContent.append("<tr><td>Description</td><td>" + job.getJobDescription() + "</td></tr>");
		tableContent.append("<tr><td><a type='button' href=\"javascript:checkUser()\" class='btn btn-primary btn-sm'>Apply for this Job</a></td><td></td></tr>");
		overviewContent.append("<h3 style='margin-top: 5px;'>Overview</h3>");
		overviewContent.append("<h4><span class='glyphicon glyphicon-qrcode' style='padding-right: 10px;'></span>Job Code: </h4>");
		overviewContent.append("<p class='help-block'>" + job.getJobCode() + "</p>");
		overviewContent.append("<h4><span class='fa fa-map-marker' style='padding-right: 10px;'></span>Location: </h4>");
		overviewContent.append("<p class='help-block'>" + job.getJobLocation() + "</p>");
		overviewContent.append("<h4><span class='fa fa-user' style='padding-right: 10px;'></span>Job Title: </h4>");
		overviewContent.append("<p class='help-block'>" + job.getJobTitle() + "</p>");
		overviewContent.append("<h4><span class='fa fa-clock-o' style='padding-right: 10px;'></span>Hours: </h4>");
		overviewContent.append("<p class='help-block'>" + job.getHours() + "</p>");
		overviewContent.append("<h4><span class='fa fa-money' style='padding-right: 10px;'></span>Rate: </h4>");
		overviewContent.append("<p class='help-block'>" + job.getRate() + "</p>");

		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<tableContent>");
		sb.append("<![CDATA[");
		sb.append(tableContent.toString());
		sb.append("]]>");
		sb.append("</tableContent>");

		sb.append("<overviewContent>");
		sb.append("<![CDATA[");
		sb.append(overviewContent.toString());
		sb.append("]]>");
		sb.append("</overviewContent>");
		
		
		User user = (User)session.getAttribute("USER_BEAN");
		if(user!=null){
			sb.append("<firstName><![CDATA["+user.getFirstName()+"]]></firstName>");
			sb.append("<lastName><![CDATA["+user.getLastName()+"]]></lastName>");
			sb.append("<email><![CDATA["+user.getEmail()+"]]></email>");
		}
		
		
		
		sb.append("</data>");
		
		

		return sb.toString();
	}

	public String getActiveJobs() {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		List<Jobs> jobList = dao.selectActiveJobs();
		StringBuffer tableContent = new StringBuffer();
		String jobDetails = null;

		for (Jobs job : jobList) {
			jobDetails = job.getJobRequirements();
			if (jobDetails != null) {
				jobDetails = jobDetails.substring(0, 200);
			}

			tableContent.append("<li class='list-group-item'>");
			tableContent.append("<h3>" + job.getJobTitle() + " <span class='jobtitle " + job.getJobType() + "'>"
					+ job.getJobType() + "</span></h3>");
			tableContent.append("<p class='help-block'>");
			tableContent.append("<span class='fa fa-money' style='padding-right:10px;'></span>" + job.getRate() + "");
			tableContent.append("<span class='fa fa-map-marker' style='padding-left:30px;padding-right:10px;'></span>"
					+ job.getJobLocation() + "");
			tableContent
					.append("<span class='glyphicon glyphicon-time' style='padding-left:30px;padding-right:10px;'></span>"
							+ job.getHours() + "");
			tableContent.append("</p><p>" + jobDetails + "&hellip;</p>");
			tableContent.append("<a type='button' href=\"javascript:jobDetails('" + job.getJobCode()
					+ "')\" class='btn btn-primary btn-sm'>More Details</a>");
			tableContent.append("</li>");
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<tableContent>");
		sb.append("<![CDATA[");
		sb.append(tableContent.toString());
		sb.append("]]>");
		sb.append("</tableContent>");
		sb.append("</data>");

		return sb.toString();
	}

	public boolean saveApplication(JobApplication jba) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		return dao.insertJobApplication(jba);
	}

	public String getOpenApplications() {
		try {
			StringBuffer tableContent = new StringBuffer();
			List<JobApplication> appList = new ArrayList<JobApplication>();
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			appList = dao.selectOpenApplications();
			int slNo = 0;
			for (int i = 0; i < appList.size(); i++) {
				JobApplication application = appList.get(i);
				slNo = i + 1;
				tableContent.append("<tr id='" + application.getPkid() + "'>");
				tableContent.append("<td>" + slNo + "</td>");
				tableContent.append("<td>" + application.getUser().getFirstName() + "</td>");
				tableContent.append("<td>" + application.getUser().getEmail() + "</td>");
				tableContent.append("<td>" + application.getJobs().getJobCode() + "</td>");
				tableContent.append("<td>" + application.getJobs().getJobLocation() + "</td>");
				tableContent.append("<td>" + application.getApplicationStatus() + "</td>");
				tableContent.append("<td>" + application.getApplicationDate() + "</td>");
				tableContent.append("<td><a href=\"javascript:viewapp('" + application.getPkid()
						+ "')\"><span class=\"fa fa-eye\" title=\"View Applciation\"></span></a></td>");
				tableContent.append("</tr>");
			}
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<tableContent>");
			sb.append("<![CDATA[");
			sb.append(tableContent.toString());
			sb.append("]]>");
			sb.append("</tableContent>");
			sb.append("</data>");

			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

	}

	public String getUsers() {

		try {
			StringBuffer tableContent = new StringBuffer();
			UserAccountDao dao = (UserAccountDao) context.getBean("userAccountDaoImpl");
			List<User> userList = dao.fetchUsers();
			
			Set<User> userSet = new HashSet<User>();
			for(User user : userList){
				userSet.add(user);
			}
			log.info("set size:"+userSet.size());
			
			int slNo = 1;
			
			Iterator iterator = userSet.iterator();
			   while (iterator.hasNext()){
				   	User user = new User();
				   	user = (User)iterator.next();
				   	tableContent.append("<tr id='" + user.getPkid() + "'>");
					tableContent.append("<td>" + slNo + "</td>");
					tableContent.append("<td>" + user.getFirstName()+ "</td>");
					tableContent.append("<td>" + user.getLastName()+ "</td>");
					tableContent.append("<td>" + user.getEmail() + "</td>");
					tableContent.append("<td>" + user.getRole().getRole() + "</td>");
					tableContent.append("<td>" + user.getJobApplications().size() + "</td>");
					tableContent.append("<td><a href=\"javascript:viewUser('" + user.getPkid()+ "')\"><span class=\"fa fa-eye\" title=\"View User\"></span></a></td>");
					tableContent.append("</tr>");
					slNo = slNo + 1;
			   }
			
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<tableContent>");
			sb.append("<![CDATA[");
			sb.append(tableContent.toString());
			sb.append("]]>");
			sb.append("</tableContent>");
			sb.append("</data>");

			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public String loadApplicationBasedOnId(int id) {
		StringBuffer sb = new StringBuffer();
		try{
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			JobApplication jpa = dao.selectApplicationBasedOnId(id);
			
			String resourcesPath = servletContext.getRealPath("/");
			resourcesPath = resourcesPath + "resources" + File.separator+ "resumes";
			File resume = new File(resourcesPath);
			String resumeName = jpa.getResumeName();
			resumeName = resumeName.replace(" ", "");
			resumeName = RandomStringUtils.randomAlphanumeric(6)+resumeName;
			resume.mkdirs();
			resume = new File(resourcesPath+File.separator+resumeName);
			log.info("Resume dir:"+resume.getAbsolutePath());
		    
			Blob resumeBlob = jpa.getResume();
			long length = resumeBlob.length();
			byte[] bytes = resumeBlob.getBytes(1, (int) length);	
			
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(resume));
			stream.write(bytes);
			stream.close();
			
			StringBuffer overviewContent = new StringBuffer();

			overviewContent.append("<h3 style='margin-top: 5px;'>Overview</h3>");
			overviewContent.append("<h4><span class='glyphicon glyphicon-qrcode' style='padding-right: 10px;'></span>Job Code: </h4>");
			overviewContent.append("<p class='help-block'>" + jpa.getJobs().getJobCode() + "</p>");
			overviewContent.append("<h4><span class='fa fa-map-marker' style='padding-right: 10px;'></span>Location: </h4>");
			overviewContent.append("<p class='help-block'>" + jpa.getJobs().getJobLocation() + "</p>");
			overviewContent.append("<h4><span class='fa fa-user' style='padding-right: 10px;'></span>Job Title: </h4>");
			overviewContent.append("<p class='help-block'>" + jpa.getJobs().getJobTitle() + "</p>");
			overviewContent.append("<h4><span class='fa fa-clock-o' style='padding-right: 10px;'></span>Hours: </h4>");
			overviewContent.append("<p class='help-block'>" + jpa.getJobs().getHours() + "</p>");
			overviewContent.append("<h4><span class='fa fa-money' style='padding-right: 10px;'></span>Rate: </h4>");
			overviewContent.append("<p class='help-block'>" + jpa.getJobs().getRate() + "</p>");
			
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			
			sb.append("<jobCode><![CDATA[Application for Job Code : "+jpa.getJobs().getJobCode()+"]]></jobCode>");
			sb.append("<firstName><![CDATA["+jpa.getUser().getFirstName()+"]]></firstName>");
			sb.append("<lastName><![CDATA["+jpa.getUser().getLastName()+"]]></lastName>");
			sb.append("<email><![CDATA["+jpa.getUser().getEmail()+"]]></email>");
			sb.append("<coverLetter><![CDATA["+jpa.getCoverLetter()+"]]></coverLetter>");
			sb.append("<downloadResume><![CDATA[resources/resumes/"+resumeName+"]]></downloadResume>");
			sb.append("<viewResume><![CDATA["+jpa.getJobs().getJobCode()+"]]></viewResume>");
			
			
			sb.append("<overviewContent><![CDATA["+overviewContent.toString()+"]]></overviewContent>");
			
			
			sb.append("</data>");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return sb.toString();
	}

	public String updateApplicationStatus(int pkid, String status) {
		
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		boolean updateStatus = dao.updateApplicationStatus(pkid, status);
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<status>"+updateStatus+"</status>");
		sb.append("</data>");
		
		return sb.toString();
	}

	public String getApplicationsOnStatus(List<String> status) {

		try {
			StringBuffer tableContent = new StringBuffer();
			List<JobApplication> appList = new ArrayList<JobApplication>();
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			appList = dao.selectOpenApplicationsOnStatus(status);
			int slNo = 0;
			for (int i = 0; i < appList.size(); i++) {
				JobApplication application = appList.get(i);
				slNo = i + 1;
				tableContent.append("<tr id='" + application.getPkid() + "'>");
				tableContent.append("<td>" + slNo + "</td>");
				tableContent.append("<td>" + application.getUser().getFirstName() + "</td>");
				tableContent.append("<td>" + application.getUser().getEmail() + "</td>");
				tableContent.append("<td>" + application.getJobs().getJobCode() + "</td>");
				tableContent.append("<td>" + application.getJobs().getJobLocation() + "</td>");
				tableContent.append("<td>" + application.getApplicationStatus() + "</td>");
				tableContent.append("<td>" + application.getApplicationDate() + "</td>");
				tableContent.append("<td><a href=\"javascript:viewapp('" + application.getPkid()
						+ "')\"><span class=\"fa fa-eye\" title=\"View Applciation\"></span></a></td>");
				tableContent.append("</tr>");
			}
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<tableContent>");
			sb.append("<![CDATA[");
			sb.append(tableContent.toString());
			sb.append("]]>");
			sb.append("</tableContent>");
			sb.append("</data>");

			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

	
	}

	public String getDashboard() {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		StringBuffer sb = new StringBuffer();
		List<String> status = new ArrayList<String>();
		status.add("OPEN");
		status.add("CLOSED");
		status.add("ON-HOLD");
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		
		sb.append("<jobs>"+dao.selectJobsOnStatus(status).size()+"</jobs>");
		sb.append("<users>"+dao.selectNoOfUsers()+"</users>");
		sb.append("<apps>"+dao.selectNoOfApplications()+"</apps>");
		sb.append("<inbox>"+dao.selectNoOfMessages()+"</inbox>");
		sb.append("</data>");

		return sb.toString();
	}

	public String getPieChart() {
		Map<String, Integer> jobStat = new HashMap<String, Integer>();
		
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		jobStat.put("OPEN",dao.selectJobsOnStatus("OPEN").size());
		jobStat.put("CLOSED",dao.selectJobsOnStatus("CLOSED").size());
		jobStat.put("ON-HOLD",dao.selectJobsOnStatus("ON-HOLD").size());
		
		StringBuffer sb = new StringBuffer();
		sb.append("{\"cols\": [");
		sb.append("{\"id\":\"\",\"label\":\"Job Type\",\"pattern\":\"\",\"type\":\"string\"},{\"id\":\"\",\"label\":\"Job Count\",\"pattern\":\"\",\"type\":\"number\"}],");
		sb.append("\"rows\": [");
		
		sb.append("{\"c\":[{\"v\":\"Open Jobs\",\"f\":null},{\"v\":"+jobStat.get("OPEN")+",\"f\":null}]},");
		sb.append("{\"c\":[{\"v\":\"Jobs Closed\",\"f\":null},{\"v\":"+jobStat.get("CLOSED")+",\"f\":null}]},");
		sb.append("{\"c\":[{\"v\":\"Jobs onhold\",\"f\":null},{\"v\":"+jobStat.get("ON-HOLD")+",\"f\":null}]}");
		
		sb.append("]}");
		
		return sb.toString();
	}

	public String getJobsOnStatus(List<String> status) {

		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		List<Jobs> jobsList = new ArrayList<Jobs>();
		jobsList = dao.selectJobsOnStatus(status);

		StringBuffer tableContent = new StringBuffer();
		String iconClass = null;
		int slNo = 0;
		for (int i = 0; i < jobsList.size(); i++) {
			Jobs jobs = jobsList.get(i);
			slNo = i + 1;
			tableContent.append("<tr id='" + jobs.getJobCode() + "'>");
			tableContent.append("<td>" + slNo + "</td>");
			tableContent.append("<td>" + jobs.getJobCode() + "</td>");
			tableContent.append("<td>" + jobs.getJobTitle() + "</td>");
			tableContent.append("<td>" + jobs.getJobLocation() + "</td>");
			tableContent.append("<td>" + jobs.getJobType() + "</td>");
			tableContent.append("<td>" + jobs.getJobStatus() + "</td>");
			tableContent.append("<td><a href=\"javascript:editRecord('" + jobs.getJobCode()
					+ "')\"><span class=\"glyphicon glyphicon-pencil\"></span></a></td>");
			tableContent.append("<td><a href=\"javascript:deleteRecord('" + jobs.getJobCode()
					+ "')\"><span class=\"glyphicon glyphicon-trash\"></span></a></td>");
			tableContent.append("</tr>");
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<tableContent>");
		sb.append("<![CDATA[");
		sb.append(tableContent.toString());
		sb.append("]]>");
		sb.append("</tableContent>");
		sb.append("</data>");

		return sb.toString();
	
	}

	public String getJobBasedOnCode(String jobcode) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		log.info("Getting Job details for the Job Code :"+jobcode); 
		Jobs job = dao.getJobDetails(jobcode);
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<jobCategory><![CDATA["+job.getJobCategory()+"]]></jobCategory>");
			sb.append("<jobCode><![CDATA["+job.getJobCode()+"]]></jobCode>");
			sb.append("<jobTitle><![CDATA["+job.getJobTitle()+"]]></jobTitle>");
			sb.append("<jobLocation><![CDATA["+job.getJobLocation()+"]]></jobLocation>");
			sb.append("<jobType><![CDATA["+job.getJobType()+"]]></jobType>");
			sb.append("<jobRequirements><![CDATA["+job.getJobRequirements()+"]]></jobRequirements>");
			sb.append("<jobDescription><![CDATA["+job.getJobDescription()+"]]></jobDescription>");
			sb.append("<rate><![CDATA["+job.getRate()+"]]></rate>");
			sb.append("<hours><![CDATA["+job.getHours()+"]]></hours>");
			sb.append("<jobStatus><![CDATA["+job.getJobStatus()+"]]></jobStatus>");
		sb.append("</data>");
		return sb.toString();
	}

	public String updateJob(Jobs job) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		boolean statusCode = dao.updateJob(job);
		String status = null;
		if (statusCode) {
			status = "Successfully updated the Job";
		} else {
			status = "Error occured while updating Job";
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<status>"+status+"</status>");
		sb.append("<statusCode>"+statusCode+"</statusCode>");
		sb.append("</data>");
		
		return sb.toString();
	}

	public String deleteJob(String jobcode) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		boolean statusCode = dao.deleteJob(jobcode);
		String status = null;
		if (statusCode) {
			status = "Successfully deleted the Job";
		} else {
			status = "Error occured while deleting the Job";
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<status>"+status+"</status>");
		sb.append("<statusCode>"+statusCode+"</statusCode>");
		sb.append("</data>");
		
		return sb.toString();
	}

	public String saveMessage(ContactMessage msg) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		boolean statusCode = dao.insertContactMsg(msg);

		String status = null;
		if (statusCode) {
			status = "Thanks for contacting us, we will get back to you shortly!";
		} else {
			status = "Error occured while submitting your query!";
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<status>"+status+"</status>");
		sb.append("<statusCode>"+statusCode+"</statusCode>");
		sb.append("</data>");
		
		return sb.toString();
	}

	public String getContactMsgs() {


		try {
			StringBuffer tableContent = new StringBuffer();
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			List<ContactMessage> msgList = dao.fetchContactMsgs();
			int slNo = 1;
			for(ContactMessage msg:msgList){
					   	tableContent.append("<tr>");
						tableContent.append("<td>" + slNo + "</td>");
						tableContent.append("<td>" + msg.getFirstName() + " "+msg.getLastName()+"</td>");
						tableContent.append("<td>" + msg.getCompany()+ "</td>");
						tableContent.append("<td>" + msg.getEmail() + "</td>");
						tableContent.append("<td>" + msg.getCity() + "</td>");
						tableContent.append("<td>" + msg.getState() + "</td>");
						tableContent.append("<td>" + msg.getSubmittedDate() + "</td>");
						tableContent.append("<td><a href=\"javascript:viewmsg('" + msg.getPkid()
						+ "')\"><span class=\"fa fa-eye\" title=\"View Applciation\"></span></a></td>");
						tableContent.append("</tr>");
						slNo = slNo + 1;
			}
			
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<tableContent>");
			sb.append("<![CDATA[");
			sb.append(tableContent.toString());
			sb.append("]]>");
			sb.append("</tableContent>");
			sb.append("</data>");

			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	
	}

	public String getContactMsgBasedOnId(int msgId) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		ContactMessage msg = dao.getContactMessage(msgId);
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<NameID>"+msg.getFirstName()+" "+msg.getLastName()+"</NameID>");
		sb.append("<EmailID>"+msg.getEmail()+"</EmailID>");
		sb.append("<CityID>"+msg.getCity()+"</CityID>");
		sb.append("<AddressID>"+msg.getAddress()+"</AddressID>");
		sb.append("<StateID>"+msg.getState()+"</StateID>");
		sb.append("<DateID>"+msg.getSubmittedDate()+"</DateID>");
		sb.append("<CommentsID>"+msg.getComments()+"</CommentsID>");
		sb.append("<MobileID>"+msg.getMobile()+"</MobileID>");
		sb.append("</data>");
		
		return sb.toString();
	}

	public String getBarH() {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		
		StringBuffer sb = new StringBuffer();
		sb.append("{\"cols\": [");
		sb.append("{\"id\":\"\",\"label\":\"Jobs\",\"pattern\":\"\",\"type\":\"string\"},");
		sb.append("{\"id\":\"\",\"label\":\"Jobs\",\"pattern\":\"\",\"type\":\"number\"},");
		sb.append("],\"rows\": [");
		sb.append("{\"c\":[{\"v\":\"CONTRACT\",\"f\":null},{\"v\":"+dao.selectJobsOnType("CONTRACT").size()+",\"f\":null}]},");
		sb.append("{\"c\":[{\"v\":\"PERMANENT\",\"f\":null},{\"v\":"+dao.selectJobsOnType("PERMANENT").size()+",\"f\":null}]},");
		sb.append("{\"c\":[{\"v\":\"FULL-TIME\",\"f\":null},{\"v\":"+dao.selectJobsOnType("FULL-TIME").size()+",\"f\":null}]},");
		sb.append("{\"c\":[{\"v\":\"PART-TIME\",\"f\":null},{\"v\":"+dao.selectJobsOnType("PART-TIME").size()+",\"f\":null}]},");
		sb.append("]}");
		
		return sb.toString();
	}

	public String getBarV() {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		
		StringBuffer sb = new StringBuffer();
		sb.append("{\"cols\": [");
		sb.append("{\"id\":\"\",\"label\":\"Job Status\",\"pattern\":\"\",\"type\":\"string\"},");
		sb.append("{\"id\":\"\",\"label\":\"Job Application\",\"pattern\":\"\",\"type\":\"number\"},");
		sb.append("],\"rows\": [");
		sb.append("{\"c\":[{\"v\":\"OPEN\",\"f\":null},{\"v\":"+dao.selectApplicationsOnStatus("OPEN").size()+",\"f\":null}]},");
		sb.append("{\"c\":[{\"v\":\"CLOSED\",\"f\":null},{\"v\":"+dao.selectApplicationsOnStatus("CLOSED").size()+",\"f\":null}]},");
		sb.append("{\"c\":[{\"v\":\"ON-HOLD\",\"f\":null},{\"v\":"+dao.selectApplicationsOnStatus("ON-HOLD").size()+",\"f\":null}]}");
		
		sb.append("]}");
		return sb.toString();
	}

	public String getCareers(List<String> type) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		List<Jobs> jobList = dao.selectJobsOnType(type);
		StringBuffer tableContent = new StringBuffer();
		String jobDetails = null;

		for (Jobs job : jobList) {
			jobDetails = job.getJobRequirements();
			if (jobDetails != null) {
				jobDetails = jobDetails.substring(0, 200);
			}

			tableContent.append("<li class='list-group-item'>");
			tableContent.append("<h3>" + job.getJobTitle() + " <span class='jobtitle " + job.getJobType() + "'>"
					+ job.getJobType() + "</span></h3>");
			tableContent.append("<p class='help-block'>");
			tableContent.append("<span class='fa fa-money' style='padding-right:10px;'></span>" + job.getRate() + "");
			tableContent.append("<span class='fa fa-map-marker' style='padding-left:30px;padding-right:10px;'></span>"
					+ job.getJobLocation() + "");
			tableContent
					.append("<span class='glyphicon glyphicon-time' style='padding-left:30px;padding-right:10px;'></span>"
							+ job.getHours() + "");
			tableContent.append("</p><p>" + jobDetails + "&hellip;</p>");
			tableContent.append("<a type='button' href=\"javascript:jobDetails('" + job.getJobCode()
					+ "')\" class='btn btn-primary btn-sm'>More Details</a>");
			tableContent.append("</li>");
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<tableContent>");
		sb.append("<![CDATA[");
		sb.append(tableContent.toString());
		sb.append("]]>");
		sb.append("</tableContent>");
		sb.append("</data>");

		return sb.toString();
	}

	public String getMyJobs() {
		List<JobApplication> jobsList = new ArrayList<JobApplication>();
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		User user = (User)session.getAttribute("USER_BEAN");
		jobsList = dao.selectMyJobs(user.getPkid());
		StringBuffer tableContent = new StringBuffer();
		int slNo = 1;
		
		Set<JobApplication> jobSet = new HashSet<JobApplication>();
		for(JobApplication jpa : jobsList){
			jobSet.add(jpa);
		}
		
		Iterator iterator = jobSet.iterator();
		   while (iterator.hasNext()){
			   JobApplication application = (JobApplication)iterator.next(); 
			   tableContent.append("<tr>");
				tableContent.append("<td>" + slNo + "</td>");
				tableContent.append("<td>" + application.getJobs().getJobCode() + "</td>");
				tableContent.append("<td>" + application.getJobs().getJobTitle() + "</td>");
				tableContent.append("<td>" + application.getJobs().getJobType() + "</td>");
				tableContent.append("<td>" + application.getJobs().getJobLocation() + "</td>");
				tableContent.append("<td>" + application.getJobs().getHours() + "</td>");
				tableContent.append("<td>" + application.getJobs().getRate() + "</td>");
				tableContent.append("<td>" + application.getApplicationDate() + "</td>");
				tableContent.append("<td>" + application.getApplicationStatus() + "</td>");
				tableContent.append("</tr>");
				slNo = slNo + 1;
		   }
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<tableContent>");
		sb.append("<![CDATA[");
		sb.append(tableContent.toString());
		sb.append("]]>");
		sb.append("</tableContent>");
		sb.append("</data>");
		
		return sb.toString();
	}

	public String exportJobs(List<String> status) {
		try{
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			List<Jobs> jobsList = new ArrayList<Jobs>();
			jobsList = dao.selectJobsOnStatus(status);
			
			String hrefLink = null;
			String resourcesPath = servletContext.getRealPath("/");
			resourcesPath = resourcesPath + "resources" + File.separator+ "export";
			File exportFolder = new File(resourcesPath);
			exportFolder.mkdirs();
			String fileName = "jobs_export_"+FileUtility.getTimeStamp()+".xlsx";
			File exportFile = new File(resourcesPath+File.separator+fileName);
			if(jobsList.size()>0){
				log.info("writing file..");
				log.info(exportFile);
				FileUtility fu = new FileUtility();
				fu.writeJobs(jobsList, exportFile.getAbsolutePath());
			}else{
				log.info("nothing found to write...");
			}
			hrefLink = "resources"+"/"+"export"+"/"+exportFile.getName();
			
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<hrefLink>");
			sb.append("<![CDATA[");
			sb.append(hrefLink);
			sb.append("]]>");
			sb.append("</hrefLink>");
			sb.append("</data>");

			return sb.toString();
		}
		catch(Exception e){
			e.printStackTrace();
			return "";
		}
		
	
	}

	public String exportApplications(List<String> status) {
		try {
			StringBuffer tableContent = new StringBuffer();
			List<JobApplication> list = new ArrayList<JobApplication>();
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			list = dao.selectOpenApplicationsOnStatus(status);
			String hrefLink = null;
			String resourcesPath = servletContext.getRealPath("/");
			resourcesPath = resourcesPath + "resources" + File.separator+ "export";
			File exportFolder = new File(resourcesPath);
			exportFolder.mkdirs();
			String fileName = "applications_export_"+FileUtility.getTimeStamp()+".xlsx";
			File exportFile = new File(resourcesPath+File.separator+fileName);
			if(list.size()>0){
				log.info("writing file..");
				log.info(exportFile);
				FileUtility fu = new FileUtility();
				fu.writeApplications(list, exportFile.getAbsolutePath());
			}else{
				log.info("nothing found to write...");
			}
			hrefLink = "resources"+"/"+"export"+"/"+exportFile.getName();
			
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<hrefLink>");
			sb.append("<![CDATA[");
			sb.append(hrefLink);
			sb.append("]]>");
			sb.append("</hrefLink>");
			sb.append("</data>");
			
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public String exportUsers() {

		try {
			StringBuffer tableContent = new StringBuffer();
			UserAccountDao dao = (UserAccountDao) context.getBean("userAccountDaoImpl");
			List<User> userList = dao.fetchUsers();
			Set<User> userSet = new HashSet<User>();
			for(User user : userList){
				userSet.add(user);
			}

			int slNo = 1;
			List<User> list = new ArrayList<User>();
			Iterator iterator = userSet.iterator();
			   while (iterator.hasNext()){
				   	User user = (User)iterator.next();
				   	list.add(user);
			   }
			
		   String hrefLink = null;
			String resourcesPath = servletContext.getRealPath("/");
			resourcesPath = resourcesPath + "resources" + File.separator+ "export";
			File exportFolder = new File(resourcesPath);
			exportFolder.mkdirs();
			String fileName = "users_export_"+FileUtility.getTimeStamp()+".xlsx";
			File exportFile = new File(resourcesPath+File.separator+fileName);
			if(list.size()>0){
				log.info("writing file..");
				log.info(exportFile);
				FileUtility fu = new FileUtility();
				fu.writeUsers(list, exportFile.getAbsolutePath());
			}else{
				log.info("nothing found to write...");
			}
			hrefLink = "resources"+"/"+"export"+"/"+exportFile.getName();
				
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<hrefLink>");
			sb.append("<![CDATA[");
			sb.append(hrefLink);
			sb.append("]]>");
			sb.append("</hrefLink>");
			sb.append("</data>");

			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	
	}

	public String exportMsgs() {
		try {
			StringBuffer tableContent = new StringBuffer();
			List<ContactMessage> list = new ArrayList<ContactMessage>();
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			list = dao.fetchContactMsgs();
			String hrefLink = null;
			String resourcesPath = servletContext.getRealPath("/");
			resourcesPath = resourcesPath + "resources" + File.separator+ "export";
			File exportFolder = new File(resourcesPath);
			exportFolder.mkdirs();
			String fileName = "msgs_export_"+FileUtility.getTimeStamp()+".xlsx";
			File exportFile = new File(resourcesPath+File.separator+fileName);
			if(list.size()>0){
				log.info("writing file..");
				log.info(exportFile);
				FileUtility fu = new FileUtility();
				fu.writeMsgs(list, exportFile.getAbsolutePath());
			}else{
				log.info("nothing found to write...");
			}
			hrefLink = "resources"+"/"+"export"+"/"+exportFile.getName();
			
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<hrefLink>");
			sb.append("<![CDATA[");
			sb.append(hrefLink);
			sb.append("]]>");
			sb.append("</hrefLink>");
			sb.append("</data>");
			
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public String addBulkJobs(List<Jobs> jobList) {
		StringBuffer sb = new StringBuffer();
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		String jobCode = null;
		String status = null;
		String comments = null;
		String statusLink = null;
		StringBuffer tableContent = new StringBuffer();
		
		try{
			for(Jobs job:jobList){
				jobCode = job.getJobCode();
				log.info("Processing job:"+jobCode);
				if(dao.getJobDetails(job.getJobCode())!=null){
					comments = "Job code "+jobCode+" already exists";
					status = "false";
					log.info(comments);
				}else{
					if(dao.insertJob(job)){
						status = "true";
						comments = "Success";
						log.info(comments);
					}else{
						status = "false";
						comments = "Error occured adding the Job "+jobCode;
						log.info(comments);
					}
				}
				log.info("=====================================");
				if(status!=null && status.equalsIgnoreCase("true")){
					statusLink = "<i class=\"fa fa-check\" aria-hidden=\"true\"></i>";
				}else{
					statusLink = "<i class=\"fa fa-times\" aria-hidden=\"true\"></i>";
				}
				tableContent.append("<tr>");
				tableContent.append("<td>"+jobCode+"</td>");
				tableContent.append("<td>"+job.getJobTitle()+"</td>");
				tableContent.append("<td>"+statusLink+"</td>");
				tableContent.append("<td>"+comments+"</td>");
				tableContent.append("</tr>");
				
			}
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<tableContent>");
			sb.append("<![CDATA[");
			sb.append(tableContent.toString());
			sb.append("]]>");
			sb.append("</tableContent>");
			sb.append("</data>");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return sb.toString();
	}

	public String changePassword(User user, String oldPassword, String newPassword) {

		StringBuffer sb = new StringBuffer();

		String status = null;
		String statusCode = null;
		try {
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			if(user.getPassword().equalsIgnoreCase(MD5Encryption.generateMD5Hash(oldPassword))){
				user.setPassword(MD5Encryption.generateMD5Hash(newPassword));
				if(dao.updateUser(user)){
					statusCode = "true";
					status="Password changed successfully!";
				}else{
					statusCode = "false";
					status="Error !";
				}
			}else{
				statusCode = "false";
				status="Incorrect Old password";
			}
			
			
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<statusCode>" + statusCode + "</statusCode>");
			sb.append("<status>" + status + "</status>");
			sb.append("</data>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	
	}

	public String resetPassword(String resetEmail) {
		StringBuffer sb = new StringBuffer();
		try {
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			User user = dao.getResetEmailUser(resetEmail);
			
			String statusCode = null;
			String tempPassword = null;
			String tempPasswordEncr = null;
			String status = null;
			if(user==null){
				log.info("user not found!");
				statusCode = "false";
				status="Email not registered!";
			}else{
				tempPassword = RandomStringUtils.randomAlphanumeric(6).toUpperCase();
				tempPasswordEncr = MD5Encryption.generateMD5Hash(tempPassword);
				user.setPassword(tempPasswordEncr);
				if(dao.updateUser(user)){
					statusCode = "true";
					status="Temporary password has been sent to mail!";
					
					String mailPath = servletContext.getRealPath("/");
					mailPath = mailPath + "resources" + File.separator+ "mail"+ File.separator+ "mail.html";
					FileUtility fu = new FileUtility();
					MailUtility mail = new MailUtility();
					String body = fu.readFile(mailPath);
					body = body.replace("TC_USER_NAME", user.getEmail());
					body = body.replace("TC_PASSWORD", tempPassword);
					String to = user.getEmail();
					String from = "no-reply@in.bosch.com";
					String subject = "Vensa Technologies - Reset Password";
					log.info("sending mail....");
					mail.send(from, to, subject, body, new ArrayList<String>(), new ArrayList<String>());
					
				}else{
					statusCode = "false";
					status="Error occured during resetting password!";
				}
			}
			
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<statusCode>" + statusCode + "</statusCode>");
			sb.append("<status>" + status + "</status>");
			sb.append("</data>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	public String getUserBasedOnId(int id) {

		StringBuffer sb = new StringBuffer();
		try {
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			User user = dao.selectUserBasedOnId(id);
			
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			sb.append("<firstName><![CDATA["+user.getFirstName()+"]]></firstName>");
			sb.append("<lastName><![CDATA["+user.getLastName()+"]]></lastName>");
			sb.append("<email><![CDATA["+user.getEmail()+"]]></email>");
			sb.append("<role><![CDATA["+user.getRole().getRole()+"]]></role>");
			sb.append("</data>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	
	}

	public String updateUserRole(int userId, String role) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		boolean updateStatus = dao.updateRole(userId, role);
		StringBuffer sb = new StringBuffer();
		
		sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
		sb.append("<status>"+updateStatus+"</status>");
		sb.append("</data>");
		
		return sb.toString();
	
	}

}
