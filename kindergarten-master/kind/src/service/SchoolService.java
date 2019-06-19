package service;

import bean.school;
import dao.Schooldao;

public class SchoolService {
	Schooldao sl= new Schooldao();
	public school seclet() {
		return sl.select();
}

	public boolean addtext(String name, String minidec, String leader, String tel, String address, String bigdec) {
		return sl.addtext(name, minidec, leader, tel, address, bigdec);		
	}
	public boolean updatetext(String id,String name, String minidec, String leader, String tel, String address, String bigdec) {
		return sl.updatetext(id,name, minidec, leader, tel, address, bigdec);		
	}
}
