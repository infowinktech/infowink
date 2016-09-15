package com.java.portal.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.java.portal.dao.AdminDao;
import com.java.portal.dao.UserAccountDao;
import com.java.portal.entity.Jobs;
import com.java.portal.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger log = Logger.getLogger(AdminServiceImpl.class);
	@Autowired(required=true)
	private ApplicationContext context;
	
	public String addJob(Jobs jobs) {
		StringBuffer sb = new StringBuffer();
		
		String status = null;
		try{
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			boolean statusCode = dao.insertJob(jobs);
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			if(statusCode){
				status = "Successfully added the Job";
			}else{
				status = "Error occured while adding Job";
			}
			
			sb.append("<statusCode>"+statusCode+"</statusCode>");
			sb.append("<status>"+status+"</status>");
			sb.append("</data>");
		}catch(Exception e){
			e.printStackTrace();
		}
		return sb.toString();
	}

	public String getAllJobs() {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		List<Jobs> jobsList = dao.selectAllJobs();
		StringBuffer tableContent = new StringBuffer();
		String iconClass  = null;
		for(Jobs jobs:jobsList){
			tableContent.append("<tr id='"+jobs.getPkid()+"'>");
			tableContent.append("<td>"+jobs.getPkid()+"</td>");
			tableContent.append("<td>"+jobs.getJobCode()+"</td>");
			tableContent.append("<td>"+jobs.getJobTitle()+"</td>");
			tableContent.append("<td>"+jobs.getJobLocation()+"</td>");
			tableContent.append("<td>"+jobs.getJobType()+"</td>");
			if(jobs.getActive().equalsIgnoreCase("true")){
				iconClass = "glyphicon glyphicon-ok";
			}else{
				iconClass = "glyphicon glyphicon-remove";
			}
			tableContent.append("<td><a <span class=\""+iconClass+"\"></span></a></td>");
			tableContent.append("<td><a href=\"javascript:editRecord('"+jobs.getPkid()+"')\"><span class=\"glyphicon glyphicon-pencil\"></span></a></td>");
			tableContent.append("<td><a href=\"javascript:deleteRecord('"+jobs.getPkid()+"')\"><span class=\"glyphicon glyphicon-trash\"></span></a></td>");
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
		
		tableContent.append("<tr><td>Job Code</td><td>"+job.getJobCode()+"</td></tr>");
		tableContent.append("<tr><td>Title</td><td>"+job.getJobTitle()+"</td></tr>");
		tableContent.append("<tr><td>Location</td><td>"+job.getJobLocation()+"</td></tr>");
		tableContent.append("<tr><td>Job Type</td><td>"+job.getJobType()+"</td></tr>");
		tableContent.append("<tr><td>Requirements</td><td>"+job.getJobRequirements()+"</td></tr>");
		tableContent.append("<tr><td>Description</td><td>"+job.getJobDescription()+"</td></tr>");
		tableContent.append("<tr><td><a type='button' href=\"javascript:checkUser()\" class='btn btn-primary btn-sm'>Apply for this Job</a></td><td></td></tr>");
		
		/**
		 * <h3 style="margin-top: 5px;">Overview</h3>
			<h4><span class="fa fa-map-marker" style="padding-right: 10px;"></span>Location: </h4>
			<p class="help-block">20180 Outer Dr Dearborn, MI 48124</p>
			
			<h4><span class="fa fa-user" style="padding-right: 10px;"></span>Job Title: </h4>
			<p class="help-block">Food Service Specialist</p>
			
			<h4><span class="fa fa-clock-o" style="padding-right: 10px;"></span>Hours: </h4>
			<p class="help-block">40h / week</p>
			
			<h4><span class="fa fa-money" style="padding-right: 10px;"></span>Rate: </h4>
			<p class="help-block">$9.50 - $12.50 / hour</p>
			
		 */
		overviewContent.append("<h3 style='margin-top: 5px;'>Overview</h3>");
		
		overviewContent.append("<h4><span class='glyphicon glyphicon-qrcode' style='padding-right: 10px;'></span>Job Code: </h4>");
		overviewContent.append("<p class='help-block'>"+job.getJobCode()+"</p>");
		
		overviewContent.append("<h4><span class='fa fa-map-marker' style='padding-right: 10px;'></span>Location: </h4>");
		overviewContent.append("<p class='help-block'>"+job.getJobLocation()+"</p>");
		
		overviewContent.append("<h4><span class='fa fa-user' style='padding-right: 10px;'></span>Job Title: </h4>");
		overviewContent.append("<p class='help-block'>"+job.getJobTitle()+"</p>");
		
		overviewContent.append("<h4><span class='fa fa-clock-o' style='padding-right: 10px;'></span>Hours: </h4>");
		overviewContent.append("<p class='help-block'>"+job.getHours()+"</p>");
		
		overviewContent.append("<h4><span class='fa fa-money' style='padding-right: 10px;'></span>Rate: </h4>");
		overviewContent.append("<p class='help-block'>"+job.getRate()+"</p>");
		
		
		
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
		sb.append("</data>");

		return sb.toString();
	}

	public String getActiveJobs() {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		List<Jobs> jobList = dao.selectActiveJobs();
		/**
		 * <li class="list-group-item">
					  	<h3>Marketing Coordinator - SEO/SEM Experience <span class="jobtitle">CONTRACT</span></h3>
					  	<p class="help-block">
					  	<span class="fa fa-money" style="padding-right:10px;"></span>$100 per hour
					  	<span class="fa fa-map-marker" style="padding-left:30px;padding-right:10px;"></span>San Jose, SJ
					  	<span class="glyphicon glyphicon-time" style="padding-left:30px;padding-right:10px;"></span>40 hours per week
					  	</p>
					  	<p>
					  	The Security System Engineer provides on-site support to Access Control & CCTV systems installed on all Morgan Stanley offices in Bangalore. This includes configuring, maintaining and supporting Access Control and CCTV field hardware and the backend equipments.Essential Duties and Responsibilities&hellip;
					  	</p>
					  	
					  	<button type="button" class="btn btn-primary btn-sm">Details</button>
			</li>
					  
		 */
		StringBuffer tableContent = new StringBuffer();
		String jobDetails = null;
		
		for(Jobs job:jobList){
			jobDetails = job.getJobRequirements();
			log.info("len:"+jobDetails.length());
			if(jobDetails!=null){jobDetails=jobDetails.substring(0, 200);}
			
			tableContent.append("<li class='list-group-item'>");
			tableContent.append("<h3>"+job.getJobTitle()+" <span class='jobtitle "+job.getJobType()+"'>"+job.getJobType()+"</span></h3>");
			tableContent.append("<p class='help-block'>");
			tableContent.append("<span class='fa fa-money' style='padding-right:10px;'></span>"+job.getRate()+"");
			tableContent.append("<span class='fa fa-map-marker' style='padding-left:30px;padding-right:10px;'></span>"+job.getJobLocation()+"");
			tableContent.append("<span class='glyphicon glyphicon-time' style='padding-left:30px;padding-right:10px;'></span>"+job.getHours()+"");
			tableContent.append("</p><p>"+jobDetails+"&hellip;</p>");
			tableContent.append("<a type='button' href=\"javascript:jobDetails('"+job.getJobCode()+"')\" class='btn btn-primary btn-sm'>More Details</a>");
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
	
}
