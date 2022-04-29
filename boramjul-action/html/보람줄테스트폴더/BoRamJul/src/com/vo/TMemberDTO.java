package com.vo;

import java.util.Date;

// 회원 정보 테이블 
public class TMemberDTO {

    // 회원 아이디 
    private String mbId;

    // 회원 비밀번호 
    private String mbPw;

    // 회원 닉네임 
    private String mbNick;

    // 회원 성별 
    private String mbGender;

    // 회원 나이 
    private Double mbAge;

    // 회원 가입일자 
    private Date mbJoindate;

    // 관리자 여부 
    private String adminYn;

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

    // TMember 모델 복사
    public void CopyData(TMemberDTO param)
    {
        this.mbId = param.getMbId();
        this.mbPw = param.getMbPw();
        this.mbNick = param.getMbNick();
        this.mbGender = param.getMbGender();
        this.mbAge = param.getMbAge();
        this.mbJoindate = param.getMbJoindate();
        this.adminYn = param.getAdminYn();
    }
}