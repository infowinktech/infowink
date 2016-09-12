package com.java.portal.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import javax.persistence.*;
import com.java.portal.entity.Role;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name = "USER", schema = "PORTALDB")
public class User implements Serializable {

	private Integer pkid;
	private Role role;
	private String firstName;
	private String lastName;
	private String password;
	private String email;

	public User() {
	}

	public User(Role role, String email) {
		this.role = role;
		this.email = email;
	}

	public User(Role role, String firstName, String lastName, String password, String email) {
		this.role = role;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.email = email;
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

	@ManyToOne(fetch = FetchType.EAGER)
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

}