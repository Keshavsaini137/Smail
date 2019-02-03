package com.star.smail.entity;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Mail {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	//from
	private String senderUsername;
	
	//to
	@NotNull(message="is required")
	@Size(min=3, message="is required")
	private String recevierUsername;
	
	@Temporal(TemporalType.DATE)
	private Date date;
	private String subject;
	private String detail;
	
	
	
	@Override
	public String toString() {
		return "Mail [senderUsername=" + senderUsername + ", recevierUsername=" + recevierUsername + ", date=" + date
				+ ", subject=" + subject + ", detail=" + detail + "]";
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getSenderUsername() {
		return senderUsername;
	}
	public void setSenderUsername(String senderUsername) {
		this.senderUsername = senderUsername;
	}
	public String getRecevierUsername() {
		return recevierUsername;
	}
	public void setRecevierUsername(String recevierUsername) {
		this.recevierUsername = recevierUsername;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
	
	
}
