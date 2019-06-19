package bean;

import java.util.Date;

public class Accident {
	private Integer id;
	private String  name;
	private Date date;
	private String accident;
	private String dispose;
	private String inform;
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
	 * @return the accident
	 */
	public String getAccident() {
		return accident;
	}
	/**
	 * @param accident the accident to set
	 */
	public void setAccident(String accident) {
		this.accident = accident;
	}
	/**
	 * @return the dispose
	 */
	public String getDispose() {
		return dispose;
	}
	/**
	 * @param dispose the dispose to set
	 */
	public void setDispose(String dispose) {
		this.dispose = dispose;
	}
	/**
	 * @return the inform
	 */
	public String getInform() {
		return inform;
	}
	/**
	 * @param inform the inform to set
	 */
	public void setInform(String inform) {
		this.inform = inform;
	}
	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
