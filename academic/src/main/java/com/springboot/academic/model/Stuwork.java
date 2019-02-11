package com.springboot.academic.model;

public class Stuwork {
    Integer stuworkid;
    Integer stuid;
    Integer homeworkid;
    String addtime;
    String filepath;
    Integer scorce;

    String realname;
    String title;
    String type;

    public Integer getStuworkid() {
        return stuworkid;
    }

    public void setStuworkid(Integer stuworkid) {
        this.stuworkid = stuworkid;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public Integer getHomeworkid() {
        return homeworkid;
    }

    public void setHomeworkid(Integer homeworkid) {
        this.homeworkid = homeworkid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public Integer getScorce() {
        return scorce;
    }

    public void setScorce(Integer scorce) {
        this.scorce = scorce;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
    	return type;
	}

	public void setType(String type) {
    	this.type = type;
	}
}
