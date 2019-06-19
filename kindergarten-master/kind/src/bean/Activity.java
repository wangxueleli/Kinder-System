package bean;

import java.io.Serializable;
import java.util.Date;

public class Activity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -289529112219316338L;
	//���ˮ��
	private Integer id;
	//����s
	private String  name;
	//�ʱ��
	private String times;    
	//�����
	private  Integer daytime;
	//������
	private  String  leader;
	//�绰
	private  String  phone;
	//�����
	private  String  description;
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the times
	 */
	public String getTimes() {
		return times;
	}
	/**
	 * @param times the times to set
	 */
	public void setTimes(String times) {
		this.times = times;
	}
	/**
	 * @return the daytime
	 */
	public Integer getDaytime() {
		return daytime;
	}
	/**
	 * @param daytime the daytime to set
	 */
	public void setDaytime(Integer daytime) {
		this.daytime = daytime;
	}
	/**
	 * @return the leader
	 */
	public String getLeader() {
		return leader;
	}
	/**
	 * @param leader the leader to set
	 */
	public void setLeader(String leader) {
		this.leader = leader;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
}
