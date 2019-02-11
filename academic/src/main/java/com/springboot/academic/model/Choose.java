package com.springboot.academic.model;

public class Choose {

    Integer chooseid;
    Integer courseid;
    Integer userid;
    String addtime;

    String realname;
    String coursename;
    Integer scorce;
    String grade;
    String semester;

    public Integer getChooseid() {
        return chooseid;
    }

    public void setChooseid(Integer chooseid) {
        this.chooseid = chooseid;
    }

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

    public String getGrade() {
    	return grade;
	}

	public void setGrade(String grade) {
    	this.grade = grade;
	}

	public String getSemester() {
    	return  semester;
	}

	public void setSemester() {
    	this.semester = semester;
	}
}
