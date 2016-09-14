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

	public String getJobDetails(int jobId) {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		Jobs job = dao.getJobDetails(jobId);
		StringBuffer tableContent = new StringBuffer();
		tableContent.append("<tr><td>Job Code</td><td>"+job.getJobCode()+"</td></tr>");
		tableContent.append("<tr><td>Title</td><td>"+job.getJobTitle()+"</td></tr>");
		tableContent.append("<tr><td>Location</td><td>"+job.getJobLocation()+"</td></tr>");
		tableContent.append("<tr><td>Job Type</td><td>"+job.getJobType()+"</td></tr>");
		tableContent.append("<tr><td>Requirements</td><td>"+job.getJobRequirements()+"</td></tr>");
		tableContent.append("<tr><td>Description</td><td>"+job.getJobDescription()+"</td></tr>");
		tableContent.append("<tr><td><a type='button' href=\"javascript:checkUser()\" class='btn btn-primary btn-sm'>Apply</a></td><td></td></tr>");
		
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

	public String getActiveJobs() {
		AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
		List<Jobs> jobList = dao.selectActiveJobs();
		/**
		 * <div>
				  <table class="table jobTable">
				    <tbody>
				      
				    </tbody>
				  </table>
				</div>
		 */
		StringBuffer tableContent = new StringBuffer();
		for(Jobs job:jobList){
			tableContent.append("<div><table class='table jobTable'><tbody>");
			tableContent.append("<tr><td>Job Code</td><td>"+job.getJobCode()+"</td></tr>");
			tableContent.append("<tr><td>Title</td><td>"+job.getJobTitle()+"</td></tr>");
			tableContent.append("<tr><td>Location</td><td>"+job.getJobLocation()+"</td></tr>");
			tableContent.append("<tr><td>Job Type</td><td>"+job.getJobType()+"</td></tr>");
			tableContent.append("<tr><td>Requirements</td><td>"+job.getJobRequirements()+"</td></tr>");
			tableContent.append("<tr><td><a type='button' href=\"javascript:jobDetails('"+job.getPkid()+"')\" class='btn btn-primary btn-sm'>Details</a></td><td></td></tr>");
			tableContent.append("</tbody></table></div>");
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
