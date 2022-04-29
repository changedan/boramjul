package com.vo;

import java.util.Date;

// ȸ�� ���� ���̺� 
public class TMemberDTO {

    // ȸ�� ���̵� 
    private String mbId;

    // ȸ�� ��й�ȣ 
    private String mbPw;

    // ȸ�� �г��� 
    private String mbNick;

    // ȸ�� ���� 
    private String mbGender;

    // ȸ�� ���� 
    private Double mbAge;

    // ȸ�� �������� 
    private Date mbJoindate;

    // ������ ���� 
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

    // TMember �� ����
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