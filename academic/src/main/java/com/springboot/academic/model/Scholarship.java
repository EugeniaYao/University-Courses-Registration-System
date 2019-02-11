package com.springboot.academic.model;

public class Scholarship {
    Integer scholarshipid;
    String scholarshipname;
    String price;
    String ptype;
    String type;

    public Integer getScholarshipid() {
        return scholarshipid;
    }

    public void setScholarshipid(Integer scholarshipid) {
        this.scholarshipid = scholarshipid;
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

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
