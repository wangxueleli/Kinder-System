package bean;

import java.util.Date;

public class Classes {
	private Integer classNo;
	private String name;
	private String teacher;
	private String classType;
	private String stuNumber;
	private Date updateTime;

	public Integer getClassNo() {
		return classNo;
	}

	public void setClassNo(Integer classNo) {
		this.classNo = classNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public String getStuNumber() {
		return stuNumber;
	}

	public void setStuNumber(String stuNumber) {
		this.stuNumber = stuNumber;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Classes(Integer classNo, String name, String teacher, String classType, String stuNumber, Date updateTime) {
		super();
		this.classNo = classNo;
		this.name = name;
		this.teacher = teacher;
		this.classType = classType;
		this.stuNumber = stuNumber;
		this.updateTime = updateTime;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public Classes() {
		super();
	}
}
