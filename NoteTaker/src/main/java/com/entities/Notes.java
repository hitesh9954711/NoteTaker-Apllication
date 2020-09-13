package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class Notes {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String title;
	@Column(length=500)
	private String content;
	private Date date;
	@ManyToOne
	private Register user;

	public Notes(String title, String content,Register user) {
		super();
		this.id = new Random().nextInt(1000);
		this.title = title;

		this.content = content;
		this.date = new Date();
		this.user=user;
	}

	public Notes() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Register getUser() {
		return user;
	}

	public void setUser(Register user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
