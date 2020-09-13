package com.entities;

import java.util.List;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
public class Register {
	private int id;
	private String username;
	@Id
	private String email;
	private String password;
	private String gender;
	@OneToMany(mappedBy="user")
	private List<Notes> notes;
	public Register( String username, String email, String password, String gender,List notes) {
		super();
		this.id = new Random().nextInt(10000);
		this.username = username;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.notes=notes;
	}
	public Register( String username, String email, String password, String gender) {
		super();
		this.id = new Random().nextInt(10000);
		this.username = username;
		this.email = email;
		this.password = password;
		this.gender = gender;
	}
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public List<Notes> getNotes() {
		return notes;
	}

	public void setNotes(List<Notes> notes) {
		this.notes = notes;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	

}
