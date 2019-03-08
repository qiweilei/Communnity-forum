package com.webproject.feeds.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "comment")
public class Comment {
	private Long id;
	private Post post;
	private String body;
	private User user;
	private Timestamp dateCreated;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "post_id",referencedColumnName="id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	@Column(columnDefinition="text")
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id",referencedColumnName="id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Timestamp getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	   
}
