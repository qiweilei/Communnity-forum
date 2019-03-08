package com.webproject.feeds.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "post")
public class Post {
	
	private Long id;
    private byte[] picture;
	private String title;
	private String body;
	private Timestamp dateCreated;
//	private Category category;
	private User user;
	private Long commentCount;
	private Long hitCount;
	private long likeCount;
	private long unlikeCount;
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	@Lob
	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	@Column(columnDefinition="text")
	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Timestamp getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

//	public Category getCategory() {
//		return category;
//	}
//
//	public void setCategory(Category category) {
//		this.category = category;
//	}
//	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id",referencedColumnName="id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Long getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Long commentCount) {
		this.commentCount = commentCount;
	}

	public Long getHitCount() {
		return hitCount;
	}

	public void setHitCount(Long hitCount) {
		this.hitCount = hitCount;
	}
		

	public long getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(long likeCount) {
		this.likeCount = likeCount;
	}

	public long getUnlikeCount() {
		return unlikeCount;
	}

	public void setUnlikeCount(long unlikeCount) {
		this.unlikeCount = unlikeCount;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", body=" + body + ", dateCreated=" + dateCreated + ", category="
				+ ", user=" + user.getLastname() + ", commentCount=" + commentCount + ", hitCount=" + hitCount + "]";
	}
	
	
	
	
	
}
