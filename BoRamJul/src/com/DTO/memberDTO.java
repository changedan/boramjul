package com.DTO;

import java.util.Date;

public class memberDTO {
	
	private String mbId;
    private String mbPw;
    private String mbNick;
    private String mbGender;
    private Double mbAge;
    private Date mbJoindate;
    private String adminYn;

    public memberDTO(String mbId, String mbNick, String mbGender, Double mbAge, Date mbJoindate) {
		this.mbId = mbId;
		this.mbNick = mbNick;
		this.mbGender = mbGender;
		this.mbAge = mbAge;
		this.mbJoindate = mbJoindate;
	}

	public String getMbId() {
        return mbId;
    }

    public void setMbId(String mbId) {
        this.mbId = mbId;
    }

    public String getMbPw() {
        return mbPw;
    }

    public void setMbPw(String mbPw) {
        this.mbPw = mbPw;
    }

    public String getMbNick() {
        return mbNick;
    }

    public void setMbNick(String mbNick) {
        this.mbNick = mbNick;
    }

    public String getMbGender() {
        return mbGender;
    }

    public void setMbGender(String mbGender) {
        this.mbGender = mbGender;
    }

    public Double getMbAge() {
        return mbAge;
    }

    public void setMbAge(Double mbAge) {
        this.mbAge = mbAge;
    }

    public Date getMbJoindate() {
        return mbJoindate;
    }

    public void setMbJoindate(Date mbJoindate) {
        this.mbJoindate = mbJoindate;
    }

    public String getAdminYn() {
        return adminYn;
    }

    public void setAdminYn(String adminYn) {
        this.adminYn = adminYn;
    }


}
