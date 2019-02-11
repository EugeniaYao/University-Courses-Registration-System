package com.springboot.academic.model;

public class Achieve {

    Integer achieveid;
    Integer userid;
    Integer scholarshipid;
    String addtime;

    String realname;
    String scholarshipname;
    String price;

    public Integer getAchieveid() {
        return achieveid;
    }

    public void setAchieveid(Integer achieveid) {
        this.achieveid = achieveid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getScholarshipid() {
        return scholarshipid;
    }

    public void setScholarshipid(Integer scholarshipid) {
        this.scholarshipid = scholarshipid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getScholarshipname() {
        return scholarshipname;
    }

    public void setScholarshipname(String scholarshipname) {
        this.scholarshipname = scholarshipname;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
