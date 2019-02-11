package com.springboot.academic.model;

public class Course {
    Integer courseid;
    Integer userid;
    String coursename;
    Integer scorce;
    Integer num;
    Integer choosenum;
    String type;
    String address;
    String algorithm;
    Integer price;

    String realname;
    String chooseGrade;
    String semester;

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public Integer getScorce() {
        return scorce;
    }

    public void setScorce(Integer scorce) {
        this.scorce = scorce;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAlgorithm() {
        return algorithm;
    }

    public void setAlgorithm(String algorithm) {
        this.algorithm = algorithm;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public Integer getChoosenum() {
        return choosenum;
    }

    public void setChoosenum(Integer choosenum) {
        this.choosenum = choosenum;
    }

    public String getChooseGrade() {
        return chooseGrade;
    }

    public void setChooseGrade(String chooseGrade) {
        this.chooseGrade = chooseGrade;
    }

    public String getSemester() {
    	return semester;
	}

	public void setSemester(String semester) {
    	this.semester = semester;
	}
}
