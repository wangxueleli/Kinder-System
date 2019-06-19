package dao;

import bean.school;
import util.C3P0Utils;

public class Schooldao {
	
	
	public school select() {
		String sql ="select * from t_school";
		return C3P0Utils.beanHandler(sql, school.class);
	}
	/**
	 * 添加新学校
	 * @param name
	 * @param minidec
	 * @param leader
	 * @param tel
	 * @param address
	 * @param dec
	 * @return
	 */
	public boolean addtext(String name, String minidec, String leader, String tel, String address, String bigdec) {
		String sql = "insert into t_school(name,minidec,leader,tel,address,bigdec) values(?,?,?,?,?,?)";
		return C3P0Utils.update(sql, name, minidec, leader, tel, address, bigdec);		
	}
	
	public boolean updatetext(String id,String name, String minidec, String leader, String tel, String address, String bigdec) {
		String sql = "update t_school set name=?, minidec=?, leader=?, tel=?, address=?, bigdec=? where id=?";
		return C3P0Utils.update(sql, name, minidec, leader, tel, address, bigdec,id);		
	}
}
