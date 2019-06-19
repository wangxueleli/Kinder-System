package bean;

import java.util.Date;

public class Lessons {
	private Integer id;
	private String weekTime;
	private String poTime;
	private String classType;
	private String className;
	private String teacherName;
	private String courseName;
	private Date updateTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getWeekTime() {
		return weekTime;
	}

	public void setWeekTime(String weekTime) {
		this.weekTime = weekTime;
	}

	public String getPoTime() {
		return poTime;
	}

	public void setPoTime(String poTime) {
		this.poTime = poTime;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Lessons(Integer id, String weekTime, String poTime, String classType, String className, String teacherName,
			String courseName, Date updateTime) {
		super();
		this.id = id;
		this.weekTime = weekTime;
		this.poTime = poTime;
		this.classType = classType;
		this.className = className;
		this.teacherName = teacherName;
		this.courseName = courseName;
		this.updateTime = updateTime;
	}

	public Lessons() {
	}
}
