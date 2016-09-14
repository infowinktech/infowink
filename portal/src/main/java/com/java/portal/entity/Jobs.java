package com.java.portal.entity;
// Generated Sep 14, 2016 11:15:53 AM by Hibernate Tools 4.3.1.Final


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Jobs generated by hbm2java
 */
@Entity
@Table(name="JOBS",schema="PORTALDB")
public class Jobs  implements java.io.Serializable {


     private Integer pkid;
     private String jobCategory;
     private String jobCode;
     private String jobTitle;
     private String jobLocation;
     private String jobType;
     private String jobRequirements;
     private String jobDescription;
     private String active;

    public Jobs() {
    }

    public Jobs(String jobCategory, String jobCode, String jobTitle, String jobLocation, String jobType, String jobRequirements, String jobDescription, String active) {
       this.jobCategory = jobCategory;
       this.jobCode = jobCode;
       this.jobTitle = jobTitle;
       this.jobLocation = jobLocation;
       this.jobType = jobType;
       this.jobRequirements = jobRequirements;
       this.jobDescription = jobDescription;
       this.active = active;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="PKID", unique=true, nullable=false)
    public Integer getPkid() {
        return this.pkid;
    }
    
    public void setPkid(Integer pkid) {
        this.pkid = pkid;
    }

    
    @Column(name="JOB_CATEGORY", nullable=false, length=400)
    public String getJobCategory() {
        return this.jobCategory;
    }
    
    public void setJobCategory(String jobCategory) {
        this.jobCategory = jobCategory;
    }

    
    @Column(name="JOB_CODE", nullable=false, length=400)
    public String getJobCode() {
        return this.jobCode;
    }
    
    public void setJobCode(String jobCode) {
        this.jobCode = jobCode;
    }

    
    @Column(name="JOB_TITLE", nullable=false, length=400)
    public String getJobTitle() {
        return this.jobTitle;
    }
    
    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    
    @Column(name="JOB_LOCATION", nullable=false, length=400)
    public String getJobLocation() {
        return this.jobLocation;
    }
    
    public void setJobLocation(String jobLocation) {
        this.jobLocation = jobLocation;
    }

    
    @Column(name="JOB_TYPE", nullable=false, length=400)
    public String getJobType() {
        return this.jobType;
    }
    
    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    
    @Column(name="JOB_REQUIREMENTS", nullable=false, length=400)
    public String getJobRequirements() {
        return this.jobRequirements;
    }
    
    public void setJobRequirements(String jobRequirements) {
        this.jobRequirements = jobRequirements;
    }

    
    @Column(name="JOB_DESCRIPTION", nullable=false, length=2000)
    public String getJobDescription() {
        return this.jobDescription;
    }
    
    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    
    @Column(name="ACTIVE", nullable=false, length=20)
    public String getActive() {
        return this.active;
    }
    
    public void setActive(String active) {
        this.active = active;
    }




}


