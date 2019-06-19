package service;

import java.util.List;

import dao.ReadyDao;

public class ReadyService {
	ReadyDao rd= new ReadyDao();
	public List select() {
		
		return rd.select();
	}
	public List ajaxselect(String id) {
		
		return rd.ajaxselect(id);
	}
	public boolean update(String classtype, String num) {
		
		return rd.update(classtype,num);
	}
	public List selectready() {
		// TODO Auto-generated method stub
		return rd.selectready();
	}
	public boolean delete(Object[][] arrid) {
		
		return rd.delete(arrid);
	}
	public List selectlimt() {
		
		return rd.selectlimt();
	}

}
