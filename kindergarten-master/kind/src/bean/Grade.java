package bean;

public class Grade {

	private Integer id;
	private String classType;
	private String descri;

	public Grade() {
		super();
	}

	public Grade(Integer id, String classType, String descri) {
		super();
		this.id = id;
		this.classType = classType;
		this.descri = descri;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public String getDescri() {
		return descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

}
