package bean;

import java.util.Date;

public class Teacher {
	private Integer teacherId;
	private String name;
	private String age;
	private String sex;
	private String phone;
	private String img;
	private String descri;
	private Date intime;
	private Date updateTime;
	private String course;

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescri() {
		return descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getIntime() {
		return intime;
	}

	public void setIntime(Date intime) {
		this.intime = intime;
	}

	public Teacher() {

	}

	public Teacher(Integer teacherId, String name, String age, String sex, String phone, String img, String descri,
			Date intime, Date updateTime, String course) {
		super();
		this.teacherId = teacherId;
		this.name = name;
		this.age = age;
		this.sex = sex;
		this.phone = phone;
		this.img = img;
		this.descri = descri;
		this.intime = intime;
		this.updateTime = updateTime;
		this.course = course;
	}

}
