package com.java.portal.entity;
// Generated Sep 20, 2016 3:09:31 PM by Hibernate Tools 4.3.1.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "USER", schema = "PORTALDB", catalog = "PORTALDB")
public class User implements java.io.Serializable {

	private Integer pkid;
	private Role role;
	private String firstName;
	private String lastName;
	private String password;
	private String email;
	private List<JobApplication> jobApplications = new ArrayList<JobApplication>(0);

	public User() {
	}

	public User(Role role, String email) {
		this.role = role;
		this.email = email;
	}

	public User(Role role, String firstName, String lastName, String password, String email,
			List<JobApplication> jobApplications) {
		this.role = role;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.email = email;
		this.jobApplications = jobApplications;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "PKID", unique = true, nullable = false)
	public Integer getPkid() {
		return this.pkid;
	}

	public void setPkid(Integer pkid) {
		this.pkid = pkid;
	}

	@ManyToOne(fetch = FetchType.EAGER )
	@JoinColumn(name = "ROLE_ID", nullable = false)
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Column(name = "FIRST_NAME", length = 400)
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "LAST_NAME", length = 400)
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "PASSWORD", length = 400)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "EMAIL", nullable = false, length = 400)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID")
	public List<JobApplication> getJobApplications() {
		return this.jobApplications;
	}

	public void setJobApplications(List<JobApplication> jobApplications) {
		this.jobApplications = jobApplications;
	}
	
	 public boolean equals(Object obj){
	        System.out.println("In equals");
	        if (obj instanceof User) {
	        	User user = (User) obj;
	            return (user.email.equals(this.email) && user.email == this.email);
	        } else {
	            return false;
	        }
	    }
	 
	

}
